<?php 
namespace App\Http\Controllers;
use App\Http\Models\Todo;
use Log;
use Response;
use Eloquent;
use Input;
use Request;

class TodoController extends Controller{

public $restful=true;

	public function Index($id=null){
		Log::info('The id is: '.$id);
		if(is_null($id)){
			return Response::json(Todo::all());
		}
		else{
			$todos=Todo::where('userId', '=', $id)->get();
			if(is_null($todos)){
				return Response::json('Todo not found',404);
			}
			else{
				return Response::json($todos);
			}
		}
		// return view('task.index',  array('name' => 'Nilesh Dungarwal'))->with('description','I have lot of work')->with('title','All tasks');
		// return view('task.index')
		// ->with('title','All Tasks')
		// //->with('tasks',Task::all())
		// ->with('tasks',Task::orderBy('name','desc')->get());
	}

	public function store(){
		$todo = new Todo();
		$todo->userId=Request::get('userId');
		Log::info("store userId ".Request::get('userId'));
		$todo->title=Request::get('title');
		$todo->completed= Request::get('completed');
		$todo->save();
		return Response::json($todo,200);
	}

	public function update($id){
		$todo = Todo::find($id);
		if(is_null($todo)){
			return Response::json('Todo not found', 404);
		}
		$todo->userId=Request::get('userId');
		$todo->title=Request::get('title');
		$todo->completed= Request::get('completed');
		$todo->save();	
		return Response::json($todo,200);
	}

	public function delete($id=null){
		$intId=(int)$id;
		Log::info("The id is hello: ".$id);
		$todo = Todo::find($intId);
		Log::info("The id is hello: ".$todo);
		if(is_null($todo)){
			return Response::json('Todo not found',404);
		}
		$deletedTodo = $todo;
		$todo->delete();
		return Response::json($deletedTodo,200);
	}

public function View($id){
	Log::info('The id is: '.$id);
	Log::info('The task is: '.Todo::find($id));
		// return view('task.index',  array('name' => 'Nilesh Dungarwal'))->with('description','I have lot of work')->with('title','All tasks');
		return view('task.view')
		->with('title','Task View Page')
		//->with('tasks',Task::all())
		->with('task',Task::find($id));
	}
}

?>