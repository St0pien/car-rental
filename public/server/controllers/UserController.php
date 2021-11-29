<?php

namespace Controllers;

use Exception;
use Models\User;

class UserController {
  static function login($login, $password) {
    if (empty($login) || empty($password)) {
      return 'Please provide both login and password!';
    }

    $user = new User($login, $password);
    try {
      $user->log_in();
      return "OK";
    } catch(Exception $e) {
      return $e->getMessage();
    }
  }

  static function register($login, $password) {
    if (empty($login) || empty($password)) {
      return 'Please fill up all fields';
    }

    $user = new User($login, $password);
    try {
      $user->register();
      return "Registration successful!";
    } catch(Exception $e) {
      return $e->getMessage();
    }
  }
}