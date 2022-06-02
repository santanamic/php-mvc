<?php

namespace App\Controllers;

use \Core\View;
use \App\Models;

/**
 * Home controller
 *
 * PHP version 7.0
 */
class Jobs extends \Core\Controller
{

    /**
     * Show the index page
     *
     * @return void
     */
    public function indexAction()
    {
		$jobs = new \App\Models\Jobs();
		
        View::renderTemplate('Jobs/index.html', [ 
			'jobs'    => $jobs::getJobs(),
		]);
    }
}
