<?php

namespace App\Controllers;

use \Core\View;
use \App\Models;

/**
 * Home controller
 *
 * PHP version 7.0
 */
class Profile extends \Core\Controller
{

    /**
     * Show the index page
     *
     * @return void
     */
    public function indexAction()
    {		
        View::renderTemplate('Profile/index.html', [ 
			'data'    => [],
		]);
    }
}
