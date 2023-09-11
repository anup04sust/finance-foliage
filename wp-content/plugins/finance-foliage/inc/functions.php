<?php

// set the default timezone to use.
date_default_timezone_set('ASIA/DHAKA');
/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */

function ff_filelog($type, $log_msg) {
    $log_filename = FINANCE_FOLIGE_DIR . "/logs";
    if (!file_exists($log_filename)) {
        // create directory/folder uploads.
        mkdir($log_filename, 0777, true);
    }
    $log_file = $log_filename . '/' . date('Ymd') . '.log';
    file_put_contents($log_file, date('H:i:s') . '-' . $type . ':' . $log_msg . "\n", FILE_APPEND);
}

function ff_getrandomstring($length) {

    global $template;
    settype($template, "string");

    $template = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    /* this line can include numbers or not */

    settype($length, "integer");
    settype($rndstring, "string");
    settype($a, "integer");
    settype($b, "integer");

    for ($a = 0; $a <= $length; $a++) {
        $b = rand(0, strlen($template) - 1);
        $rndstring .= $template[$b];
    }

    return $rndstring;
}

function ff_get_referral_agents() {
    $agents_options = [];
    global $wpdb;

    $referral_nodes = $wpdb->get_results("SELECT aid,user_name FROM " . $wpdb->prefix . "alliance  WHERE (left_node IS NULL OR left_node='0') OR (right_node IS NULL OR right_node='0')  ORDER BY user_name ASC");
    if (!empty($referral_nodes)) {
        foreach ($referral_nodes as $node) {
            $agents_options[$node->aid] = $node->user_name . '(' . $node->aid . ')';
        }
    }

    return $agents_options;
}

/*
 * @$agent_info Object
 */

function ff_get_agaent_level($agent_info) {
    $options = get_option('finance_foliage_settings');
    if (empty($options['finance_foliage_levels'])) {
        $finance_levels = array(
            array(
                'level' => 1,
                'left_node' => 1,
                'right_node' => 1,
                'amount' => 1440
            ),
            array(
                'level' => 2,
                'left_node' => 2,
                'right_node' => 2,
                'amount' => 2250
            ),
            array(
                'level' => 3,
                'left_node' => 4,
                'right_node' => 4,
                'amount' => 4320
            ),
            array(
                'level' => 4,
                'left_node' => 8,
                'right_node' => 8,
                'amount' => 8640
            ),
            array(
                'level' => 5,
                'left_node' => 15,
                'right_node' => 15,
                'amount' => 16650
            ),
        );
    } else {
        $finance_levels = $options['finance_foliage_levels'];
    }
    $response = array('level' => 0, 'amount' => 0);
    if (!empty($agent_info->left_node_count) && !empty($agent_info->right_node_count)) {
        foreach ($finance_levels as $settings) {

            if ($agent_info->left_node_count >= $settings['left_node'] && $agent_info->right_node_count >= $settings['right_node']) {

                $response = array(
                    'level' => $settings['level'],
                    'amount' => $settings['level_amount']
                );
            }
        }
    }

    return $response;
}

function ff_get_agents_tree($agent_root) {
    global $wpdb;
    $nodes = $wpdb->get_row('SELECT aid FROM ' . $wpdb->prefix . 'alliance' . ' WHERE ID="' . $agent_root . '"');
    if (!empty($nodes)) {
        $agents_tree_array = ff_generate_tree_array($nodes->aid);

        $tree_html = ff_generateHtmlTree($agents_tree_array);

        return $tree_html;
    }
}

function ff_generate_tree_array($agent_root) {

    if (empty($agent_root)) {
        return [];
    }
    global $wpdb;
    $nodes = $wpdb->get_row("SELECT * FROM " . $wpdb->prefix . "alliance" . " WHERE aid='" . $agent_root . "'");
    $left_node = !empty($nodes->left_node) ? $nodes->left_node : 0;
    $right_node = !empty($nodes->right_node) ? $nodes->right_node : 0;
    $leftArray = ff_generate_tree_array($left_node);
    $rightArray = ff_generate_tree_array($right_node);
    return [
        'node_aid' => $nodes->aid,
        'node_id' => $nodes->ID,
        'node' => $nodes->user_name,
        'left_node_count' => $nodes->left_node_count,
        'right_node_count' => $nodes->right_node_count,
        'all_node_count_left' => $nodes->all_node_count_left,
        'all_node_count_right' => $nodes->all_node_count_right,
        'left' => $leftArray,
        'right' => $rightArray,
        'created_at' => $nodes->created_at,
        'created_str' => date("D jS, M Y", $nodes->created_at),
        'level' => ff_get_agaent_level($nodes)
    ];
}

