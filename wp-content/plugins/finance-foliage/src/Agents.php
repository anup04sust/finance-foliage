<?php

namespace FinanceFoliage;

/**
 * Description of Agents
 *
 * @author anup
 */
class Agents {

    public $settings;
    public $tableName;

    public function __construct() {
        $this->settings = get_option('finance_foliage_settings');
        add_action("wp_ajax_addnew_agent", [$this, 'addNew']);
        add_action("wp_ajax_edit_agent", [$this, 'edit']);
        add_action("wp_ajax_verify_referral", [$this, 'verifyReferral']);
        add_action("wp_ajax_import_agents_csv", [$this, 'importCsv']);
        add_action("wp_ajax_sync_agents", [$this, 'syncAgents']);

        global $wpdb;

        $this->tableName = $wpdb->prefix . 'alliance';
    }

    public function addNew() {
        $aname = esc_attr($_POST['aname']);
        $created_at = esc_attr($_POST['created_at']);
        $sl_no = esc_attr($_POST['slno']);
        $referral = esc_attr($_POST['referral']);
        $wing = esc_attr($_POST['ref-wings']);
        $name_array = explode(" ", $aname);
        $user_login = $sl_no;
        $user_login .= ($name_array[0]) ? substr($name_array[0], 0, 3) : '';
        $user_login .= ($name_array[0]) ? substr(end($name_array), 0, 3) : '';

        $user_data['first_name'] = !empty($name_array[0]) ? $name_array[0] : '';
        $user_data['last_name'] = !empty(end($name_array)) ? end($name_array) : '';
        $user_data['display_name'] = $aname;
        $user_data['user_login'] = $user_login;
        $user_data['email'] = $user_login . '@example.me';
        $user_data['wing'] = $wing;
        $user_data['referral'] = $referral;
        $user_data['created_at'] = strtotime($created_at);
        $user_data['slno'] = trim($sl_no);

        $create_user = $this->addWpUser($user_data);
        if ($create_user['status']) {
            echo wp_json_encode(['message' => 'success', 'status' => 200, 'msg' => $create_user['msg']]);
        } else {
            echo wp_json_encode(['message' => $create_user['msg'], 'status' => 201]);
        }

        wp_die();
    }

    public function edit() {
        //print_r($_POST); die;
        $aname = esc_attr($_POST['aname']);
        $created_at = esc_attr($_POST['created_at']);
        $sl_no = esc_attr($_POST['slno']);
        $referral = esc_attr($_POST['referral']);
        $wing = esc_attr($_POST['ref-wings']);
        $name_array = explode(" ", $aname);
        $user_login = $sl_no;
        $user_login .= ($name_array[0]) ? substr($name_array[0], 0, 3) : '';
        $user_login .= ($name_array[0]) ? substr(end($name_array), 0, 3) : '';

        $user_data['first_name'] = !empty($name_array[0]) ? $name_array[0] : '';
        $user_data['last_name'] = !empty(end($name_array)) ? end($name_array) : '';
        $user_data['display_name'] = $aname;
        $user_data['user_login'] = $user_login;
        $user_data['email'] = $user_login . '@example.me';
        $user_data['wing'] = $wing;
        $user_data['referral'] = $referral;
        $user_data['created_at'] = strtotime($created_at);
        $user_data['slno'] = trim($sl_no);

        $update_user = $this->updateWpUser($user_data);
        if ($update_user['status']) {
            echo wp_json_encode(['message' => 'success', 'status' => 200, 'msg' => $update_user['msg']]);
        } else {
            echo wp_json_encode(['message' => $update_user['msg'], 'status' => 201]);
        }

        wp_die();
    }

    private function addWpUser($user_data) {

        $user_id = username_exists($user_data['user_login']);
        if (!$user_id && false == email_exists($user_data['email'])) {
            if ($this->referralHandCheck($user_data)) {
                return array('status' => false, 'msg' => __('Referral hand alredy fill, please check other hand'));
            }
            $random_password = wp_generate_password();
            $user_id = wp_create_user($user_data['user_login'], $random_password, $user_data['email']);
            $user = get_user_by('ID', $user_id);
            $user->add_role('finance_agent');
            add_user_meta($user_id, '_agent_slno', $user_data['slno']);
            add_user_meta($user_id, '_agent_referral', $user_data['referral']);
            add_user_meta($user_id, '_agent_created_at', $user_data['created_at']);
            wp_update_user(
                    array(
                        'ID' => $user_id,
                        'first_name' => $user_data['first_name'],
                        'last_name' => $user_data['last_name'],
                        'nickname' => $user_data['display_name'],
                        'display_name' => $user_data['display_name'],
                    )
            );

            global $wpdb;

            $alliance_id = $wpdb->insert($this->tableName, array(
                'user_id' => $user_id,
                'aid' => $user_data['slno'],
                'user_name' => $user_data['display_name'],
                'created_at' => $user_data['created_at'],
                'parent_node' => $user_data['referral'],
                'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
            ));

            if (!empty($user_data['referral']) && !empty($user_data['wing'])) {
                $response = $this->updateReferral($user_data['referral'], $user_data['wing'], $user_data['slno']);
                return array('status' => true, 'msg' => 'Agent added at level:' . $response);
            } else {
                return array('status' => true, 'msg' => 'Agent added successfully');
            }
        } else {
            return array('status' => false, 'msg' => __('User already exists'));
        }
    }

