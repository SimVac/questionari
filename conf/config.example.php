<?php

use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\PHPMailer;

const DEV = true;

const DB_HOST = 'host';
const DB_NAME = 'db_name';
const DB_USER = 'user';
const DB_PASSWORD = 'password';

$email_config = [
    'server'      => 'smtp.gmail.com',
    'port'        => '465',
    'username'    => 'survey.app.1357@gmail.com',
    'password'    => 'ywqqjjyvbbpmuuug',
    'security'    => PHPMailer::ENCRYPTION_SMTPS,
    'admin_email' => '',
    'debug'       => (DEV) ? SMTP::DEBUG_SERVER : SMTP::DEBUG_OFF,
];