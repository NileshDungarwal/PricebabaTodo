package com.pricebaba.todo.util;

import java.lang.reflect.Type;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.pricebaba.todo.model.LoginResponse;
import com.pricebaba.todo.model.Todo;

public class JsonHelper {
	public static String ConvertToJson(Object object) {
		Gson gson = new Gson();
		return gson.toJson(object);
	}
	
	public static Object ConvertToObject(String json) {
		Type type = new TypeToken<Object>() {
		}.getType();
		return new Gson().fromJson(json, type);
	}
	
	public static LoginResponse ConvertToLoginResponse(String json) {
		Type type = new TypeToken<LoginResponse>() {
		}.getType();
		return new Gson().fromJson(json, type);
	}
	
	public static Long ConvertToLong(String json) {
		Type type = new TypeToken<Long>() {
		}.getType();
		return new Gson().fromJson(json, type);
	}
	
	public static List<Todo> ConvertToTodosListObject(String json) {
		Type type = new TypeToken<List<Todo>>() {
		}.getType();
		List<Todo> todos = new Gson().fromJson(json, type);
		return todos;
	}
}
