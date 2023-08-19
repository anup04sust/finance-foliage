<?php

/**
 * The plugin bootstrap file
 *
 * This file is read by WordPress to generate the plugin information in the plugin
 * admin area. This file also includes all of the dependencies used by the plugin,
 * registers the activation and deactivation functions, and defines a function
 * that starts the plugin.
 *
 * @link              http://themeperch.net
 * @since             1.0.0
 * @package           Finance_Foliage
 *
 * @wordpress-plugin
 * Plugin Name:       Finance Foliage
 * Plugin URI:        https://github.com/anup04sust/finance-foliage
 * Description:       Financial company fields agent binary tree and their financial benefit generator
 * Version:           1.0.0
 * Author:            Anup@Themeperch, Razib@Themeperch
 * Author URI:        http://themeperch.net
 * License:           GPL-2.0+
 * License URI:       http://www.gnu.org/licenses/gpl-2.0.txt
 * Text Domain:       finance-foliage
 * Domain Path:       /languages
 */
ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);
// If this file is called directly, abort.
if (!defined('WPINC')) {
    die;
}

/**
 * Currently plugin version.
 * Start at version 1.0.0 and use SemVer - https://semver.org
 */
//8820e8cb87c4b1591a3b8b4456b2197f
define('FINANCE_FOLIGE_VER', '1.0.0');

if (!defined('RWMB_VER')) {
    require __DIR__ . '/vendor/wpmetabox/meta-box/meta-box.php';
}
define('FINANCE_FOLIGE_DIR', __DIR__);
define('FINANCE_FOLIGE_DIR_URL', plugin_dir_url(__FILE__));

//Debug custom function
function pprint($data) {
    echo '<pre>';
    print_r($data);
    echo '</pre>';
}

if (!function_exists('fincance_foliage_init')):
    require_once __DIR__ . '/vendor/autoload.php';
    require_once __DIR__ . '/inc/install/FfSetups.php';
    register_activation_hook(__FILE__, 'fincance_foliage_activate');

    add_action('init', 'fincance_foliage_init', 1);

    function fincance_foliage_init() {
       
        $settings = get_option('finance_foliage_settings');
        //pprint($settings );
  
        $user = wp_get_current_user();
        $actual_link = (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        $account_page = get_permalink($settings['user_account_page_id']);

        if (!is_user_logged_in() && $actual_link !== $account_page) {

            wp_safe_redirect($account_page);
            exit();
            wp_die('Unexpected error, please contact with administrator!!');
        }

        new FinanceFoliage\Loader;
    }

    function fincance_foliage_activate() {
        $install = new FfSetups();
        $install->init();
    }





endif;