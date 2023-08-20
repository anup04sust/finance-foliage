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

<div class="container-fluid py-4">
    <?php echo do_shortcode('[mb_frontend_form id="finance_foliage_settings_fields" post_id="'.get_the_ID().'" ajax="true"]'); ?>
    <a href="#" class="finance-foilage-save btn btn-primary">Save settings</a>
</div>