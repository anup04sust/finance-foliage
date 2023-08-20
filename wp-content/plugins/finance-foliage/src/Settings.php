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

        add_filter('rwmb_meta_boxes', [ $this, 'add_settings_fields' ]);
        add_filter('mb_settings_pages', [ $this, 'add_settings_pages' ]);

        add_action('wp_ajax_finance_foliage_settings_fields_save', [$this, 'finance_foliage_settings_fields_save']);
        add_action('wp_ajax_nopriv_finance_foliage_settings_fields_save', [$this, 'finance_foliage_settings_fields_save']);

        add_filter("option_start_of_week", [$this, 'startWeek']);
        add_action('wp_enqueue_scripts', [$this, 'addScripts']);
    }

    private function addUserRestrictions() {
        if (!is_admin()) {
            show_admin_bar(false);
        }
    }

    function finance_foliage_settings_fields_save(){
        $settings = array();
        parse_str($_POST['formData'], $settings);

        $update_option = false;
        $options = get_option('finance_foliage_settings');
        if(isset($settings['finance_foliage_levels'])){
           $options['finance_foliage_levels'] = $settings['finance_foliage_levels'];
           $update_option = update_option('finance_foliage_settings', $options);
        }
        

        if($update_option && !is_wp_error($update_option)){
                wp_send_json_success(array(
                        'settings' => $options,
                ));
        }else{
                wp_send_json_error(array(
                        'message' => 'Failed to insert data',
                ));
        }
        wp_die();
    }

    public function add_settings_pages(){
        $settings_pages[] = [
            'id'          => 'finance_foliage_settings',
            'option_name' => 'finance_foliage_settings',
            'menu_title'  => 'Finance Foliage Settings',
        ];
        return $settings_pages;
    }

    public function add_settings_fields($meta_boxes){       
        $meta_boxes[] = include __DIR__ . '/meta-boxes/settings.php';

        return $meta_boxes;
    }

    public function startWeek($day) {
        return 4;
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
        wp_enqueue_style('dashicons');
        wp_enqueue_style('ff-datatable-style', FINANCE_FOLIGE_DIR_URL . '/assets/datatable/dataTables.bootstrap4.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-select2-style', FINANCE_FOLIGE_DIR_URL . '/assets/select2/css/select2.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-select2bs-style', FINANCE_FOLIGE_DIR_URL . '/assets/select2-bootstrap4-theme/select2-bootstrap4.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-daterangepicker-style', FINANCE_FOLIGE_DIR_URL . '/assets/daterangepicker/daterangepicker.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-tempusdominus-style', FINANCE_FOLIGE_DIR_URL . '/assets/tempusdominus/css/tempusdominus-bootstrap-4.min.css', array(), FINANCE_FOLIGE_VER);
        wp_enqueue_style('ff-plugin-style', FINANCE_FOLIGE_DIR_URL . '/assets/css/ff-plugin-style.css', array(), FINANCE_FOLIGE_VER);
    }
}
