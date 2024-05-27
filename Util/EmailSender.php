<?php

namespace Util;
use Util\Email;

use Amp\Cancellation;
use Amp\Parallel\Worker\Task;
use Amp\Sync\Channel;

class EmailSender implements Task
{
    public function __construct($email, $to, $subject, $message) {
        $this->email = $email;
        $this->to = $to;
        $this->subject = $subject;
        $this->message = $message;
    }

    public function run(Channel $channel, Cancellation $cancellation): string {
        $this->email->sendEmail($this->to, $this->subject, $this->message);
        return '';
    }
}