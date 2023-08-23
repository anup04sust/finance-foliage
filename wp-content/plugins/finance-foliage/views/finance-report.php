<?php
$agent_id = esc_attr(@$_GET['node']);
$foliage_settings = get_option('finance_foliage_settings');
$agent_url = get_permalink($foliage_settings['agentnode_single_page_id']);

global $wpdb;
$table_name = $wpdb->prefix . 'alliance';

$agents = $wpdb->get_results('SELECT * FROM ' . $table_name . ' ORDER BY ID ASC');
$font_agents = $wpdb->get_results('SELECT * FROM ' . $table_name . ' WHERE parent_node IS NULL OR parent_node =0 ORDER BY ID ASC');

?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-danger">
            <form method="get">
                <div class="card-body">
                    <div class="row">
                        <div class="col-3">
                            <select name="front-agent" class="form-control">
                                <option value="all">All Front Agent</option>
                                <?php
                                if (!empty($font_agents)):
                                    foreach ($font_agents as $fa) {
                                        $selected = (!empty($_GET['front-agent']) && $_GET['front-agent'] == $fa->aid) ? 'selected' : '';
                                        echo sprintf('<option %3$s value="%2$s">%1$s</option>', $fa->user_name, $fa->aid, $selected);
                                    }
                                endif;
                                ?>
                            </select>
                        </div>
                        <div class="col-3">
                            <select name="level" class="form-control">
                                <option value="all">All Level</option>
                                <?php
                                if (!empty($foliage_settings['finance_foliage_levels'])):
                                    foreach ($foliage_settings['finance_foliage_levels'] as $al) {
                                        $selected = (!empty($_GET['level']) && $_GET['level'] == $al['level']) ? 'selected' : '';
                                        echo sprintf('<option %3$s value="%2$s">%1$s</option>','LEVEL'. $al['level'], $al['level'], $selected);
                                    }
                                endif;
                                ?>
                            </select>
                        </div>
                        <div class="col-3">
                            <input name="date-range" value="" class="form-control"/>
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-info">Apply Filter</button>
                            <input type="reset" class="btn btn-secondary" />
                            <input type="hidden" name="finance-filter" value="on"/>
                        </div>
                    </div>
                </div>
                <?php wp_nonce_field('finance-filter'); ?>
            </form>
            <!-- /.card-body -->
        </div>
    </div>
    <div class="col-sm-12">
        <div class="card card-info">
            <div class="card-body">
                <table id="fincance-report-table" class="table table-bordered table-striped">
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

