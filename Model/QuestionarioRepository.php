<?php

namespace Model;

use Util\Connection;

class QuestionarioRepository
{
    public static function addQuestionario(array $domande, string $titolo, string $descrizione){
        $pdo = Connection::getInstance();

        //creazione questionario
        $sql = "query";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'titolo'=>$titolo,
            'descrizione'=>$descrizione
        ]);

        //aggiunta domande
        $sql = "query";
        $stmt = $pdo->prepare($sql);
        foreach ($domande as $idx=>$testo) {
            $stmt->execute([
                'testo' => $testo,
                'ordine' => $idx
            ]);
        }
    }
}