<?php

/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */

namespace FinanceFoliage;

/**
 * Description of Settings
 *
 * @author anup
 */
class Settings {

    public $settings;

    //put your code here
    public function __construct() {
        $this->settings = get_option('finance_foliage_settings');
        $this->addUserRestrictions();
        
        add_action('wp_head', [$this, 'redirect']);
        add_action('wp_enqueue_scripts', [$this, 'addScripts']);

    }

    private function addUserRestrictions() {
        if (!is_admin()) {
            show_admin_bar(false);
        }
    }

    public function redirect() {
       //$user = wp_get_current_user();
        $account_page = get_permalink($this->settings['user_account_page_id']);
        if (!current_user_can('manage_options')) {
            if (!is_user_logged_in() && !is_page($this->settings['user_account_page_id'])) {
                wp_redirect($account_page);
                wp_die('Unexpected error, please contact with administrator!!');
            }
        }
    }

    public function addScripts() {

        wp_enqueue_script(
                'chart.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/chart.js/Chart.bundle.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'dataTables.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/datatable/jquery.dataTables.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'bs_dataTables.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/datatable/dataTables.bootstrap4.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'select2.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/select2/js/select2.full.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'moment.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/moment/moment.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'daterangepicker.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/daterangepicker/daterangepicker.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'tempusdominus.js',
                FINANCE_FOLIGE_DIR_URL . '/assets/tempusdominus/js/tempusdominus-bootstrap-4.min.js',
                array('jquery'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_enqueue_script(
                'ff-dashboard-script',
                FINANCE_FOLIGE_DIR_URL . '/assets/js/ff-dashboard.js',
                array('jquery', 'chart.js', 'dataTables.js', 'select2.js', 'moment.js'),
                FINANCE_FOLIGE_VER,
                true
        );
        wp_localize_script('ff-dashboard-script', 'financeFoliage',
                array(
                    'ajaxurl' => admin_url('admin-ajax.php'),
                )
        );
        wp_enqueue_style('ff-datatable-style', FINANCE_FOLIGE_DIR_URL . '/assets/datatable/dataTables.bootstrap4.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-select2-style', FINANCE_FOLIGE_DIR_URL . '/assets/select2/css/select2.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-select2bs-style', FINANCE_FOLIGE_DIR_URL . '/assets/select2-bootstrap4-theme/select2-bootstrap4.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-daterangepicker-style', FINANCE_FOLIGE_DIR_URL . '/assets/daterangepicker/daterangepicker.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-tempusdominus-style', FINANCE_FOLIGE_DIR_URL . '/assets/tempusdominus/css/tempusdominus-bootstrap-4.min.css', array(), FINANCE_FOLIGE_VER);
    }
}
