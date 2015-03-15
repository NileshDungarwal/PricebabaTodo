package com.pricebaba.todo.android;

import com.pricebaba.todo.R;
import com.pricebaba.todo.R.layout;
import com.pricebaba.todo.R.menu;
import com.pricebaba.todo.appvariables.GlobalVariables;
import com.pricebaba.todo.model.Todo;
import com.pricebaba.todo.util.JsonHelper;
import com.pricebaba.todo.util.NetworkHelper;

import android.opengl.Visibility;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

public class AddTodoActivity extends Activity {

	SharedPreferences settings;
	String accessToken;
	EditText titleEditText;
	Spinner spinner;
	Button addTodoButton,deleteTodoButton;
	Intent intent;
	boolean isEdit = false;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setTitle("Add Todo");
		setContentView(R.layout.activity_add_todo);
		settings = getSharedPreferences(
				GlobalVariables.SHAREDPREFERENCE, 0);

		accessToken = settings.getString(GlobalVariables.ACCESSTOKEN, null);
		titleEditText = (EditText) findViewById(R.id.titleEditText);
		spinner = (Spinner) findViewById(R.id.isCompletedSpinner);
		addTodoButton = (Button) findViewById(R.id.AddTodoButton);

		deleteTodoButton = (Button) findViewById(R.id.DeleteTodoButton);
		
		ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
				this, R.array.isCompletedArray,
				android.R.layout.simple_spinner_item);
		adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
		spinner.setAdapter(adapter);
		intent = getIntent();
		String title = intent.getStringExtra(GlobalVariables.TITLE);
		if (title != null) {
			isEdit = true;
			deleteTodoButton.setVisibility(View.VISIBLE);
			titleEditText.setText(title);
			String completed = intent.getStringExtra(GlobalVariables.COMPLETED);
			int position = adapter.getPosition(completed);
			spinner.setSelection(position);
			addTodoButton.setText("Edit Todo");
		}
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_add_todo, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
		case R.id.logout:
			new LogoutTask().execute(settings.getString(GlobalVariables.ACCESSTOKEN, null));
			break;
//		case R.id.help:
//			startActivity(new Intent(this, HelpHomeActivity.class));
//			break;
		}
		return super.onOptionsItemSelected(item);
	}
	
	public void AddTodoButtonClick(View view) {
		Todo todo = new Todo();
		todo.setTitle(titleEditText.getText() + "");
		todo.setCompleted(spinner.getSelectedItem() + "");
		todo.setUserId(settings.getString(GlobalVariables.USERID, null));
		String json = JsonHelper.ConvertToJson(todo);
		if (isEdit) {
			long todoId = intent.getLongExtra(GlobalVariables.TODOID,0);
			new EditTodoTask().execute(json,todoId+"");
		} else {
			new AddTodoTask().execute(json);
		}
	}

	public void DeleteTodoButtonClick(View view){
		long todoId = intent.getLongExtra(GlobalVariables.TODOID,0);
		new DeleteTodoTask().execute(todoId);
	}
	private class AddTodoTask extends AsyncTask<String, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(AddTodoActivity.this, "",
					"Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(String... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.postJson(params[0], accessToken);
		}

		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
			Log.v("Response JSON", "response json todo " + responseJson);
			Intent intent = getIntent();
			intent.setClass(getApplicationContext(), TodoActivity.class);
			startActivity(intent);
		}
	}

	private class EditTodoTask extends AsyncTask<String, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(AddTodoActivity.this, "",
					"Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(String... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.putJson(params[0], params[1], accessToken);
		}

		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
			Log.v("Response JSON", "response json todo " + responseJson);
			Intent intent = getIntent();
			intent.setClass(getApplicationContext(), TodoActivity.class);
			startActivity(intent);
		}
	}

	
	private class DeleteTodoTask extends AsyncTask<Long, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(AddTodoActivity.this, "",
					"Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(Long... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.deleteTodo(params[0]+"", accessToken);
		}

		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
			Log.v("Response JSON", "response json todo " + responseJson);
			Intent intent = getIntent();
			intent.setClass(getApplicationContext(), TodoActivity.class);
			startActivity(intent);
		}
	}

	public void startMainActivity() {
		Intent i = new Intent(this, MainActivity.class);
		startActivity(i);
	}
	
	private class LogoutTask extends AsyncTask<String, Void, String>{
    	ProgressDialog progress;
    	
    	@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(AddTodoActivity.this, "", "Loading...");
			super.onPreExecute();
		}
    	
		@Override
		protected String doInBackground(String... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.getJSON(GlobalVariables.LOGOUTURI, 3000, params[0] );
		}
    	
		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
		Log.v("Response JSON", "response json todo "+responseJson);
		startMainActivity();
		}
    }
	
}
