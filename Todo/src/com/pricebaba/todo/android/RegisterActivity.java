package com.pricebaba.todo.android;

import com.pricebaba.todo.R;
import com.pricebaba.todo.R.layout;
import com.pricebaba.todo.R.menu;
import com.pricebaba.todo.appvariables.GlobalVariables;
import com.pricebaba.todo.model.Login;
import com.pricebaba.todo.model.LoginResponse;
import com.pricebaba.todo.model.Register;
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
import android.widget.Toast;

public class RegisterActivity extends Activity {

	EditText nameEditText;
	EditText passwordEditText;
	EditText emailEditText;
	EditText cPasswordEditText;
	TextView errorTextView;
	TextView errorPasswordTextView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_register);
		setTitle("Register");
		nameEditText = (EditText) findViewById(R.id.nameEditText);
		passwordEditText = (EditText) findViewById(R.id.passwordEditText);
		emailEditText = (EditText) findViewById(R.id.emailEditText);
		cPasswordEditText = (EditText) findViewById(R.id.confirmPasswordEditText);
		errorTextView = (TextView) findViewById(R.id.errorTextView);
		errorPasswordTextView = (TextView) findViewById(R.id.errorTextView);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.activity_register, menu);
		return true;
	}

	public void butRegisterOnClick(View view) {
		String email = emailEditText.getText() + "";
		String name = nameEditText.getText() + "";
		String password = passwordEditText.getText() + "";
		String cPassword = cPasswordEditText.getText() + "";
		if (email == null || name == null || password == null
				|| cPassword == null) {
			errorTextView.setVisibility(View.VISIBLE);
			errorPasswordTextView.setVisibility(View.INVISIBLE);
		} else {
			if (!password.equals(cPassword)) {
				errorTextView.setVisibility(View.INVISIBLE);
				errorPasswordTextView.setVisibility(View.VISIBLE);
			} else {
				Register register = new Register();
				register.setEmail(email);
				register.setName(name);
				register.setPassword(password);
				register.setPassword_confirmation(cPassword);
				new RegisterTask().execute(register);
			}
		}
	}

	private class RegisterTask extends AsyncTask<Register, Void, String> {
		ProgressDialog progress;

		@Override
		protected void onPreExecute() {
			progress = ProgressDialog.show(RegisterActivity.this, "",
					"Loading...");
			super.onPreExecute();
		}

		@Override
		protected String doInBackground(Register... params) {
			// TODO Auto-generated method stub
			return NetworkHelper.postRegister(JsonHelper
					.ConvertToJson(params[0]));
		}

		@Override
		protected void onPostExecute(String responseJson) {
			Log.v("Response JSON", "response json register " + responseJson);
			Intent intent = getIntent();
			intent.setClass(getApplicationContext(), MainActivity.class);
			startActivity(intent);
		}
	}
}
