package com.pricebaba.todo.android;

import java.util.List;

import com.pricebaba.todo.R;
import com.pricebaba.todo.R.layout;
import com.pricebaba.todo.R.menu;
import com.pricebaba.todo.appvariables.GlobalVariables;
import com.pricebaba.todo.model.Login;
import com.pricebaba.todo.model.LoginResponse;
import com.pricebaba.todo.model.Todo;
import com.pricebaba.todo.util.JsonHelper;
import com.pricebaba.todo.util.NetworkHelper;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

public class TodoActivity extends ListActivity {

	private TodoAdapter todoAdapter;
	List<Todo> todos;
	SharedPreferences settings;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setTitle("All My Todos");
		setContentView(R.layout.activity_todo);
		todoAdapter=new TodoAdapter(this, R.layout.activity_todo,todos);
		settings = getSharedPreferences(GlobalVariables.SHAREDPREFERENCE, 0);
		//ListView listView=findViewById(R.id.)
		new GetAllTodoTask().execute(settings.getString(GlobalVariables.USERID, null),settings.getString(GlobalVariables.ACCESSTOKEN, null));
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_todo, menu);
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
		startActivity(new Intent(this, AddTodoActivity.class));
	}

	@Override
	protected void onListItemClick(ListView l, View v, int position, long id) {
		Intent intent = new Intent(this, AddTodoActivity.class);
		Todo todo=todos.get(position);
		intent.putExtra(GlobalVariables.TODOID, todo.getId());
		intent.putExtra(GlobalVariables.TITLE, todo.getTitle());
		intent.putExtra(GlobalVariables.COMPLETED, todo.getCompleted());
		startActivity(intent);
	}
	
	public void startMainActivity() {
		Intent i = new Intent(this, MainActivity.class);
		startActivity(i);
	}
	
	void displayTodos(List<Todo> todos){
		this.todoAdapter=new TodoAdapter(this, R.layout.activity_todo,todos);
		setListAdapter(this.todoAdapter);
	}
	
	private class GetAllTodoTask extends AsyncTask<String, Void, String>{
    	ProgressDialog progress;
    	
    	@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(TodoActivity.this, "", "Loading...");
			super.onPreExecute();
		}
    	
		@Override
		protected String doInBackground(String... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.getJSON(GlobalVariables.URI+"/todos/"+params[0], 3000, params[1] );
		}
    	
		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
		Log.v("Response JSON", "response json todo "+responseJson);
		todos=JsonHelper.ConvertToTodosListObject(responseJson);
		displayTodos(todos);
		}
    }
	
	private class LogoutTask extends AsyncTask<String, Void, String>{
    	ProgressDialog progress;
    	
    	@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(TodoActivity.this, "", "Loading...");
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
