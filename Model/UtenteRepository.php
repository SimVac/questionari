<?php

namespace Model;

use Util\Connection;

class UtenteRepository{
    public static function userAuthentication(string $mail, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT utente.*, ruolo.ruolo FROM utente INNER JOIN ruolo ON utente.idRuolo = ruolo.id WHERE mail=:mail';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'mail' => $mail
            ]
        );
        if($stmt->rowCount() == 0)
            return null;
        $row = $stmt->fetch();
        if (!password_verify($password, $row['password']))
            return null;
        return $row;
    }

    public static function userRegistration(string $mail, string $password, string $nome, string $cognome):void{
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO utente (mail, password, nome, cognome, subscriptionDate, idRuolo) VALUES (:mail, :password, :nome, :cognome, CURRENT_DATE(), 2)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'mail' => $mail,
                'password' => password_hash($password, PASSWORD_DEFAULT),
                'nome' => $nome,
                'cognome' => $cognome
            ]
        );
    }

    public static function listAll(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM utente';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function editBio(string $bio, $idUtente){
        $pdo = Connection::getInstance();
        $sql = 'UPDATE utente SET bio = :bio WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'bio' => $bio,
            'id' => $idUtente
        ]);
        return $stmt->fetchAll();
    }
}