    private function updateWpUser($user_data) {

        $user_id = username_exists($user_data['user_login']);
        if (!$user_id && false == email_exists($user_data['email'])) {
    
            wp_update_user(
                    array(
                        'ID' => $user_id,
                        'first_name' => $user_data['first_name'],
                        'last_name' => $user_data['last_name'],
                        'nickname' => $user_data['display_name'],
                        'display_name' => $user_data['display_name'],
                    )
            );

            global $wpdb;

            $alliance_id = $wpdb->update(
                $this->tableName, 
                array(
                    'user_id' => $user_id,
                    'aid' => $user_data['slno'],
                    'user_name' => $user_data['display_name'],
                    'created_at' => $user_data['created_at'],
                    'parent_node' => $user_data['referral'],
                    'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
                ),
                array(
                    'aid' => $user_data['slno']
                )
            );

            if (!empty($user_data['referral']) && !empty($user_data['wing'])) {
                $response = $this->updateReferral($user_data['referral'], $user_data['wing'], $user_data['slno']);
                return array('status' => true, 'msg' => 'Agent updated at level:' . $response);
            } else {
                return array('status' => true, 'msg' => 'Agent updated successfully');
            }
        } else {
            return array('status' => false, 'msg' => __('No user exists'));
        }
    }

    private function updateReferral($referral, $wing, $alliance_id) {
        global $wpdb;

        if ($wing === 'L') {
            $alliance_id = $wpdb->update($this->tableName, array(
                'left_node' => $alliance_id), array('aid' => $referral));
        }
        if ($wing === 'R') {
            $alliance_id = $wpdb->update($this->tableName, array(
                'right_node' => $alliance_id), array('aid' => $referral));
        }
        $level_count = $this->updateNodeCount($referral, $wing);
        return $level_count;
    }

    private function updateNodeCount($referral, $wing, $level = 0) {

        if (empty($referral)) {
            return $level;
        }

        global $wpdb;
        if (!empty($referral) && $wing === 'L') {
            $wpdb->query("UPDATE " . $this->tableName . " SET left_node_count =  left_node_count + 1  WHERE aid=" . $referral);
            //pprint("UPDATE " . $this->tableName . " SET left_node_count =  left_node_count + 1  WHERE aid=" . $referral);
        }
        if (!empty($referral) && $wing === 'R') {
            $wpdb->query("UPDATE " . $this->tableName . " SET right_node_count = right_node_count + 1  WHERE aid=" . $referral);
            //pprint("UPDATE " . $this->tableName . " SET right_node_count = right_node_count + 1  WHERE aid=" . $referral);
        }

        $node_referral = $wpdb->get_row('SELECT parent_node,spos FROM ' . $this->tableName . ' WHERE  aid=' . $referral);

        if (!empty($node_referral)) {
            $level = $this->updateNodeCount($node_referral->parent_node, $node_referral->spos, $level++);
        } 
         return $level;
    }

    /*
     * Ajax ation verify_referral hook calback
     */

    public function verifyReferral() {
        $referral_id = $_POST['referral_id'];
        global $wpdb;
        $referral_data = $wpdb->get_row('SELECT left_node,right_node FROM ' . $this->tableName . ' WHERE  aid=' . $referral_id);
        if (!empty($referral_data)) {
            echo wp_json_encode(
                    array(
                        'left_node' => empty($referral_data->left_node) ? false : true,
                        'right_node' => empty($referral_data->right_node) ? false : true,
                        'status' => 200
                    )
            );
        } else {
            echo wp_json_encode(
                    array(
                        'left_node' => false,
                        'right_node' => false,
                        'status' => 201
                    )
            );
        }
        wp_die();
    }

