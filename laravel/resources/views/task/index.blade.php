@extends('layouts.default')

@section('content')
	<h1>Hello Laravel</h1>
	<!-- @if(isset($name))
	{{ $name }}
	@else
	No Name Given
	@endif -->

	<br/>
	

<ul>
	@foreach($tasks as $task)
<li> 
	<a href="{{URL::Route('task',$task->id)}}">{{$task->name}}</a> </li>
	@endforeach
</ul>
@endsection