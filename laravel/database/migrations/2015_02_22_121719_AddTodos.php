<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddTodos extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		DB::table('todos')->insert(array(
			'title' => 'First Todo',
			'completed'=>'no',
			'created_at'=>date('Y-m-d H:m:s'),
			'updated_at'=>date('Y-m-d H:m:s')
			 ));
		DB::table('todos')->insert(array(
			'title' => 'Second Todo',
			'completed'=>'no',
			'created_at'=>date('Y-m-d H:m:s'),
			'updated_at'=>date('Y-m-d H:m:s')
		));
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		DB::table('todos')->where('id','=','1')->delete();
		DB::table('todos')->where('id','=','2')->delete();
	}

}
