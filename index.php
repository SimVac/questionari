<?php
    require 'vendor/autoload.php';

    require_once 'conf/config.php';
    use Util\Authenticator;
    use Model\UtenteRepository;

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

    if (isset($_POST['registrazione'])){
        $username = $_POST['username'];
        $password = $_POST['password'];
        UtenteRepository::userRegistration($username, $password);
        echo $template->render('login');
        exit(0);
    }
    
    echo $template->render('index');


