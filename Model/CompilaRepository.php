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


}