<?php
$agent_id = esc_attr(@$_GET['node']);
$foliage_settings = get_option('finance_foliage_settings');
$agent_url = get_permalink($foliage_settings['agentnode_single_page_id']);

global $wpdb;
$table_name = $wpdb->prefix . 'alliance';

$agents = $wpdb->get_results('SELECT * FROM ' . $table_name . ' ORDER BY ID ASC');

?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-info">
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 20px">Agent ID</th>

                            <th style="width: 200px">Name</th>
                            <th style="width: 15px">Left</th>
                            <th style="width: 15px">Right</th>
                            <th style="width: 30px">Level</th>
                            <th style="width: 30px">Amount</th>
                            <th style="width: 40px">Registered</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (!empty($agents)):

                            foreach ($agents as $agent) {
                                $level = ff_get_agaent_level($agent);
                                $html = '<tr>';
                                $html .= '<td>' . $agent->aid . '</td>';
                                $html .= '<td>' . $agent->user_name . '</td>';
                                $html .= '<td>' . $agent->left_node_count . '</td>';
                                $html .= '<td>' . $agent->right_node_count . '</td>';
                                $html .= '<td>' . $level['level'] . '</td>';
                                $html .= '<td>' . $level['amount'] . '</td>';
                                $html .= '<td>' . date("D jS, M Y", $agent->created_at) . '</td>';

                                $html .= '</tr>';
                                echo $html;
                            }
                        endif;
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

