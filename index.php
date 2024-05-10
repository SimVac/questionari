<?php
    require 'vendor/autoload.php';
    require_once 'conf/config.php';
    use Util\Authenticator;

    function page_refresh(){
        echo '<meta http-equiv=\'refresh\' content=\'0\'>';
        exit;
    }

    $user = Authenticator::getUser();

    if ($user != null){
        echo 'ciao';
    }

    $template = new League\Plates\Engine('templates', 'tpl');
    echo $template->render('index');