function ff_generateHtmlTree($nodes, $tree_level = 0) {

    $html = '';

    if (!empty($nodes)) {
        $bill_duration = ff_get_bill_duration();

        $modal_data = array(
            'node_aid' => $nodes['node_aid'],
            'node_id' => $nodes['node_id'],
            'node' => $nodes['node'],
            'left_node_count' => $nodes['left_node_count'],
            'right_node_count' => $nodes['right_node_count'],
            'all_node_count_left' => $nodes['all_node_count_left'],
            'all_node_count_right' => $nodes['all_node_count_right'],
            'created_str' => $nodes['created_str'],
            'level' => $nodes['level']
        );

        if ($bill_duration['bill_type'] === 'daily') {
            $node_status_class = ($nodes['created_at'] >= $bill_duration['bill_date']) ? 'active-node' : 'disabled-node';
        }
        if ($bill_duration['bill_type'] === 'weekly') {
            $node_status_class = ($nodes['created_at'] >= $bill_duration['week_start'] && $nodes['created_at'] <= $bill_duration['week_end']) ? 'active-node' : 'disabled-node';
        }
        if ($bill_duration['bill_type'] === 'monthly') {
            $node_status_class = ($nodes['created_at'] >= $bill_duration['month_start'] && $nodes['created_at'] <= $bill_duration['month_end']) ? 'active-node' : 'disabled-node';
        }
        $html .= '<li><a class="node-link ' . $node_status_class . '" data-all="' . base64_encode(json_encode($modal_data)) . '" data-aid="' . $nodes['node_aid'] . '" data-id="' . $nodes['node_id'] . '" href="#" title="' . $nodes['node'] . '"><img class="img-circle elevation-2" src="' . FINANCE_FOLIGE_DIR_URL . 'assets/images/user-64x64.png" alt="User Avatar"><span>' . $nodes['node_aid'] . '</span><span class="view-more"><i class="fas fa-angle-down"></i></span></a>';

        if (!empty($nodes['left']) || !empty($nodes['right'])) {
            $html .= '<ul class="level level-' . $tree_level . '">';
            $html .= !empty($nodes['left']) ? ff_generateHtmlTree($nodes['left'], $tree_level++) : ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'L');
            $html .= !empty($nodes['right']) ? ff_generateHtmlTree($nodes['right'], $tree_level++) : ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'R');
            $html .= '</ul>';
        } else if (empty($nodes['left']) || empty($nodes['right'])) {
            $html .= '<ul>';
            $html .= ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'L');
            $html .= ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'R');
            $html .= '</ul>';
        }

        $html .= '</li>';
    }

    return $html;
}

function ff_add_empty_tree_node($ref, $node, $pos) {
    $foliage_settings = get_option('finance_foliage_settings');
    $url_arg = array(
        'referral' => $ref,
        'wing' => $pos,
        'node' => $node,
        'redirect' => 'agentnode_single',
    );
    $add_new_link = esc_url(add_query_arg($url_arg, get_permalink($foliage_settings['agentnode_addnew_page_id'])));

    $empty = '<li><a class="node-add" data-aid="0" data-id="0" href="' . $add_new_link . '" title="0"><img class="img-circle elevation-2" src="' . FINANCE_FOLIGE_DIR_URL . 'assets/images/user-64x64-add.png" alt="User Avatar"><span>Add Child</span></a>';
    return $empty;
}

function ff_get_treetable($nodes) {
    $html = '';

    if (!empty($nodes)) {

        $html .= '<tr>';
        $html .= '<td>' . $nodes['node_aid'] . '</td>';
        $html .= '<td>' . $nodes['node'] . '</td>';
        $html .= '<td>' . $nodes['left_node_count'] . '</td>';
        $html .= '<td>' . $nodes['right_node_count'] . '</td>';
        $html .= '<td>' . $nodes['level']['level'] . '</td>';
        $html .= '<td>' . $nodes['level']['amount'] . '</td>';
        $html .= '<td>' . date("D jS, M Y", $nodes['created_at']) . '</td>';

        $html .= '</tr>';

        if (!empty($nodes['left']) || !empty($nodes['right'])) {

            $html .= ff_get_treetable($nodes['left']);
            $html .= ff_get_treetable($nodes['right']);
        }
    }

    return $html;
}

function ff_generateWeekList() {
    $currentDate = date('Y-m-d');
    $currentDayOfWeek = date('N', strtotime($currentDate));

    // If today is Thursday or later, we consider this week's Thursday as the start of the week.
    // Otherwise, we consider last week's Thursday as the start of the week.
    if ($currentDayOfWeek >= 4) {
        $startOfWeek = date('Y-m-d', strtotime($currentDate . ' next Thursday'));
    } else {
        $startOfWeek = date('Y-m-d', strtotime($currentDate . ' last Thursday'));
    }

    $endOfWeek = date('Y-m-d', strtotime($startOfWeek . ' +6 days'));

    return [
        'start_date' => $startOfWeek,
        'end_date' => $endOfWeek
    ];
}

