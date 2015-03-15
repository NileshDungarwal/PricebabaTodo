package com.pricebaba.todo.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;

import com.pricebaba.todo.appvariables.GlobalVariables;
import com.pricebaba.todo.model.Login;

import android.content.SharedPreferences;
import android.util.Log;

public class NetworkHelper {
	public static String getJSON(String url, int timeout, String accessKey) {
		String result;
		Log.v("Response Json", "response json "+url+" access key "+accessKey);
		for (int i = 0; i < 10; i++) {
			try {
				result = getJSONSingleCall(url, timeout, accessKey);
				if (result == null)
					continue;
				return result;
			} catch (Exception e) {
				continue;
			}
		}
		return null;
	}

	public static String getJSONSingleCall(String url, int timeout, String accessKey)
			throws Exception {
		BufferedReader br;
		StringBuilder sb;
		String line;
		HttpURLConnection c;
		try {
			URL u = new URL(url);
			c = (HttpURLConnection) u.openConnection();
			if (c == null)
				Log.v("Http", "null");
			c.setRequestProperty("Authorization", "Bearer "+accessKey);
			c.setRequestMethod("GET");
			c.setRequestProperty("Content-length", "0");
			c.setUseCaches(false);
			c.setAllowUserInteraction(false);
			c.setConnectTimeout(timeout);
			c.setReadTimeout(timeout);
			c.connect();
			int status = c.getResponseCode();
			Log.v("status", "Connection try 1 : " + status);
			switch (status) {
			case 200:
			case 201:
				br = new BufferedReader(new InputStreamReader(
						c.getInputStream()));
				sb = new StringBuilder();
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				System.out.println("Response data "+sb.toString());
				return sb.toString();
			default:
				throw new Exception("200 not returned");
			}

		} catch (MalformedURLException ex) {
		} catch (IOException ex) {
		}
		return null;
	}
	
	
	public static String login(Login login) {
		try {
			return postLogin(JsonHelper.ConvertToJson(login));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static String postLogin(String json)
			throws UnsupportedEncodingException {
		Log.v("JSON: ",json);
		HttpPost post = new HttpPost(GlobalVariables.LOGINURI);
		System.out.println("URL: " + GlobalVariables.LOGINURI);
		StringEntity params = new StringEntity(json);
		post.addHeader("content-type", "application/json");
		post.setEntity(params);
		HttpClient client = new DefaultHttpClient();
		HttpConnectionParams.setConnectionTimeout(client.getParams(), 10000); // Timeout
																				// Limit
		HttpResponse response;
		try {
			response = client.execute(post);
			Log.v("NetworkHelperResponse", "Response HHH "+response + "");
			/* Checking response */
			InputStream ips = response.getEntity().getContent();
			BufferedReader buf = new BufferedReader(new InputStreamReader(ips,
					"UTF-8"));
			System.out.println(response.getStatusLine().getStatusCode());
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				throw new Exception(response.getStatusLine().getReasonPhrase());
			}
			StringBuilder sb = new StringBuilder();
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);

			}
			buf.close();
			ips.close();
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			Log.v("NetworkHelper", "Cannot Establish Connection");
		}
		return null;
	}
	
	
	public static String postRegister(String json)
		 {
		Log.v("JSON: ",json);
		HttpPost post = new HttpPost(GlobalVariables.REGISTERURI);
		System.out.println("URL: " + GlobalVariables.REGISTERURI);
		StringEntity params=null;
		try {
			params = new StringEntity(json);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		post.addHeader("content-type", "application/json");
		post.setEntity(params);
		HttpClient client = new DefaultHttpClient();
		HttpConnectionParams.setConnectionTimeout(client.getParams(), 10000); // Timeout
																				// Limit
		HttpResponse response;
		try {
			response = client.execute(post);
			Log.v("NetworkHelperResponse", "Response HHH "+response + "");
			/* Checking response */
			InputStream ips = response.getEntity().getContent();
			BufferedReader buf = new BufferedReader(new InputStreamReader(ips,
					"UTF-8"));
			System.out.println(response.getStatusLine().getStatusCode());
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				throw new Exception(response.getStatusLine().getReasonPhrase());
			}
			StringBuilder sb = new StringBuilder();
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);

			}
			buf.close();
			ips.close();
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			Log.v("NetworkHelper", "Cannot Establish Connection");
		}
		return null;
	}
	
	
	public static String postJson(String json, String accessToken){
			
		HttpPost post = new HttpPost(GlobalVariables.URI + "/todos");
		System.out.println("URL: " + GlobalVariables.URI + "/todos");
		StringEntity params = null;
		try {
			params = new StringEntity(json);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		post.addHeader("content-type", "application/json");
		if (accessToken != null) {
			post.addHeader("Authorization", "Bearer " + accessToken);
		}
		post.setEntity(params);
		HttpClient client = new DefaultHttpClient();
		HttpConnectionParams.setConnectionTimeout(client.getParams(), 10000); // Timeout
																				// Limit
		HttpResponse response;
		try {
			response = client.execute(post);
			Log.v("NetworkHelperResponse", response + "");
			/* Checking response */
			InputStream ips = response.getEntity().getContent();
			BufferedReader buf = new BufferedReader(new InputStreamReader(ips,
					"UTF-8"));
			System.out.println(response.getStatusLine().getStatusCode());
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				throw new Exception(response.getStatusLine().getReasonPhrase());
			}
			StringBuilder sb = new StringBuilder();
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);

			}
			buf.close();
			ips.close();
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			Log.v("NetworkHelper", "Cannot Establish Connection");
		}
		return null;
	}

	
	public static String putJson(String json, String todoId, String accessToken){
		
		HttpPut put = new HttpPut(GlobalVariables.URI + "/todos/"+todoId);
		System.out.println("URL: " + GlobalVariables.URI + "/todos/"+todoId);
		StringEntity params = null;
		try {
			params = new StringEntity(json);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		put.addHeader("content-type", "application/json");
		if (accessToken != null) {
			put.addHeader("Authorization", "Bearer " + accessToken);
		}
		put.setEntity(params);
		HttpClient client = new DefaultHttpClient();
		HttpConnectionParams.setConnectionTimeout(client.getParams(), 10000); // Timeout
																				// Limit
		HttpResponse response;
		try {
			response = client.execute(put);
			Log.v("NetworkHelperResponse", response + " ok");
			/* Checking response */
			InputStream ips = response.getEntity().getContent();
			BufferedReader buf = new BufferedReader(new InputStreamReader(ips,
					"UTF-8"));
			System.out.println(response.getStatusLine().getStatusCode());
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				throw new Exception(response.getStatusLine().getReasonPhrase());
			}
			StringBuilder sb = new StringBuilder();
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);

			}
			buf.close();
			ips.close();
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			Log.v("NetworkHelper", "Cannot Establish Connection");
		}
		return null;
	}
	
