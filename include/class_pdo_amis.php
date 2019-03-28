<?php

/**

 * Classe d'accès aux données.

 * Utilise les services de la classe PDO
 * pour l'application Amis
 * Les attributs sont tous statiques,
 * les 4 premiers pour la connexion
 * $monPdo de type PDO
 * $monPdoGsb qui contiendra l'unique instance de la classe

 * @package default
 * @author Cheri Bibi
 * @version    1.0
 * @link       http://www.php.net/manual/fr/book.pdo.php
 */
class PdoGsb
{

  private $serveur = 'mysql:host=localhost';
  private $bdd = 'dbname=amis';
  private $user = 'root';
  private $mdp = '';
  public $pdo;

  public function __construct()
  {
    try {
      $this->pdo = new PDO("mysql:dbname=amis;host=localhost", 'root', '');
      $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
    } catch (PDOException $e) {
      die($e);
    }
  }


  public function query($query, $params = false)
  {
    if ($params) {
      $req = $this->pdo->prepare($query);
      $req->execute($params);
    } else {
      $req = $this->pdo->query($query);
    }
    return $req;
  }

  /**
   * @return string
   */
  public function lastInsertId()
  {
    return $this->pdo->lastInsertId();
  }
  /**
   * @return mixed
   */
  public function errorCode()
  {
    return $this->pdo->errorCode();
  }

  public function _destruct()
  {
    $this->pdo = null;
  }



  public function getConnect($ami, $mdp)
  {
    $req = "SELECT NUMAMIS, amis.NUMAMIS as AMI,numfonction, mdp from amis where amis.nomamis = '$ami' and amis.mdp = '$mdp'";
    $res = $this->pdo->query($req);
    $connect = $res->fetch();
    return $connect;
  }


}


