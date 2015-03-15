<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

$router->post('oauth/access_token', function() {
    return Response::json(Authorizer::issueAccessToken());
});


$router->get('/', 'WelcomeController@index');

$router->get('home', 'HomeController@index');

Route::group(array('before' => 'oauth'), function() {
Route::get('user/self','UserController@Index');
Route::get('todos','TodoController@index');
Route::get('todos/{id}',[ 
 	'as'=>'todos',
 	'uses'=>'TodoController@index'
 	]);
Route::post('todos','TodoController@store');
Route::put('todos/{id}','TodoController@update');
Route::delete('todos/{id}','TodoController@delete');
});

$router->controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);
