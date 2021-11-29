<?php

use Controllers\UserController;

include "../vendor/autoload.php";

$payload = file_get_contents('php://input');
$payload = json_decode($payload);

header("Content-Type: application/json");

switch ($payload->action) {
  case 'login':
    $status = UserController::login($payload->login, $payload->password);
    echo json_encode(['status' => $status]);
    break;

  case 'register':
    $status = UserController::register($payload->login, $payload->password);
    echo json_encode(['status' => $status]);
    break;
}
