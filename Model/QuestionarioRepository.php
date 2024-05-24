<?php

namespace Model;

use Util\Connection;

class QuestionarioRepository
{
    public static function addQuestionario(array $domande, string $titolo, string $descrizione, $idAutore){
        $pdo = Connection::getInstance();

        //creazione questionario
        $sql = 'INSERT INTO questionario (titolo, descrizione, data, idAutore) VALUES (:titolo, :descrizione, CURRENT_DATE(), :idAutore)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'titolo'=>$titolo,
            'descrizione'=>$descrizione,
            'idAutore'=>$idAutore
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
        $sql = 'SELECT questionario.*, q_utente.nome, q_utente.cognome FROM questionario INNER JOIN q_utente ON questionario.idAutore = q_utente.id WHERE questionario.id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id'=>$idQuestionario
        ]);
        return $stmt->fetchAll();
    }

    public static function getQuestionari(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT questionario.*, q_utente.nome, q_utente.cognome FROM questionario INNER JOIN q_utente ON questionario.idAutore = q_utente.id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public static function getMediaRisultati($idQuestionario){
        $pdo = Connection::getInstance();
        $sql = 'SELECT AVG(compila.risposta) as media, domanda.testo
                FROM compila
                         INNER JOIN domanda ON compila.idDomanda = domanda.id
                WHERE domanda.idQuestionario = :id
                GROUP BY domanda.id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id' => $idQuestionario
        ]);
        return $stmt->fetchAll();
    }
}