<?php

use Controllers\CarsController;

include "../vendor/autoload.php";

header("Content-Type: application/json");

$cars = CarsController::getCars();
echo json_encode(['cars' => $cars]);
