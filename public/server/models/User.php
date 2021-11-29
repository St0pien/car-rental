<?php

namespace Models;

use Exception;
use PDO;

class User {
  private $login;
  private $password;
  private $db;

  function __construct($login, $password) {
    $this->login = $login;
    $this->password = $password;
    $this->db = new DB();
  }

  function register() {
    $stmt = $this->db->prepare("SELECT COUNT(ID) FROM users WHERE login=?");
    $stmt->execute([$this->login]);
    $result = $stmt->fetchColumn();
    if ($result > 0) {
        throw new Exception("User already exists");
    }

    $password_hash = password_hash($this->password, PASSWORD_DEFAULT);
    $stmt = $this->db->prepare("INSERT INTO users(login, password) VALUES(?, ?)");
    $result = $stmt->execute([$this->login, $password_hash]);
  }

  function log_in() {
    $stmt = $this->db->prepare("SELECT * FROM users WHERE login=?");
    $stmt->execute([$this->login]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result && password_verify($this->password, $result['password'])) {
      session_start();
      $_SESSION['user'] = $result;
    } else {
      throw new Exception('Incorrect credentials');
    }
  }
}
