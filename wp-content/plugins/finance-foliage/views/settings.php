<?php
//
$timezone = new DateTimeZone('Asia/Dhaka');

$datetime = new DateTime('now');
$datetime->setTimezone($timezone);
pprint($datetime->format('L'));
?>
Settings