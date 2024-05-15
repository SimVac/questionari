<?php
    require 'vendor/autoload.php';

    require_once 'conf/config.php';
    use Util\Authenticator;
    use Model\UtenteRepository;
    use Model\QuestionarioRepository;

    function page_refresh(){
        echo '<meta http-equiv=\'refresh\' content=\'0;url=index.php\'>';
        exit;
    }

    $template = new League\Plates\Engine('templates', 'tpl');

    $user = Authenticator::getUser();

    if ($user == null){
        echo $template->render('login');
        exit(0);
    }

    // GET section
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'logout'){
            Authenticator::logout();
            page_refresh();
            exit(0);
        }
        if ($_GET['action'] == 'registrazione'){
            echo $template->render('registrazione');
            exit(0);
        }
    }

    // POST section
    if (isset($_POST['registrazione'])){
        $username = $_POST['mail'];
        $password = $_POST['password'];
        $nome = $_POST['nome'];
        $cognome = $_POST['cognome'];
        UtenteRepository::userRegistration($username, $password, $nome, $cognome);
        echo $template->render('login');
        exit(0);
    }
    if (isset($_POST['aggiunta-questionario'])){
        if ($_SESSION['user']['ruolo'] != 'admin') {
            header('HTTP/1.0 403 Forbidden');
            echo 'You are forbidden!';
            exit(0);
        }
        $questionario = json_decode($_POST['questionario']);
        QuestionarioRepository::addQuestionario($questionario->domande, $questionario->titolo, $questionario->descrizione);
    }

    echo $template->render('index');


