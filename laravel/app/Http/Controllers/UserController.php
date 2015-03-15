<?php 
namespace App\Http\Controllers;
use App\Http\Models\Todo;
use Log;
use Response;
use Eloquent;
use Input;
use Request;
use Authorizer;

class UserController extends Controller{

public $restful=true;

	public function Index(){
		$user_id = Authorizer::getResourceOwnerId();
		Log::info('The userid is: '.$user_id);
		return $user_id;
		}
}

?>