<?php
/**
 * @var $email_config
 */
    require_once 'vendor/autoload.php';

    require_once 'conf/config.php';
    use Util\Authenticator;
    use Model\UtenteRepository;
    use Model\QuestionarioRepository;
    use Model\CompilaRepository;
    use Model\DomandaRepository;
    use Util\Email;

    function page_refresh(){
        echo '<meta http-equiv=\'refresh\' content=\'0;url=index.php\'>';
    }

    $template = new League\Plates\Engine('templates', 'tpl');

    $user = Authenticator::getUser();

    // GET section
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'login'){
            echo $template ->render('login');
            exit(0);
        }
        if ($_GET['action'] == 'logout'){
            Authenticator::logout();
            page_refresh();
            exit(0);
        }
        if ($_GET['action'] == 'registrazione'){
            echo $template->render('registrazione');
            exit(0);
        }
        if($_GET['action'] == 'about'){
            echo $template->render('about',[
                'logged'=>isset($_SESSION['user'])]);
            exit(0);
        }
    }


    // POST section
    if (isset($_POST['registrazione'])){
        $mail = $_POST['mail'];
        $password = $_POST['password'];
        $nome = $_POST['nome'];
        $cognome = $_POST['cognome'];
        try {
            UtenteRepository::userRegistration($mail, $password, $nome, $cognome);
        }catch (Exception $e){
            $template->render('registrazione', [
                'failed'=>true
            ]);
            exit(0);
        }
        $_SESSION['user'] = UtenteRepository::userAuthentication($mail, $password);

        $email = new Email($email_config);
        $email->sendEmail($mail, 'QuestionAPP registration', 'Thank you for the registration to QuestionAPP');

        page_refresh();
        exit(0);
    }

    if ($user == null){
        echo $template->render('index', [
            'logged'=>false
        ]);
        exit(0);
    }

    if (isset($_GET['action'])){
        if ($_GET['action'] == 'surveys'){
            $questionari = QuestionarioRepository::getQuestionari();

            foreach ($questionari as &$questionario){
                $questionario['completato'] = sizeof(CompilaRepository::getRispostaByIdDomanda(DomandaRepository::getDomandeByQuestionarioId($questionario['id'])[0]['id'], $_SESSION['user']['id'])) > 0;
            }
            echo $template->render('surveys', [
                'questionari'=>$questionari,
                'admin' => $_SESSION['user']['ruolo'] == 'admin',
                'logged'=>true
            ]);
            exit(0);
        }
        if ($_GET['action'] == 'profile'){
            $questionari = QuestionarioRepository::getQuestionari();
            $count = 0;
            foreach ($questionari as &$questionario){
                if (sizeof(CompilaRepository::getRispostaByIdDomanda(DomandaRepository::getDomandeByQuestionarioId($questionario['id'])[0]['id'], $_SESSION['user']['id'])) > 0)
                    $count++;
            }
            echo $template->render('profile', [
                'user' => $_SESSION['user'],
                'count' => $count
            ]);
            exit(0);
        }
        if ($_GET['action'] == 'create'){
            echo $template->render('create');
            exit(0);
        }
        if ($_GET['action'] == 'compile'){
            if (isset($_GET['q'])){
                $questionario = QuestionarioRepository::getQuestionarioById($_GET['q']);
                if (sizeof($questionario) <= 0){
                    echo $template->render('error', [
                        'logged' => isset($_SESSION['user'])
                    ]);
                    exit(0);
                }
                $questionario = $questionario[0];
                $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
                echo $template->render('compila', [
                    'questionario' => $questionario,
                    'domande' => $domande
                ]);
            }else{
                echo $template->render('error', [
                    'logged' => isset($_SESSION['user'])
                ]);
            }

            exit(0);
        }
        if($_GET['action'] == 'graphs'){
            $questionari = QuestionarioRepository::getQuestionari();
            foreach ($questionari as &$questionario) {
                $questionario['domande'] = QuestionarioRepository::getMediaRisultati($questionario['id']);
                $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
                $questionario['numero_risposte'] = CompilaRepository::getNumeroRisposte($domande[0]['id']);
            }
            var_dump($questionari);
            echo $template->render('graph',[
                'logged'=>isset($_SESSION['user']),
                'questionari' => $questionari
            ]);
            exit(0);
        }
    }
    if (isset($_POST['modifica-bio'])){
        UtenteRepository::editBio($_POST['bio'], $_SESSION['user']['id']);
    }
    if (isset($_POST['modifica-dati'])){
        UtenteRepository::editData($_POST['gender'], $_POST['birthday'], $_POST['city'], $_SESSION['user']['id']);
    }

    if (isset($_POST['aggiunta-questionario'])){
        if ($_SESSION['user']['ruolo'] != 'admin') {
            header('HTTP/1.0 403 Forbidden');
            echo 'You are forbidden!';
            exit(0);
        }
        $questionario = json_decode($_POST['questionario']);
        QuestionarioRepository::addQuestionario($questionario->domande, $questionario->titolo, $questionario->descrizione, $_SESSION['user']['id']);

        // manda mail a tutti
        $users = UtenteRepository::listAll();
        foreach ($users as $user) {
            $mail = new Email($email_config);
            $mail->sendEmail($user['mail'], 'New Survey!', '<h1>' . $questionario->titolo . '</h1><h3>' . $questionario->descrizione . '</h3>');
        }
    }

    if (isset($_POST['compilazione-questionario'])){
        $risposte = json_decode($_POST['risposte']);
        $prima_domanda = DomandaRepository::getDomandeByQuestionarioId($risposte->idQuestionario)[0];
        //hell nah
        if (sizeof(CompilaRepository::getRispostaByIdDomanda($prima_domanda['id'], $_SESSION['user']['id'])))
            exit(0);
        CompilaRepository::addRisultati($risposte->risposte, $_SESSION['user']['id'], $risposte->idQuestionario);
        $mail = new Email($email_config);
        $questionario = QuestionarioRepository::getQuestionarioById($risposte->idQuestionario)[0];
        $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
        $risposte = [];
        foreach ($domande as $domanda) {
            $risposte[] = CompilaRepository::getRispostaByIdDomanda($domanda['id'], $_SESSION['user']['id'])[0];
        }
        $content = '<div style="display: grid; justify-content: center;"><h1>' . $questionario['titolo'] . '</h1><p>Thank you for filling out the survey. Here are the answers received.</p>';
        for ($i = 0; $i < sizeof($domande); $i++){
            $content .= '<p><strong>' . $domande[$i]['testo'] . '</strong> ' . $risposte[$i]['risposta'] . '/7</p>';
        }
        $content .= '</div>';
        $mail->sendEmail($_SESSION['user']['mail'], 'New survey filled out - ' . $questionario['titolo'], $content);
    }

    echo $template->render('index', [
        'logged'=>isset($_SESSION['user'])
    ]);


