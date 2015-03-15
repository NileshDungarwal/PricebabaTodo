<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTodoTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		//
		Schema::table('todos', function($table)
		{
	   		$table->bigInteger('userId');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		//
		//DB::statement('ALTER TABLE `todos` ADD `userId` INTEGER UNSIGNED NULL;');
	}

}
