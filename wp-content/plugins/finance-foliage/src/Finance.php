<?php

namespace FinanceFoliage;

/**
 * Description of Agents
 *
 * @author anup
 */
class Finance {

    public $settings;
    public $tableAlince;
    public $tableFinance;

    public function __construct() {
        $this->settings = get_option('finance_foliage_settings');
        add_action("wp_ajax_finance_dispatch", [$this, 'levelDispatch']);
       

        global $wpdb;

        $this->tableAlince = $wpdb->prefix . 'alliance';
        $this->tableFinance = $wpdb->prefix . 'finance';
    }

    public function levelDispatch() {
       $payment_type = (@$_POST['payment-type'])? esc_attr($_POST['payment-type']):0;
       $dispatch_aids = (@$_POST['dispatch'])? $_POST['dispatch']:array();
       
       if(empty($payment_type)){
           echo wp_json_encode(array('status'=>'201','msg'=>'Please select a payment mathod'));
           wp_die();
       }
       if(empty($dispatch_aids)){
           echo wp_json_encode(array('status'=>'201','msg'=>'Please select agents for make payment'));
           wp_die();
       }
       $resData = array();
       foreach ($dispatch_aids as $aid){
           $resData[]=[
               'aid'=>$aid,
               'ptype'=>$payment_type
           ];
       }
       echo wp_json_encode(array('status'=>'200','data'=>$resData,'msg'=>''));
        wp_die();
    }
}
