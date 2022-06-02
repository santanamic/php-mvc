<?php

namespace App\Models;

use PDO;

/**
 * Example user model
 *
 * PHP version 7.0
 */
class User extends \Core\Model
{

    /**
     * Get all the users as an associative array
     *
     * @return array
     */
    public static function getUser()
    {
		if( isset( $_GET['e-mail'] ) && isset( $_GET['senha'] ) ) {
			$email = $_GET['e-mail'];
			$senha = $_GET['senha'];
			
			$db = static::getDB();
			$stmt = $db->query("SELECT * FROM tb_profissional WHERE `Ds_Email` = {$email} AND `Ds_Senha` = {$senha}");
			
			return $stmt->fetchAll(PDO::FETCH_ASSOC);
		}
        
    }

    /**
     * Get all the users as an associative array
     *
     * @return array
     */
    public static function getAll()
    {
        $db = static::getDB();
        $stmt = $db->query('SELECT id, name FROM users');
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
