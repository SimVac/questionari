<?php

namespace Model;

use Util\Connection;

class UtenteRepository{
    public static function userAuthentication(string $username, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM utente INNER JOIN ruolo ON utente.idRuolo = ruolo.id WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );
        if($stmt->rowCount() == 0)
            return null;
        $row = $stmt->fetch();
        if (!password_verify($password, $row['password']))
            return null;
        return $row;
    }

    public static function userRegistration(string $username, string $password):void{
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO utente (username, password, idRuolo) VALUES (:username, :password, 2)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username,
                'password' => password_hash($password, PASSWORD_DEFAULT)
            ]
        );
    }
}