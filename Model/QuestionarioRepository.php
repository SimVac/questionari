<?php

namespace Model;

use Util\Connection;

class QuestionarioRepository
{
    public static function addQuestionario(array $domande, string $titolo, string $descrizione){
        $pdo = Connection::getInstance();

        //creazione questionario
        $sql = 'INSERT INTO questionario (titolo, descrizione, data, idAutore) VALUES (:titolo, :descrizione, CURRENT_DATE(), :idAutore)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'titolo'=>$titolo,
            'descrizione'=>$descrizione,
            'idAutore'=>$_SESSION['user']['id']
        ]);
        $idQuestionario = $pdo->lastInsertId();

        //aggiunta domande
        $sql = 'INSERT INTO domanda (ordine, testo, idQuestionario) VALUES (:ordine, :testo, :idQuestionario)';
        $stmt = $pdo->prepare($sql);
        foreach ($domande as $idx=>$testo) {
            $stmt->execute([
                'testo' => $testo,
                'ordine' => $idx,
                'idQuestionario' => $idQuestionario
            ]);
        }
    }

    public static function getQuestionarioById($idQuestionario){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM questionario INNER JOIN utente ON questionario.idAutore = utente.id WHERE questionario.id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id'=>$idQuestionario
        ]);
        return $stmt->fetchAll();
    }
}