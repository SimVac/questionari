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
    use Util\EmailSender;


    function page_refresh($location=''){
        echo '<meta http-equiv=\'refresh\' content=\'0;url=index.php'. $location .'\'>';
    }
     $template = new League\Plates\Engine('templates', 'tpl');

     $user = Authenticator::getUser();

     // GET section
     if (isset($_GET['action'])) {
         if ($_GET['action'] == 'login') {
             echo $template->render('login', [
                 'admin' => false
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'logout') {
             Authenticator::logout();
             page_refresh();
             exit(0);
         }
         if ($_GET['action'] == 'registrazione') {
             echo $template->render('registrazione', [
                 'admin' => false
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'about') {
             echo $template->render('about', [
                 'logged' => isset($_SESSION['user']),
                 'admin' => isset($_SESSION['user']) && $_SESSION['user']['ruolo'] == 'admin']);
             exit(0);
         }
     }

     // POST section
     if (isset($_POST['registrazione'])) {
         $mail = $_POST['mail'];
         $password = $_POST['password'];
         $nome = $_POST['nome'];
         $cognome = $_POST['cognome'];
         try {
             UtenteRepository::userRegistration($mail, $password, $nome, $cognome);
         } catch (Exception $e) {
             $template->render('registrazione', [
                 'failed' => true
             ]);
             exit(0);
         }
         $_SESSION['user'] = UtenteRepository::userAuthentication($mail, $password);
         try{
             $email = new Email($email_config);
             $worker = Amp\Parallel\Worker\createWorker();
             $emailSender = new EmailSender($email, $mail, 'QuestionAPP registration', 'Thank you for the registration to QuestionAPP');
             $execution = $worker->submit($emailSender);
         }catch (Exception $e){
         }

         page_refresh();
         exit(0);
     }
     if ($user == null) {
         echo $template->render('index', [
             'logged' => false,
             'admin' => false
         ]);
         exit(0);
     }


     if (isset($_GET['action'])) {
         if ($_GET['action'] == 'surveys') {
             $questionari = QuestionarioRepository::getQuestionari();

             foreach ($questionari as &$questionario) {
                 $questionario['completato'] = sizeof(CompilaRepository::getRispostaByIdDomanda(DomandaRepository::getDomandeByQuestionarioId($questionario['id'])[0]['id'], $_SESSION['user']['id'])) > 0;
             }
             echo $template->render('surveys', [
                 'questionari' => $questionari,
                 'admin' => $_SESSION['user']['ruolo'] == 'admin',
                 'logged' => true
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'profile') {
             $questionari = QuestionarioRepository::getQuestionari();
             $count = 0;
             foreach ($questionari as &$questionario) {
                 if (sizeof(CompilaRepository::getRispostaByIdDomanda(DomandaRepository::getDomandeByQuestionarioId($questionario['id'])[0]['id'], $_SESSION['user']['id'])) > 0)
                     $count++;
             }
             echo $template->render('profile', [
                 'user' => $_SESSION['user'],
                 'count' => $count,
                 'admin' => $_SESSION['user']['ruolo'] == 'admin'
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'create') {
             echo $template->render('create', [
                 'admin' => $_SESSION['user']['ruolo'] == 'admin'
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'compile') {
             if (isset($_GET['q'])) {
                 $questionario = QuestionarioRepository::getQuestionarioById($_GET['q']);
                 if (sizeof($questionario) <= 0) {
                     echo $template->render('error', [
                         'logged' => isset($_SESSION['user']),
                         'admin' => $_SESSION['user']['ruolo'] == 'admin'
                     ]);
                     exit(0);
                 }
                 $questionario = $questionario[0];
                 $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
                 echo $template->render('compila', [
                     'questionario' => $questionario,
                     'domande' => $domande,
                     'admin' => $_SESSION['user']['ruolo'] == 'admin'
                 ]);
             } else {
                 echo $template->render('error', [
                     'logged' => isset($_SESSION['user']),
                     'admin' => $_SESSION['user']['ruolo'] == 'admin'
                 ]);
             }

             exit(0);
         }
         if ($_GET['action'] == 'graphs') {
             if ($_SESSION['user']['ruolo'] != 'admin') {
                 header('HTTP/1.0 403 Forbidden');
                 echo $template->render('error', [
                     'logged' => isset($_SESSION['user']),
                     'admin' => $_SESSION['user']['ruolo'] == 'admin'
                 ]);
                 exit(0);
             }
             $questionari = QuestionarioRepository::getQuestionari();
             foreach ($questionari as &$questionario) {
                 $questionario['domande'] = QuestionarioRepository::getMediaRisultati($questionario['id']);
                 $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
                 if (sizeof($questionario['domande']) <= 0)
                     foreach ($domande as $domanda) {
                         $questionario['domande'][] = ['media' => 0, 'testo' => $domanda['testo']];
                     }
                 $questionario['numero_risposte'] = CompilaRepository::getNumeroRisposte($domande[0]['id']);
             }
             //var_dump($questionari);
             echo $template->render('graph', [
                 'logged' => isset($_SESSION['user']),
                 'questionari' => $questionari,
                 'admin' => $_SESSION['user']['ruolo'] == 'admin'
             ]);
             exit(0);
         }
         if ($_GET['action'] == 'public') {
             if ($_SESSION['user']['ruolo'] != 'admin') {
                 header('HTTP/1.0 403 Forbidden');
                 echo $template->render('error', [
                     'logged' => isset($_SESSION['user']),
                     'admin' => $_SESSION['user']['ruolo'] == 'admin'
                 ]);
                 exit(0);
             }
             $questionario = QuestionarioRepository::getQuestionarioById($_GET['q'])[0];
             $questionario['domande'] = QuestionarioRepository::getMediaRisultati($questionario['id']);
             $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
             $questionario['numero_risposte'] = CompilaRepository::getNumeroRisposte($domande[0]['id']);

             $content = '<div style="display: grid; justify-content: center;"><h1>' . $questionario['titolo'] . '</h1>
                        <p>Hey ' . $questionario['nome'] . ' ' . $questionario['cognome'] . ' has just shared the average results of his survey.
                        Check them out: </p>';
             for ($i = 0; $i < sizeof($questionario['domande']); $i++) {
                 $content .= '<p><strong>' . $questionario['domande'][$i]['testo'] . '</strong> ' . $questionario['domande'][$i]['media'] . '/7</p>';
             }
             $users = UtenteRepository::getUtentiCompilato($questionario['id']);
             foreach ($users as $user) {
                 try{
                     $email = new Email($email_config);
                     $worker = Amp\Parallel\Worker\createWorker();
                     $emailSender = new EmailSender($email, $user['mail'], 'New survey filled out - ' . $questionario['titolo'], $content);
                     $execution = $worker->submit($emailSender);
                 }catch (Exception $e){
                 }
             }

             //var_dump($questionari);
             page_refresh('?action=graphs');
             exit(0);
         }
     }
     if (isset($_POST['modifica-bio'])) {
         UtenteRepository::editBio($_POST['bio'], $_SESSION['user']['id']);
     }
     if (isset($_POST['modifica-dati'])) {
         UtenteRepository::editData($_POST['gender'], $_POST['birthday'], $_POST['city'], $_SESSION['user']['id']);
     }

     if (isset($_POST['aggiunta-questionario'])) {
         if ($_SESSION['user']['ruolo'] != 'admin') {
             header('HTTP/1.0 403 Forbidden');
             echo $template->render('error', [
                 'logged' => isset($_SESSION['user']),
                 'admin' => $_SESSION['user']['ruolo'] == 'admin'
             ]);
             exit(0);
         }
         $questionario = json_decode($_POST['questionario']);
         QuestionarioRepository::addQuestionario($questionario->domande, $questionario->titolo, $questionario->descrizione, $_SESSION['user']['id']);

         // manda mail a tutti
         $users = UtenteRepository::listAll();
         foreach ($users as $user) {
             try{
                 $email = new Email($email_config);
                 $worker = Amp\Parallel\Worker\createWorker();
                 $emailSender = new EmailSender($email, $user['mail'], 'New Survey!', '<h1>' . $questionario->titolo . '</h1><h3>' . $questionario->descrizione . '</h3>');
                 $execution = $worker->submit($emailSender);
             }catch (Exception $e){
             }
         }
     }

     if (isset($_POST['compilazione-questionario'])) {
         $risposte = json_decode($_POST['risposte']);
         $prima_domanda = DomandaRepository::getDomandeByQuestionarioId($risposte->idQuestionario)[0];
         if (sizeof(CompilaRepository::getRispostaByIdDomanda($prima_domanda['id'], $_SESSION['user']['id'])))
             exit(0);
         CompilaRepository::addRisultati($risposte->risposte, $_SESSION['user']['id'], $risposte->idQuestionario);
         $questionario = QuestionarioRepository::getQuestionarioById($risposte->idQuestionario)[0];
         $domande = DomandaRepository::getDomandeByQuestionarioId($questionario['id']);
         $risposte = [];
         foreach ($domande as $domanda) {
             $risposte[] = CompilaRepository::getRispostaByIdDomanda($domanda['id'], $_SESSION['user']['id'])[0];
         }
         $content = '<div style="display: grid; justify-content: center;"><h1>' . $questionario['titolo'] . '</h1><p>Thank you for filling out the survey. Here are the answers received.</p>';
         for ($i = 0; $i < sizeof($domande); $i++) {
             $content .= '<p><strong>' . $domande[$i]['testo'] . '</strong> ' . $risposte[$i]['risposta'] . '/7</p>';
         }
         $content .= '</div>';
         try{
             $email = new Email($email_config);
             $worker = Amp\Parallel\Worker\createWorker();
             $emailSender = new EmailSender($email, $_SESSION['user']['mail'], 'New survey filled out - ' . $questionario['titolo'], $content);
             $execution = $worker->submit($emailSender);
         }catch (Exception $e){
         }
     }
     echo $template->render('index', [
         'logged' => isset($_SESSION['user']),
         'admin' => $_SESSION['user']['ruolo'] == 'admin'
     ]);

