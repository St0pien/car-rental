<?php

namespace Models;

use PDO;

class DB extends PDO {
  private $host = "localhost";
  private $db = "rental";
  private $user = "root";
  private $pass = "";

  function __construct() {
    parent::__construct("mysql:host={$this->host};dbname={$this->db}", $this->user, $this->pass);
  }
}