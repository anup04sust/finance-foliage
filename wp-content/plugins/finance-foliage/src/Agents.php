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
        add_action("wp_ajax_verify_referral", [$this, 'verifyReferral']);
        //add_action("wp_ajax_nopriv_my_user_vote", "my_must_login");
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

    private function addWpUser($user_data) {

        $user_id = username_exists($user_data['user_login']);
        if (!$user_id && false == email_exists($user_data['email'])) {
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

    private function updateNodeCount($referral, $wing, $level = 1) {

        if (empty($referral)) {
            return $level;
        }

        global $wpdb;
        if ($wing === 'L') {
            $wpdb->query("UPDATE " . $this->tableName . " SET left_node_count =  left_node_count + 1  WHERE aid=" . $referral);
            pprint("UPDATE " . $this->tableName . " SET left_node_count =  left_node_count + 1  WHERE aid=" . $referral);
        }
        if ($wing === 'R') {
            $wpdb->query("UPDATE " . $this->tableName . " SET right_node_count = right_node_count + 1  WHERE aid=" . $referral);
            pprint("UPDATE " . $this->tableName . " SET right_node_count = right_node_count + 1  WHERE aid=" . $referral);
        }

        $node_referral = $wpdb->get_row('SELECT parent_node,spos FROM ' . $this->tableName . ' WHERE  aid=' . $referral);
        pprint($node_referral);
        if (!empty($node_referral)) {
            return $this->updateNodeCount($node_referral->parent_node, $node_referral->spos, $level++);
        } else {
            return $level;
        }
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
}