function ff_week_start_end($date = '') {
    $timezone = new DateTimeZone('Asia/Dhaka');

    $datetime = empty($date) ? new DateTime('now') : new DateTime($date);
    $datetime->setTimezone($timezone);
    return get_weekstartend($datetime->format('Y-m-d'));
}

if (!function_exists('ff_login_fields')) {
    add_filter('rwmb_profile_login_fields', 'ff_login_fields', 10, 1);

    function ff_login_fields($fields) {
        $fields = [
            'username' => [
                'name' => __('Username or Email Address', 'mb-user-profile'),
                'id' => 'user_login',
                'type' => 'text',
                'required' => true,
                'attributes' => [
                    'class' => 'form-control'
                ]
            ],
            'password' => [
                'name' => __('Password', 'mb-user-profile'),
                'id' => 'user_pass',
                'type' => 'password',
                'required' => true,
                'attributes' => [
                    'class' => 'form-control'
                ]
            ],
            'remember' => [
                'desc' => __('Remember Me', 'mb-user-profile'),
                'id' => 'remember',
                'type' => 'checkbox',
            ],
            'submit' => [
                'std' => __('Log In', 'mb-user-profile'),
                'id' => 'submit',
                'type' => 'button',
                'attributes' => [
                    'type' => 'submit',
                    'class' => 'btn btn-primary',
                    'name' => 'rwmb_profile_submit_login',
                    'value' => 1,
                ],
            ]
        ];

        return $fields;
    }

}

function ff_get_bill_duration($current_date = '') {
    $options = get_option('finance_foliage_settings');
    $bill_duration = !empty($options['bill_duration']) ? $options['bill_duration'] : 'weekly';
    $week_start_day = !empty($options['bill_week_start_day']) ? $options['bill_week_start_day'] - 1 : 4;
    if (!empty($current_date)) {
        $current_date = is_int($current_date) ? $current_date : strtotime($current_date);
    } else if (!empty($options['sync_date'])) {
        $current_date = $options['sync_date'];
    } else {
        $current_date = strtotime("now");
    }


    $response = array(
        'bill_type' => $bill_duration,
        'bill_date' => $current_date,
        'bill_date_str' => date("D jS, M Y", $current_date),
        'sync_date' => !empty($options['sync_date']) ? $options['sync_date'] : null,
        'last_sync_date' => !empty($options['last_sync_date']) ? $options['last_sync_date'] : null,
    );
    switch ($bill_duration) {
        case 'daily':
            return $response;
            break;
        case 'weekly':
            $week = ff_week_start_end(date("Y-m-d", $current_date));
            $response['week_start'] = $week['start'];
            $response['week_end'] = $week['end'];
            $response['week_label'] = date("D jS, M Y", $week['start']) . ' - ' . date("D jS, M Y", $week['end']);
            break;
        case 'monthly':
            $week = ff_week_start_end(date("Y-m-d", $current_date));
            $response['month_start'] = strtotime(date("Y-m-01", $current_date));
            $response['month_end'] = strtotime(date("Y-m-t", $current_date));
            $response['month_label'] = date("D jS, M Y", $response['month_start']) . ' - ' . date("D jS, M Y", $response['month_end']);
            break;
    }

    return $response;
}

function ff_get_chield_agents($root, $response = array()) {
    global $wpdb;
    $table_name = $wpdb->prefix . 'alliance';
    $response[$root->ID] = $root;
    if (!empty($root->left_node)) {
        $left_node = $wpdb->get_row('SELECT * FROM ' . $table_name . ' WHERE aid="' . $root->left_node . '"');
        $response = ff_get_chield_agents($left_node, $response);
    }
    if (!empty($root->right_node)) {
        $right_node = $wpdb->get_row('SELECT * FROM ' . $table_name . ' WHERE aid="' . $root->right_node . '"');
        $response = ff_get_chield_agents($right_node, $response);
    }
    return $response;
}

function get_sync_progress() {
    global $wpdb;
    $table_name = $wpdb->prefix . 'alliance';
    $status = $wpdb->get_results("SELECT count(ID) as sync_count,update_status FROM " . $table_name . " WHERE parent_node !='0'  GROUP BY update_status");
    $sync_count = 0;
   
    $none_sync_status = 0;
    foreach ($status as $count) {
        if ($count->update_status === '1') {
            $sync_count = $count->sync_count;
        }
        if ($count->update_status === '0') {
            $none_sync_status = $count->sync_count;
        }
    }
    $persent = (($sync_count + $none_sync_status) > 0) ? (($sync_count * 100) / ($sync_count + $none_sync_status)) : 0;
    return ceil($persent);
}
