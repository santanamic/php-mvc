<?php

namespace App\Controllers;

use \Core\View;
use \App\Models;

/**
 * Home controller
 *
 * PHP version 7.0
 */
class Login extends \Core\Controller
{

    /**
     * Show the index page
     *
     * @return void
     */
    public function indexAction()
    {
		$user = new \App\Models\User();
		
        View::renderTemplate('Login/index.html', [ 
			'isConnected'    => $user->getUser(),
		]);
    }
}
