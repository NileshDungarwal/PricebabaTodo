package com.pricebaba.todo.android;

import com.pricebaba.todo.R;
import com.pricebaba.todo.appvariables.GlobalVariables;
import com.pricebaba.todo.model.Login;
import com.pricebaba.todo.model.LoginResponse;
import com.pricebaba.todo.util.JsonHelper;
import com.pricebaba.todo.util.NetworkHelper;

import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends Activity {

	EditText userNameEditText;
	EditText passwordEditText;
	TextView errorTextView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		setTitle("Pricebaba Todo");
		userNameEditText = (EditText) findViewById(R.id.userNameEditText);
		passwordEditText = (EditText) findViewById(R.id.passwordEditText);
		errorTextView = (TextView) findViewById(R.id.errorTextView);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_main, menu);
		return true;
	}

	public void butLoginOnClick(View view) {
		Login login = new Login();
		login.setUsername(userNameEditText.getText() + "");
		login.setPassword(passwordEditText.getText() + "");
		login.setClient_id(GlobalVariables.CLIENTID);
		login.setClient_secret(GlobalVariables.CLIENTSECRET);
		login.setGrant_type(GlobalVariables.GRANTTYPE);
		new LoginTask().execute(login);
	}

	public void butRegisterOnClick(View view) {
		Intent i = new Intent(this, RegisterActivity.class);
		startActivity(i);
	}

	public void startTodoActivity() {
		Intent i = new Intent(this, TodoActivity.class);
		startActivity(i);
	}

	private class LoginTask extends AsyncTask<Login, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(MainActivity.this, "", "Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(Login... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.login(params[0]);
		}

		@Override
		protected void onPostExecute(String responseJson) {
			progress.cancel();
			Log.v("Response JSON", "response json " + responseJson);
			LoginResponse loginResponse = JsonHelper
					.ConvertToLoginResponse(responseJson);
			if (loginResponse == null) {
				errorTextView.setVisibility(View.VISIBLE);
			} else if (loginResponse.getAccess_token() != null) {
				new GetUserIdTask().execute(loginResponse.getAccess_token());
				SharedPreferences settings = getSharedPreferences(
						GlobalVariables.SHAREDPREFERENCE, 0);
				SharedPreferences.Editor editor = settings.edit();
				editor.putString(GlobalVariables.ACCESSTOKEN,
						loginResponse.getAccess_token());
				editor.putString(GlobalVariables.TOKENTYPE,
						loginResponse.getToken_type());
				editor.putLong(GlobalVariables.EXPIRESIN,
						loginResponse.getExpires_in());
				editor.commit();
			} else {
				Log.v("Response", "Incorrect Credentials");
			}
		}
	}

	private class GetUserIdTask extends AsyncTask<String, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(MainActivity.this, "", "Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(String... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.getJSON(GlobalVariables.GETUSERIDURI, 30000,
					params[0]);
		}

		@Override
		protected void onPostExecute(String responseJson) {
			Log.v("Response JSON", "response json userId" + responseJson);
			SharedPreferences settings = getSharedPreferences(
					GlobalVariables.SHAREDPREFERENCE, 0);
			SharedPreferences.Editor editor = settings.edit();
			editor.putString(GlobalVariables.USERID, responseJson);
			editor.commit();
			startTodoActivity();

		}
	}

}