public static String deleteTodo(String todoId, String accessToken){
		
		HttpDelete delete = new HttpDelete(GlobalVariables.URI + "/todos/"+todoId);
		System.out.println("URL: " + GlobalVariables.URI + "/todos/"+todoId);
		delete.addHeader("content-type", "application/json");
		if (accessToken != null) {
			delete.addHeader("Authorization", "Bearer " + accessToken);
		}
		HttpClient client = new DefaultHttpClient();
		HttpConnectionParams.setConnectionTimeout(client.getParams(), 10000); // Timeout
																				// Limit
		HttpResponse response;
		try {
			response = client.execute(delete);
			Log.v("NetworkHelperResponse", response + " ok");
			/* Checking response */
			InputStream ips = response.getEntity().getContent();
			BufferedReader buf = new BufferedReader(new InputStreamReader(ips,
					"UTF-8"));
			System.out.println(response.getStatusLine().getStatusCode());
			if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) {
				throw new Exception(response.getStatusLine().getReasonPhrase());
			}
			StringBuilder sb = new StringBuilder();
			String s;
			while (true) {
				s = buf.readLine();
				if (s == null || s.length() == 0)
					break;
				sb.append(s);

			}
			buf.close();
			ips.close();
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			Log.v("NetworkHelper", "Cannot Establish Connection");
		}
		return null;
	}

}
