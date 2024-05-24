<?php

namespace Model;

use Util\Connection;

class UtenteRepository{
    public static function userAuthentication(string $mail, string $password):array|null{
        $pdo = Connection::getInstance();
        $sql = 'SELECT q_utente.*, q_ruolo.ruolo FROM q_utente INNER JOIN q_ruolo ON q_utente.idRuolo = q_ruolo.id WHERE mail=:mail';
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
        $sql = 'INSERT INTO q_utente (mail, password, nome, cognome, subscriptionDate, idRuolo) VALUES (:mail, :password, :nome, :cognome, CURRENT_DATE(), 2)';
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
        $sql = 'SELECT * FROM q_utente';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getUtenteById(int $id){
        $pdo = Connection::getInstance();
        $sql = 'SELECT q_utente.*, q_ruolo.ruolo FROM q_utente INNER JOIN q_ruolo ON q_ruolo.id = q_utente.idRuolo WHERE q_utente.id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $id
        ]);
        return $stmt->fetchAll()[0];
    }

    public static function editBio(string $bio, int $idUtente){
        $pdo = Connection::getInstance();
        $sql = 'UPDATE q_utente SET bio = :bio WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'bio' => $bio,
            'id' => $idUtente
        ]);
        $stmt->fetchAll();
        $_SESSION['user'] = self::getUtenteById($_SESSION['user']['id']);
    }

    public static function getUtentiCompilato($idQuestionario){
        $pdo = Connection::getInstance();
        $sql = 'SELECT q_utente.* FROM q_utente INNER JOIN compila ON q_utente.id = compila.idUtente INNER JOIN domanda ON domanda.id = compila.idDomanda WHERE domanda.idQuestionario = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $idQuestionario
        ]);
        return $stmt->fetchAll();
    }

    public static function editData(string $gender, string $birthday, string $city, int $idUtente){
        $pdo = Connection::getInstance();
        $sql = 'UPDATE q_utente SET gender = :gender, birthday = :birthday, city = :city WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'gender'=> $gender,
            'birthday'=> $birthday,
            'city'=> $city,
            'id' => $idUtente
        ]);
        $stmt->fetchAll();
        $_SESSION['user'] = self::getUtenteById($_SESSION['user']['id']);
    }
}