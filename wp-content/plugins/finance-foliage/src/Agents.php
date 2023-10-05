<?php

namespace FinanceFoliage;

/**
 * Description of Agents
 *
 * @author anup
 */
class Agents {

    public $settings;
    public $tableAlince;
    public $tableFinance;

    public function __construct() {
        $this->settings = get_option('finance_foliage_settings');
        add_action("wp_ajax_addnew_agent", [$this, 'addNew']);
        add_action("wp_ajax_edit_agent", [$this, 'edit']);
        add_action("wp_ajax_verify_referral", [$this, 'verifyReferral']);
        add_action("wp_ajax_import_agents_csv", [$this, 'importCsv']);
        add_action("wp_ajax_sync_agents", [$this, 'syncAgents']);
        add_action("wp_ajax_analysis_agents_csv", [$this, 'analysisCsv']);

        global $wpdb;

        $this->tableAlince = $wpdb->prefix . 'alliance';
        $this->tableFinance = $wpdb->prefix . 'finance';
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
        ff_filelog('addNew', serialize($user_data));
        //$create_user = $this->addWpUser($user_data);
        $create_user = $this->addAgent($user_data);
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

    private function addAgent($user_data, $entry_type = "node") {
        global $wpdb;
        $ref = $wpdb->get_row("SELECT aid FROM " . $this->tableAlince . " WHERE aid='" . $user_data['slno'] . "'");
        if (empty($ref)) {
            $alliance_id = $wpdb->insert($this->tableAlince, array(
                'user_id' => 0,
                'aid' => $user_data['slno'],
                'user_name' => $user_data['display_name'],
                'created_at' => $user_data['created_at'],
                'parent_node' => $user_data['referral'],
                'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
            ));
            ff_filelog('addAgent new ', $user_data['slno']);
        } else {
            $alliance_id = $wpdb->update($this->tableAlince, array(
                'user_id' => 0,
                'aid' => $user_data['slno'],
                'user_name' => $user_data['display_name'],
                'created_at' => $user_data['created_at'],
                'parent_node' => $user_data['referral'],
                'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
                    ), array('aid' => $user_data['slno']));
            ff_filelog('addAgent Update ', $user_data['slno']);
        }
        if (!empty($user_data['referral']) && !empty($user_data['wing'])) {
            $response = $this->updateReferral($user_data['referral'], $user_data['wing'], $user_data['slno'], $entry_type);
            ff_filelog('addNew updateReferral', $response);
            return array('status' => true, 'msg' => 'Agent added at level:' . $response);
        } else {
            return array('status' => true, 'msg' => 'Agent added successfully');
        }
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
            ff_filelog('addNew', 'WP User ID ' . $user_id);
            global $wpdb;
            $ref = $wpdb->get_row("SELECT aid FROM " . $this->tableAlince . " WHERE aid='" . $user_data['slno'] . "'");
            if (empty($ref)) {
                $alliance_id = $wpdb->insert($this->tableAlince, array(
                    'user_id' => $user_id,
                    'aid' => $user_data['slno'],
                    'user_name' => $user_data['display_name'],
                    'created_at' => $user_data['created_at'],
                    'parent_node' => $user_data['referral'],
                    'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
                ));
                ff_filelog('addNew ', $user_data['slno']);
            } else {
                $alliance_id = $wpdb->update($this->tableAlince, array(
                    'user_id' => $user_id,
                    'aid' => $user_data['slno'],
                    'user_name' => $user_data['display_name'],
                    'created_at' => $user_data['created_at'],
                    'parent_node' => $user_data['referral'],
                    'spos' => !empty($user_data['referral']) ? $user_data['wing'] : '0',
                        ), array('aid' => $user_data['slno']));
                ff_filelog('Update ', $user_data['slno']);
            }

            if (!empty($user_data['referral']) && !empty($user_data['wing'])) {
                $response = $this->updateReferral($user_data['referral'], $user_data['wing'], $user_data['slno']);
                ff_filelog('addNew updateReferral', $response);
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
                    $this->tableAlince,
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

    private function updateReferral($referral, $wing, $alliance_id, $entry_type) {
        global $wpdb;
        $level_count = 0;
        $ref = $wpdb->get_row("SELECT aid FROM " . $this->tableAlince . " WHERE aid='" . $referral . "'");
        if (empty($ref)) {
            $referral_id = $wpdb->insert($this->tableAlince, array(
                'user_id' => '0',
                'aid' => $referral,
                'user_name' => 'Unknown',
                'created_at' => strtotime('now'),
                'spos' => '0',
            ));
        }
        if ($wing === 'L') {
            $alliance_id = $wpdb->update($this->tableAlince, array(
                'left_node' => $alliance_id), array('aid' => $referral));
            ff_filelog('addNew updateReferral L', $referral . '-' . $alliance_id);
        }
        if ($wing === 'R') {
            $alliance_id = $wpdb->update($this->tableAlince, array(
                'right_node' => $alliance_id), array('aid' => $referral));
            ff_filelog('addNew updateReferral R', $referral . '-' . $alliance_id);
        }
        if ($entry_type != 'csv') {
            $level_count = $this->updateNodeCount($referral, $wing, $alliance_id);
            $wpdb->update($this->tableAlince, array(
                'update_status' => 1, 'update_sync' => 1), array('aid' => $alliance_id));
            ff_filelog('addNew updateNodeCount', $level_count);
        }
        //ff_filelog('addNew updateNodeCount2', serialize($level_count));

        return $level_count;
    }

    private function updateNodeCount($referral, $wing, $level = 0) {

        if (empty($referral)) {
            return $level;
        }

        global $wpdb;
        if (!empty($referral) && $wing === 'L') {
            $wpdb->query("UPDATE " . $this->tableAlince . " SET left_node_count =  left_node_count + 1, all_node_count_left =  all_node_count_left + 1  WHERE aid='" . $referral . "'");
            ff_filelog('addNew updateNodeCount L', $referral);
        }
        if (!empty($referral) && $wing === 'R') {
            $wpdb->query("UPDATE " . $this->tableAlince . " SET right_node_count = right_node_count + 1, all_node_count_right =  all_node_count_right + 1  WHERE aid='" . $referral . "'");
            ff_filelog('addNew updateNodeCount R', $referral);
        }

        $node_referral = $wpdb->get_row("SELECT parent_node,spos FROM " . $this->tableAlince . " WHERE  aid='" . $referral . "'");

        if (!empty($node_referral)) {
            $level = $this->updateNodeCount($node_referral->parent_node, $node_referral->spos, ++$level);
        }
        return $level;
    }

    private function updateSyncCount($referral, $wing, $aid, $level = 0) {

        if (empty($referral)) {
            return $level;
        }
        ff_filelog('updateSyncCount:', $referral . '-' . $wing . '-' . $aid);
        global $wpdb;
        $update = $update_l = $update_r = 0;
        if (!empty($referral) && $wing === 'L') {
            $update_l = $wpdb->query("UPDATE " . $this->tableAlince . " SET all_node_count_left =  all_node_count_left + 1  WHERE aid='" . $referral . "'");
        } elseif (!empty($referral) && $wing === 'R') {
            $update_r = $wpdb->query("UPDATE " . $this->tableAlince . " SET all_node_count_right = all_node_count_right + 1  WHERE aid='" . $referral . "'");
        }

        $node_referral = $wpdb->get_row("SELECT aid,parent_node,spos FROM " . $this->tableAlince . " WHERE  aid='" . $referral . "'");
        ff_filelog('updateSyncCount:', $aid . '-L:' . $update_l . '-R:' . $update_r);
        if ($wpdb->last_error != '') {
            ff_filelog('updateSyncCount:', ' wpdb error-' . $wpdb->last_error);
        }
        if (!empty($node_referral)) {
            $level = $this->updateSyncCount($node_referral->parent_node, $node_referral->spos, $node_referral->aid, $level++);
        }
        return $level;
    }

    private function updateActiveSyncCount($referral, $wing, $aid, $level = 0) {

        if (empty($referral)) {
            return $level;
        }
        ff_filelog('updateActiveSyncCount:', $referral . '-' . $wing . '-' . $aid);
        global $wpdb;
        $update = $update_l = $update_r = 0;
        if (!empty($referral) && $wing === 'L') {
            $update_l = $wpdb->query("UPDATE " . $this->tableAlince . " SET 	left_node_count =  	left_node_count + 1  WHERE aid='" . $referral . "'");
        } elseif (!empty($referral) && $wing === 'R') {
            $update_r = $wpdb->query("UPDATE " . $this->tableAlince . " SET 	right_node_count = 	right_node_count + 1  WHERE aid='" . $referral . "'");
        }

        $node_referral = $wpdb->get_row("SELECT aid,parent_node,spos FROM " . $this->tableAlince . " WHERE  aid='" . $referral . "'");
        ff_filelog('updateSyncCount:', $aid . '-L:' . $update_l . '-R:' . $update_r);
        if ($wpdb->last_error != '') {
            ff_filelog('updateSyncCount:', ' wpdb error-' . $wpdb->last_error);
        }
        if (!empty($node_referral)) {
            $level = $this->updateActiveSyncCount($node_referral->parent_node, $node_referral->spos, $node_referral->aid, $level++);
        }
        return $level;
    }

    /*
     * Ajax ation verify_referral hook calback
     */

    public function verifyReferral() {
        $referral_id = $_POST['referral_id'];
        global $wpdb;
        $referral_data = $wpdb->get_row("SELECT left_node,right_node FROM " . $this->tableAlince . " WHERE  aid='" . $referral_id . "'");
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
        $referral_data = $wpdb->get_row("SELECT left_node,right_node FROM " . $this->tableAlince . " WHERE  aid='" . $user_data['referral'] . "'");
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
                ff_filelog('importCsv', serialize($user_data));
                // $create_user = $this->addWpUser($user_data);
                $create_user = $this->addAgent($user_data, 'csv');
                ff_filelog('importCsv wp user', serialize($create_user));
                if ($create_user['status']) {

                    $import_status['success'] += 1;
                } else {
                    $import_status['fail'] += 1;
                }
            }
            $this->syncAgents('allsync');
            //$this->syncAgents('active');
            echo wp_json_encode(array('status' => 200, 'row_count' => sprintf('Success:%s Fail:%s', $import_status['success'], $import_status['fail'])));
        }
        wp_die();
    }

    public function syncAgents($sync_status = null, $sync_reset = 0) {
        $request_stime = strtotime('now');
        $sync_status = !empty($_POST['sync_status']) ? esc_attr($_POST['sync_status']) : $sync_status;
        $sync_reset = !empty($_POST['resetall']) ? esc_attr($_POST['resetall']) : $sync_reset;
        $response = [];
        global $wpdb;
        if ($sync_status === 'allsync') {

            $updated = $wpdb->query("UPDATE " . $this->tableAlince . " SET all_node_count_left = 0,all_node_count_right = 0, update_status = 0");

            ff_filelog('-syncAgents-:set hand 0:', $updated);
            $nodeLevel = $this->syncGlobalHands();
            $response = [
                'status' => 200,
                'msg' => sprintf('Total node update %s', $nodeLevel),
                'progress' => get_sync_progress()
            ];
        } else if ($sync_status === 'active') {
            //New agents synchronization
            $updated = $wpdb->query("UPDATE " . $this->tableAlince . " SET left_node_count = all_node_count_left,right_node_count = all_node_count_right, update_sync = 1, active_level=0,active_circle=0");
            $syncQuery = "SELECT aid  FROM " . $this->tableFinance . " GROUP BY aid";
            $payments = $wpdb->get_results($syncQuery);
            if (!empty($payments)) {
                foreach ($payments as $node) {
                    $this->syncPaidNodes($node);
                }
            }
            $response = [
                'status' => 200,
                'msg' => sprintf('Total node update %s', count($payments)),
                'progress' => get_sync_new_progress()
            ];
        }
        if (!empty($_POST['action']) && $_POST['action'] == 'sync_agents') {
            echo wp_json_encode($response);
            wp_die();
        } else {
            return $response;
        }
    }

    private function resetAgentsLevel($sdate) {
        global $wpdb;

        $updated = $wpdb->query('UPDATE ' . $this->tableAlince . ' SET right_node_count = \'0\',left_node_count = \'0\'');
        $settings = get_option('finance_foliage_settings');
        $settings['last_sync_date'] = strtotime('now');
        $settings['sync_date'] = strtotime($sdate);
        update_option('finance_foliage_settings', $settings);
    }

    private function syncNodeCount($sdate, $edate) {

        global $wpdb;
        $nodes = $wpdb->get_results('SELECT * FROM ' . $this->tableAlince . ' WHERE created_at >=' . $sdate . ' AND created_at <=' . $edate);
        $nodeCount = array();
        foreach ($nodes as $key => $node) {
            $nodeCount[$key] = $this->updateNodeCount($node->parent_node, $node->spos);
            // pprint($nodeCount);
        }
        return array('nodes' => count($nodes), 'update' => $nodeCount);
    }

    public function analysisCsv() {
        global $wpdb;
        $csvFile = fopen($_FILES['agentcollection']['tmp_name'], 'r');
        $count = 0;
        $hasError = false;
        $agentsRow = array();
        $agentsFrontLine = array();
        $parents = array();
        $report = array();
        while (($getData = fgetcsv($csvFile, 10000, ",")) !== FALSE) {
            if (!empty($getData) && count($getData) === 4) {
                if ($count >= 1) {//remove first row
                    $aid = trim($getData[0]);
                    $name = $getData[1];
                    $ref = trim($getData[3]);
                    $pos = $getData[2];
                    if (array_key_exists($aid, $agentsRow)) {
                        $hasError = true;
                        $report[] = array(
                            'status' => 'danger',
                            'msg' => $aid . ': Dublicate agent, file row ' . $count . ', CID:' . $aid . '[' . $name . ']',
                        );
                    } else {
                        $agentsRow[$aid] = $getData;
                    }


                    if (empty($getData[3])) {
                        $agentsFrontLine[$aid] = $aid;
                    } else {
                        if (!empty($parents[$ref][$pos])) {
                            $hasError = true;
                            $report[] = array(
                                'status' => 'danger',
                                'msg' => $ref . ': Referral already asign hand ' . $pos . ' file row ' . $count . ', CID:' . $aid . '[' . $name . ']',
                            );
                        } else {
                            $parents[$ref][$pos] = $aid;
                        }
                    }
                }
                $count++;
            }
        }
        if (!empty($parents)) {
            $report[] = array(
                'status' => 'success',
                'msg' => count($parents) . ' Referral agents found',
            );
            foreach ($parents as $ref => $node) {
                $agent = $wpdb->get_row('SELECT aid FROM ' . $this->tableAlince . ' WHERE aid ="' . $ref . '"');
                if (!array_key_exists($ref, $agentsRow) && empty($agent)) {
                    $hasError = true;
                    $report[] = array(
                        'status' => 'danger',
                        'msg' => $ref . ': Referral informetion not found',
                    );
                }
            }
        } else {
            $hasError = true;
            $report[] = array(
                'status' => 'danger',
                'msg' => 'No Referral found',
            );
        }
        $report[] = array(
            'status' => (count($agentsFrontLine) > 0) ? 'success' : 'warning',
            'msg' => count($agentsFrontLine) . ' Front Line agents found',
        );
        $report[] = array(
            'status' => 'success',
            'msg' => count($agentsRow) . ' Agents found',
        );

        foreach ($agentsRow as $aid => $node) {

            $agent = $wpdb->get_row('SELECT aid FROM ' . $this->tableAlince . ' WHERE aid ="' . $aid . '"');
            if (!empty($agent)) {
                $hasError = true;
                $report[] = array(
                    'status' => 'danger',
                    'msg' => $aid . ': already inserted in system',
                );
            }
        }
        echo wp_json_encode(array('status' => 200, 'hasError' => $hasError, 'report' => $report));
        wp_die();
    }

    public function syncGlobalHands() {
        ff_filelog('-syncGlobalHands-:start', strtotime('now'));
        global $wpdb;
        $childAgentsQuery = "SELECT aid, parent_node, spos FROM " . $this->tableAlince . " ORDER BY ID DESC";
        $childAgents = $wpdb->get_results($childAgentsQuery);
        $count = 0;
        if (!empty($childAgents)) {
            foreach ($childAgents as $agent) {
                $tl = $this->updateAllHands($agent->parent_node, $agent->spos, $childAgents);
                $wpdb->query("UPDATE " . $this->tableAlince . " SET update_status=1  WHERE aid='" . $agent->aid . "'");
                $count++;
            }
        }
        return $count;
    }

    public function updateAllHands($parent, $wing, $agents, $level = 0) {

        if (empty($parent)) {
            return $level;
        }

        global $wpdb;
        if (!empty($wing) && $wing === 'L') {
            $wpdb->query("UPDATE " . $this->tableAlince . " SET all_node_count_left =  all_node_count_left + 1  WHERE aid='" . $parent . "'");
        } else if (!empty($wing) && $wing === 'R') {
            $wpdb->query("UPDATE " . $this->tableAlince . " SET all_node_count_right =  all_node_count_right + 1  WHERE aid='" . $parent . "'");
        }

        $node_referral = ff_getAgent($agents, $parent);
        ff_filelog('-updateAllHands-:', $node_referral->aid . '-' . $node_referral->parent_node . '-' . $node_referral->spos . '-' . $level);
        if (!empty($node_referral)) {
            $level = $this->updateAllHands($node_referral->parent_node, $node_referral->spos, $agents, ++$level);
        }
        return $level;
    }

    public function syncPaidNodes($node) {
        global $wpdb;
        $nodeLevels = $wpdb->get_results("SELECT * FROM " . $this->tableFinance . " WHERE aid='" . $node->aid . "' ORDER BY created_at ASC,level ASC");
        $maxCircle = 0;
        $maxLevel = 0;
        $nodeLeft = 0;
        $nodeRight = 0;
        foreach ($nodeLevels as $payment) {
            $maxLevel = $payment->level;
            $nodeLeft += $payment->left_n;
            $nodeRight += $payment->right_n;
            if ($payment->level == 4) {
                $maxCircle += 1;
                $maxLevel = 0;
            }
        }
        $updateQuery = "UPDATE " . $this->tableAlince . " SET left_node_count = left_node_count - " . $nodeLeft;
        $updateQuery .= ", right_node_count = right_node_count - " . $nodeRight;
        $updateQuery .= ", active_level = " . $maxLevel;
        $updateQuery .= ", active_circle = " . $maxCircle;
        $updateQuery .= " WHERE aid='" . $node->aid . "'";

        $status = $wpdb->query($updateQuery);
        ff_filelog('-syncPaidNodes-:[' . $status . ']', $updateQuery);
    }
}
