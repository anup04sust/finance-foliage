<?php

/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */

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

    $referral_nodes = $wpdb->get_results('SELECT aid,user_name FROM ' . $wpdb->prefix . 'alliance' . ' WHERE left_node IS NULL OR  right_node IS NULL ORDER BY user_name ASC');
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

    $finance_foliage_options = array(
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

    $response = array('level' => 0, 'amount' => 0);
    if (!empty($agent_info->left_node_count) && !empty($agent_info->right_node_count)) {
        foreach ($finance_foliage_options as $settings) {

            if ($agent_info->left_node_count >= $settings['left_node'] && $agent_info->right_node_count >= $settings['right_node']) {

                $response = array(
                    'level' => $settings['level'],
                    'amount' => $response['amount'] + $settings['amount']
                );
            }
        }
    }

    return $response;
}

function ff_get_agents_tree($agent_root) {
    global $wpdb;
    $nodes = $wpdb->get_row('SELECT aid FROM ' . $wpdb->prefix . 'alliance' . ' WHERE ID=' . $agent_root);
    $agents_tree_array = ff_generate_tree_array($nodes->aid);
    $tree_html = ff_generateHtmlTree($agents_tree_array);

    return $tree_html;
}

function ff_generate_tree_array($agent_root) {

    if (empty($agent_root)) {
        return [];
    }
    global $wpdb;
    $nodes = $wpdb->get_row('SELECT * FROM ' . $wpdb->prefix . 'alliance' . ' WHERE aid=' . $agent_root);

    $leftArray = ff_generate_tree_array($nodes->left_node);
    $rightArray = ff_generate_tree_array($nodes->right_node);
    return [
        'node_aid' => $nodes->aid,
        'node_id' => $nodes->ID,
        'node' => $nodes->user_name,
        'left_node_count' => $nodes->left_node_count,
        'right_node_count' => $nodes->right_node_count,
        'left' => $leftArray,
        'right' => $rightArray,
        'created_at' => $nodes->created_at,
        'created_str' => date("D jS, M Y", $nodes->created_at),
        'level' => ff_get_agaent_level($nodes)
    ];
}

function ff_generateHtmlTree($nodes) {

    $html = '';

    if (!empty($nodes)) {
        $week = ff_week_start_end();
        $modal_data = array(
            'node_aid' => $nodes['node_aid'],
            'node_id' => $nodes['node_id'],
            'node' => $nodes['node'],
            'left_node_count' => $nodes['left_node_count'],
            'right_node_count' => $nodes['right_node_count'],
            'created_str' => $nodes['created_str'],
            'level' => $nodes['level']
        );
        $node_status_class = ($nodes['created_at'] >= $week['start'] && $nodes['created_at'] <= $week['end']) ? 'active-node' : 'disabled-node';
        $html .= '<li><a class="node-link ' . $node_status_class . '" data-all="' . base64_encode(json_encode($modal_data)) . '" data-aid="' . $nodes['node_aid'] . '" data-id="' . $nodes['node_id'] . '" href="#" title="' . $nodes['node'] . '"><img class="img-circle elevation-2" src="' . FINANCE_FOLIGE_DIR_URL . 'assets/images/user-64x64.png" alt="User Avatar"><span>' . $nodes['node_aid'] . '</span></a>';

        if (!empty($nodes['left']) || !empty($nodes['right'])) {
            $html .= '<ul>';
            $html .= !empty($nodes['left']) ? ff_generateHtmlTree($nodes['left']) : ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'L');
            $html .= !empty($nodes['right']) ? ff_generateHtmlTree($nodes['right']) : ff_add_empty_tree_node($nodes['node_aid'], $nodes['node_id'], 'R');
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

function ff_add_empty_tree_node($ref, $node, $pos,) {
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

/*
 Array
(
    [dashboard_page_id] => 55
    [settings_page_id] => 56
    [agentnodes_page_id] => 57
    [finance_report_page_id] => 58
    [login_page_id] => 40
    [finance_report_print_page_id] => 45
    [user_account_page_id] => 54
    [agentnode_addnew_page_id] => 59
    [agentnode_single_page_id] => 60
)
 */