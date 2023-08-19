<?php
//
$timezone = new DateTimeZone('Asia/Dhaka');

$datetime = new DateTime('now');
$datetime->setTimezone($timezone);
$week_day = get_weekstartend($datetime->format('Y-m-d'));
pprint(date('Y-m-d', $week_day['start']));
pprint(date('Y-m-d', $week_day['end']));
pprint(get_option('start_of_week'));
?>
Settings