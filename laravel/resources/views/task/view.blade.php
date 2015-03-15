
@extends('layouts.default')

@section('content')

	<h1>{{$task->name}}</h1>
	<p>{{$task->description}}</p>
	<p><small>{{$task->updated_at}}</small></p>
@endsection