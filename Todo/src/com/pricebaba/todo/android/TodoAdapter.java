package com.pricebaba.todo.android;

import java.util.List;

import com.pricebaba.todo.R;
import com.pricebaba.todo.model.Todo;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.TextView;

public class TodoAdapter extends ArrayAdapter<Todo>{

	List<Todo> todos;
	Context context;
	
	public TodoAdapter(Context context, int textViewResourceId, List<Todo> todos) {
		super(context, textViewResourceId);
		// TODO Auto-generated constructor stub
		this.context=context;
		this.todos=todos;
	}

	@Override 
	public int getCount() { 
		return todos.size();
	}
	
	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		View v = convertView;

		LayoutInflater vi = null;
		if (v == null) {
			vi = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
			v = vi.inflate(R.layout.row_todo, null);
		}
		Todo todo = todos.get(position);
		TextView titleTextView = (TextView) v.findViewById(R.id.titleTextView);
//		CheckBox completedCheckBox = (CheckBox) v.findViewById(R.id.completedCheckBox);
		if(todo.getCompleted().equals("Yes")){
//			completedCheckBox.setChecked(true);
		}
		else{
			v.setBackgroundColor(v.getResources().getColor(R.color.lightRed));
	}
		Log.v("Title", "Title"+ todo.getTitle());
		titleTextView.setText(todo.getTitle());
		return v;
	}
}
