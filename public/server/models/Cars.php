<?php

namespace Models;

use PDO;

class Cars {
  private $db;

  function __construct() {
    $this->db = new DB();
  }

  function fetch() {
    $result = $this->db->query("SELECT * FROM cars")->fetchAll(PDO::FETCH_ASSOC);
    return $result;
  }
}