<?php
    require 'vendor/autoload.php';
    require_once 'conf/config.php';
    use Util\Authenticator;

    function page_refresh(){
        echo '<meta http-equiv=\'refresh\' content=\'0\'>';
        exit;
    }
    $template = new League\Plates\Engine('templates', 'tpl');

    $user = Authenticator::getUser();

    if ($user == null){
        echo $template->render('login');
        exit(0);
    }


    echo $template->render('index');


