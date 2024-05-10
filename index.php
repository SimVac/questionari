<?php
    require 'vendor/autoload.php';
    //require_once 'conf/config.php';

    function page_refresh(){
        echo "<meta http-equiv='refresh' content='0'>";
        exit;
    }

    $template = new League\Plates\Engine('templates', 'tpl');
    echo $template->render('index');


