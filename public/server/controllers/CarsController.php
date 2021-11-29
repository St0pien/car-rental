<?php

namespace Controllers;

use Models\Cars;

class CarsController {
  static function getCars() {
    session_start();
    if(!isset($_SESSION['user'])) {
      http_response_code(401);
      return 'Unauthorized';
    }

    $cars = new Cars();
    return $cars->fetch();
  }
}