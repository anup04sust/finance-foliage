<?php
$agent_id = esc_attr(@$_GET['node']);
$foliage_settings = get_option('finance_foliage_settings');
$agent_url = get_permalink($foliage_settings['agentnode_single_page_id']);

global $wpdb;
$table_alliance = $wpdb->prefix . 'alliance';
$applied_filter = array();
$bill_duration = ff_get_bill_duration();
if ($bill_duration['bill_type'] == 'weekly') {
    $bill_sdate = $bill_duration['week_start'];
    $bill_edate = $bill_duration['week_end'];
} else if ($bill_duration['bill_type'] == 'monthly') {
    $bill_sdate = $bill_duration['month_start'];
    $bill_edate = $bill_duration['month_start'];
} else {
    $bill_sdate = $bill_duration['bill_date'];
    $bill_edate = $bill_duration['bill_date'];
}

$font_agents = $wpdb->get_results('SELECT * FROM ' . $table_alliance . ' WHERE parent_node IS NULL OR parent_node = \'0\' ORDER BY ID ASC');

if (!empty($_GET['finance-filter']) && ($_GET['front-agent'] != 'all' || $_GET['date-range'] != '' || $_GET['agent-id'] != '')) {

    if (!empty($_GET['front-agent']) && $_GET['front-agent'] != 'all') {
        $font_agent = $wpdb->get_row('SELECT * FROM ' . $table_alliance . ' WHERE aid="' . esc_sql($_GET['front-agent']) . '"');
        $agents = ff_get_chield_agents($font_agent);

        $applied_filter['front-agent'] = $font_agent->user_name;
    } else if (!empty($_GET['agent-id'])) {
        $agents = $wpdb->get_results('SELECT * FROM ' . $table_alliance . ' WHERE aid="' . esc_sql($_GET['agent-id']) . '"');
        $applied_filter['agent-id'] = $_GET['agent-id'];
    } else {
        $agents = $wpdb->get_results('SELECT * FROM ' . $table_alliance . ' left_node_count > 0 AND right_node_count > 0 ORDER BY ID ASC');
    }
} else {

    $agents = $wpdb->get_results('SELECT * FROM ' . $table_alliance . ' WHERE left_node_count > 0 AND right_node_count > 0 ORDER BY ID ASC');
}
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-danger">
            <form method="get" id="fincance-filter-form">
                <div class="card-body">
                    <div class="row">
                        <div class="col-2">
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
                        <div class="col-2">
                            <select name="level" class="form-control">
                                <option value="all">All Level</option>
                                <?php
                                if (!empty($foliage_settings['finance_foliage_levels'])):
                                    foreach ($foliage_settings['finance_foliage_levels'] as $al) {
                                        $selected = (!empty($_GET['level']) && $_GET['level'] == $al['level']) ? 'selected' : '';
                                        echo sprintf('<option %3$s value="%2$s">%1$s</option>', 'LEVEL ' . $al['level'], $al['level'], $selected);
                                    }
                                endif;
                                ?>
                            </select>
                        </div>
                        <div class="col-2">
                            <input name="agent-id" value="<?php echo @$_GET['agent-id'] ?>" class="form-control" placeholder="agent id"/>
                        </div>

                        <div class="col-2 d-none">

                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                                </div>
                                <input data-sdate="<?php echo date('Y/m/d', $bill_sdate); ?>" data-edate="<?php echo date('Y/m/d', $bill_edate); ?>" type="text" class="form-control float-right" id="date-range" name="date-range">
                            </div>
                        </div>
                        <div class="col-2">
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
    <?php if (!empty($applied_filter)): ?>
        <div class="col-sm-12">
            <div class="info-box  bg-info">

                <span class="info-box-icon"><i class="fas fa-filter"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Filter used:</span>
                    <?php foreach ($applied_filter as $key => $filter): ?>
                        <span class="info-box-number">
                            <?php echo strtoupper(str_replace('-', ' ', $key)) ?> : <?php echo $filter; ?>
                        </span>
                    <?php endforeach; ?>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    <?php endif; ?>
    <div class="col-sm-12">
        <form action="#" method="post" id="finance-dispatch">

            <div class="card card-info">
                <div class="card-body">
                    <div class="navbar navbar-expand navbar-info navbar-dark mb-2">
                        <img class="spin-img d-none" src="<?php echo get_admin_url() ?>images/wpspin_light.gif" />

                        <div class="navbar-nav ml-auto">
                            <div class="input-group date mr-4" id="payment_created_at" data-target-input="nearest" style="width:350px">
                                <input required type="text" name="created_at" class="form-control datetimepicker-input" data-target="#created_at" id="created_at" value="<?php echo date('Y-m-d') ?>"/>
                                <div class="input-group-append" data-target="#created_at" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                            <select name="payment-type" class="form-control">
                                <option value="0">Select Payment Type</option>
                                <option value="Cheque">Cheque</option>
                                <option value="Cash">Cash</option>
                            </select>
                            <button class="btn btn-warning  submit-finance-dispatch ml-4" type="submit">Dispatch</button>
                        </div>
                    </div>
                    <table id="fincance-payment-table" class="table table-bordered table-striped">
                        <thead>

                            <tr>
                                <th style="width: 10px"><input data-terget="dispatch-aid" type="checkbox" value="select-all" name="select-all" id="select-all" />
                                </th>
                                <th style="width: 10px">#</th>
                                <th style="width: 20px">CID</th>
                                <th style="width: 20px">BC</th>

                                <th style="width: 200px">Name</th>
                                <th style="width: 15px">Left</th>
                                <th style="width: 15px">Right</th>
                                <th style="width: 30px">Level</th>
                                <th style="width: 30px">Amount</th>
                                <th style="width: 30px">Total</th>
                                <th style="width: 40px">Registered</th>
                                <th style="width: 40px">Cheque/Cash</th>

                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if (!empty($agents)):
                                $index = 1;
                                foreach ($agents as $agent) {
                                    $level = ff_get_agaent_level($agent);

                                    $level_amount = array();
                                    $level_amount_total = 0;

                                    if (!empty($_GET['level']) && $_GET['level'] != 'all' && $level['level'] !== $_GET['level']) {
                                        continue;
                                    }
                                    if ($level['level'] === 0) {
                                        continue;
                                    }
                                    $flevel = ff_financial_level($agent);
                                    if (!empty($flevel)) {
                                        foreach ($flevel as $l) {
                                            $level_amount[] = $l['amount'];
                                            $level_amount_total += $l['amount'];
                                        }
                                    }


                                    $html = '<tr class="data-row data-dispactch" data-aid="' . $agent->aid . '" >';
                                    $html .= '<td for="checkme-' . $agent->aid . '"><div class="form-check"><input class="form-check-input dispatch-aid" type="checkbox" value="' . $agent->aid . '" name="dispatch[' . $index . ']" id="checkme-' . $agent->aid . '" /></div></td>';
                                    $html .= '<td>' . $index . '</td>';
                                    $html .= '<td>' . $agent->aid . '</td>';
                                    $html .= '<td>' . $agent->business_center . '</td>';
                                    $html .= '<td>' . $agent->user_name . '</td>';
                                    $html .= '<td>' . $agent->left_node_count . '/' . $agent->all_node_count_left . '</td>';
                                    $html .= '<td>' . $agent->right_node_count . '/' . $agent->all_node_count_right . '</td>';
                                    $html .= '<td>' . $level['level'] . '</td>';
                                    $html .= '<td>' . implode(', ', $level_amount) . '</td>';
                                    $html .= '<td>' . $level_amount_total . '</td>';
                                    $html .= '<td>' . date("d/m/Y", $agent->created_at) . '</td>';
                                    $html .= '<td class="ptype">&nbsp;</td>';

                                    $html .= '</tr>';
                                    $index++;
                                    echo $html;
                                }
                            endif;
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php wp_nonce_field('addnew_agent'); ?>
            <input type="hidden" name="action" value="finance_dispatch" />

        </form>
    </div>

</div>

