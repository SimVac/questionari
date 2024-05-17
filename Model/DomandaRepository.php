<?php

namespace Model;

use PDO;
use Util\Connection;

class DomandaRepository
{
    public static function getDomandeByQuestionarioId($idQuestionario){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM domanda WHERE idQuestionario = :idQuestionario ORDER BY ordine';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'idQuestionario'=>$idQuestionario
        ]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}