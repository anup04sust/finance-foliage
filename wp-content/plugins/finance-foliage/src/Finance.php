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
        global $wpdb;
        $payment_type = (@$_POST['payment-type']) ? esc_attr($_POST['payment-type']) : 0;
        $dispatch_aids = (@$_POST['dispatch']) ? $_POST['dispatch'] : array();
        $payment_date= (@$_POST['payment_date']) ? strtotime($_POST['payment_date']) : strtotime('now');

        if (empty($payment_type)) {
            echo wp_json_encode(array('status' => '201', 'msg' => 'Please select a payment mathod'));
            wp_die();
        }
        if (empty($dispatch_aids)) {
            echo wp_json_encode(array('status' => '201', 'msg' => 'Please select agents for make payment'));
            wp_die();
        }
        $resData = array();
        foreach ($dispatch_aids as $aid) {
            $agent_info = $wpdb->get_row("SELECT * FROM " . $this->tableAlince . " WHERE aid='" . $aid . "'");
            //pprint($agent_info);
            $payment = $this->addPayment($agent_info,$payment_type,$payment_date);
            $resData[] = [
                'aid' => $aid,
                'ptype' => $payment_type,
                'data' => $payment,
            ];
        }
        echo wp_json_encode(array('status' => '200', 'data' => $resData, 'msg' => ''));
        wp_die();
    }

    private function addPayment($agent, $ptype,$payment_date) {
        global $wpdb;
        $financial_level = ff_financial_level($agent);
        if (!empty($financial_level)) {
            $node_payment_lcount = 0;
            $node_payment_rcount = 0;
            $higher_Level = 0;
            foreach ($financial_level as $aflevel) {
                $node_payment_lcount += $aflevel['left'];
                $node_payment_rcount += $aflevel['right'];
                $paymentData = array(
                            'aid' => $agent->aid,
                            'level' => $aflevel['level'],
                            'left_n' => $aflevel['left'],
                            'right_n' => $aflevel['right'],
                            'amount' => $aflevel['amount'],
                            'ptype' => $ptype,
                            'created_at' => $payment_date,
                        );
                $higher_Level=$aflevel['level'];
                $wpdb->insert($this->tableFinance,$paymentData);
                $last_inserted_id = $wpdb->insert_id;
                ff_filelog('addPayment', $last_inserted_id.':'. serialize($paymentData));
                ff_filelog('addPayment', 'Total Left:'. $node_payment_lcount);
                ff_filelog('addPayment', 'Total Right:'. $node_payment_rcount);
                
            }
            if(($node_payment_lcount+$node_payment_rcount)>0){
               $updateSql = "UPDATE " . $this->tableAlince;
               $updateSql .= " SET left_node_count =  left_node_count - ".$node_payment_lcount;
               $updateSql .=",right_node_count=right_node_count - ".$node_payment_rcount;
               $updateSql .=",active_level= ".$higher_Level;
               $updateSql .="  WHERE aid='" . $agent->aid . "'";
               $update_l = $wpdb->query($updateSql); 
             ff_filelog('addPayment', 'UPDATEQuery:'. $updateSql);
             
            }
        }
        return $last_inserted_id;
    }
}
