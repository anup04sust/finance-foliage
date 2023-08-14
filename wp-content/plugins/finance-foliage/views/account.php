<?php
//Array
//(
//    [dashboard_page_id] => 41
//    [settings_page_id] => 42
//    [agentnodes_page_id] => 43
//    [finance_report_page_id] => 44
//    [login_page_id] => 40
//    [finance_report_print_page_id] => 45
//    [user_account_page_id] => 46
//)
$foliage_settings = get_option('finance_foliage_settings');
$dashboard_url = get_permalink($foliage_settings['dashboard_page_id']);
if (!is_user_logged_in()) {
    echo do_shortcode('[mb_user_profile_login redirect=' . $dashboard_url . ']');
} else {
    ?>
    <a href="<?php echo wp_logout_url(); ?>">Logout</a>
    <?php
}