    private function referralHandCheck($user_data) {
        if (empty($user_data['referral'])) {
            return false;
        }
        global $wpdb;
        $referral_data = $wpdb->get_row('SELECT left_node,right_node FROM ' . $this->tableName . ' WHERE  aid=' . $user_data['referral']);
        if ($user_data['wing'] === 'L' && !empty($referral_data->left_node)) {
            return true;
        }
        if ($user_data['wing'] === 'R' && !empty($referral_data->right_node)) {
            return true;
        }

        return false;
    }

    public function importCsv() {
        $agentsRow = array();
        $csvFile = fopen($_FILES['agentcollection']['tmp_name'], 'r');
        $count = 0;
        while (($getData = fgetcsv($csvFile, 10000, ",")) !== FALSE) {
            if (!empty($getData) && count($getData) === 4) {
                if ($count >= 1) {//remove first row
                    $agentsRow[$count] = $getData;
                }
                $count++;
            }
        }
        if (empty($_POST['import-btn'])) {

            echo wp_json_encode(array('status' => 200, 'row_count' => count($agentsRow)));
        } else {
            $import_status = array('success' => 0, 'fail' => 0);
            foreach ($agentsRow as $agent) {
                $aname = esc_attr($agent[1]);
                $created_at = esc_attr($_POST['created_at']);
                $sl_no = esc_attr($agent[0]);
                $referral = esc_attr($agent[3]);
                $wing = esc_attr($agent[2]);
                $name_array = explode(" ", $aname);
                $user_login = $sl_no;
                $user_login .= ($name_array[0]) ? substr($name_array[0], 0, 3) : '';
                $user_login .= ($name_array[0]) ? substr(end($name_array), 0, 3) : '';

                $user_data['first_name'] = !empty($name_array[0]) ? $name_array[0] : '';
                $user_data['last_name'] = !empty(end($name_array)) ? end($name_array) : '';
                $user_data['display_name'] = $aname;
                $user_data['user_login'] = $user_login;
                $user_data['email'] = $user_login . '@example.me';
                $user_data['wing'] = $wing;
                $user_data['referral'] = $referral;
                $user_data['created_at'] = strtotime($created_at);
                $user_data['slno'] = trim($sl_no);

                $create_user = $this->addWpUser($user_data);

                if ($create_user['status']) {

                    $import_status['success'] += 1;
                } else {
                    $import_status['fail'] += 1;
                }
            }
            echo wp_json_encode(array('status' => 200,'row_count'=>sprintf('Success:%s Fail:%s',$import_status['success'],$import_status['fail'])));
        }
        wp_die();
    }

    public function syncAgents() {
        $request_stime = strtotime('now');
        $sync_status = esc_attr($_POST['sync_status']);
        $bill_duration = esc_attr($_POST['bill_duration']);
        $sync_date = esc_attr($_POST['sync_date']);
        
        $this->resetAgentsLevel($sync_date);
        $response = '';
        if ($bill_duration == 'weekly') {
            $bill = ff_get_bill_duration($sync_date);
            $response = $this->syncNodeCount($bill['week_start'], $bill['week_end']);
            
        } elseif ($bill_duration == 'monthly') {
            
            $bill = ff_get_bill_duration($sync_date);
            $response = $this->syncNodeCount($bill['month_start'], $bill['month_end']);
            
        } else {
            
            $response = $this->syncNodeCount(strtotime($sync_date), strtotime($sync_date));
        }
         $request_etime = strtotime('now');
        echo wp_json_encode(
                [
                    'status' => 200, 
                    'msg' => sprintf('Execution Time:%s-%s',date('Y.m.d H:i:s',$request_stime),date('Y.m.d H:i:s',$request_etime)),
                    'data'=>$response
                ]
                );
        wp_die();
    }

    private function resetAgentsLevel($sdate) {
        global $wpdb;

        $updated = $wpdb->query('UPDATE ' . $this->tableName . ' SET right_node_count = \'0\',left_node_count = \'0\'');
        $settings = get_option('finance_foliage_settings');
        $settings['last_sync_date'] = strtotime('now');
        $settings['sync_date'] = strtotime($sdate);
        update_option('finance_foliage_settings', $settings);
    }

    private function syncNodeCount($sdate, $edate) {
        
        global $wpdb;
        $nodes = $wpdb->get_results('SELECT * FROM ' . $this->tableName . ' WHERE created_at >=' . $sdate . ' AND created_at <=' . $edate);
        $nodeCount = array();
        foreach ($nodes as $key=>$node) {
            $nodeCount[$key] = $this->updateNodeCount($node->parent_node, $node->spos);
            // pprint($nodeCount);
        }
        return array('nodes'=>count($nodes),'update'=>$nodeCount);
    }
}
