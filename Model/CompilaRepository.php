<?php

namespace Model;

use PDO;
use Util\Connection;

class CompilaRepository
{
    public static function addRisultati(array $risposte, int $idUtente, int $idQuestionario) {
        $pdo = Connection::getInstance();
        $sqlDomande = 'SELECT id FROM domanda WHERE idQuestionario = :idQuestionario ORDER BY ordine';
        $stmtDomande = $pdo->prepare($sqlDomande);
        $stmtDomande->execute(['idQuestionario' => $idQuestionario]);
        $domande = $stmtDomande->fetchAll(PDO::FETCH_ASSOC);

        $sqlInserimento = 'INSERT INTO compila (risposta, idUtente, idDomanda) VALUES (:risposta, :idUtente, :idDomanda)';
        $stmtInserimento = $pdo->prepare($sqlInserimento);

        $idx = 0;
        foreach ($domande as $domanda) {
            $idDomanda = $domanda['id'];
            if (isset($risposte[$idx])) {
                $stmtInserimento->execute([
                    'risposta' => $risposte[$idx],
                    'idUtente' => $idUtente,
                    'idDomanda' => $idDomanda
                ]);
            }
            $idx++;
        }
    }

    public static function getRispostaByIdDomanda($idDomanda, $idUtente){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM compila WHERE idDomanda = :idDomanda AND idUtente = :idUtente';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'idDomanda' => $idDomanda,
            'idUtente' => $idUtente
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getNumeroRisposte($idDomanda){
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) FROM compila WHERE idDomanda = :idDomanda';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'idDomanda' => $idDomanda
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}