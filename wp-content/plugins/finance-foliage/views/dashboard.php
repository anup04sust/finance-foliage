<?php
global $wpdb;
$table_name = $wpdb->prefix . 'alliance';
$settings = get_option('finance_foliage_settings');
$week = ff_week_start_end();
$prev_week = ff_week_start_end(date('Y-m-d', strtotime("-6 days")));
$front_agents = $wpdb->get_results('SELECT user_name,aid,user_id FROM ' . $table_name . ' WHERE parent_node IS NULL OR parent_node=\'0\' ORDER BY ID ASC');
$agents = $wpdb->get_results('SELECT * FROM ' . $table_name);
$agents_count_cweek = $wpdb->get_results('SELECT COUNT(user_id) as total_agent,created_at FROM ' . $table_name . ' WHERE created_at >=' . $week['start'] . ' AND created_at <=' . $week['end'] . ' GROUP BY created_at');
$agents_count_pweek = $wpdb->get_results('SELECT COUNT(user_id) as total_agent,created_at FROM ' . $table_name . ' WHERE created_at >=' . $prev_week['start'] . ' AND created_at <=' . $prev_week['end'] . ' GROUP BY created_at');

$donutData = array(
    'labels' => array(
        'LVL 0',
        'LVL 1',
        'LVL 2',
        'LVL 3',
        'LVL 4',
        'LVL 5',
    ),
    'datasets' => array(
        'data' => array(0, 0, 0, 0, 0, 0),
        'backgroundColor' => array('#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de')
    )
);
//donutData data
if (!empty($agents)) {
    foreach ($agents as $agent) {
        $node_level = ff_get_agaent_level($agent);
        $donutData['datasets']['data'][$node_level['level']] += 1;
    }
    
}
//Barchrt data
$weekDayRegeistered = array();
for ($i = 0; $i < 7; $i++) {
    $cs_date = strtotime('+' . $i . ' day', $week['start']);
    $ps_date = strtotime('+' . $i . ' day', $prev_week['start']);
    $weekDayRegeistered['current_week'][$cs_date] = 0;
    $weekDayRegeistered['prev_week'][$ps_date] = 0;
    if (!empty($agents_count_cweek)) {
        foreach ($agents_count_cweek as $day) {
            if ($day->created_at == $cs_date) {
                $weekDayRegeistered['current_week'][$cs_date] = $day->total_agent;
            }
        }
    }
    if (!empty($agents_count_pweek)) {
        foreach ($agents_count_pweek as $day) {
            if ($day->created_at == $ps_date) {
                $weekDayRegeistered['prev_week'][$ps_date] = $day->total_agent;
            }
        }
    }
}
$weekDayRegeistered['current_week'] = array_values($weekDayRegeistered['current_week']);
$weekDayRegeistered['prev_week'] = array_values($weekDayRegeistered['prev_week']);
$total_reg_count_cw = 0;
if (!empty($agents_count_cweek)) {
    foreach ($agents_count_cweek as $day) {
        $total_reg_count_cw += $day->total_agent;
    }
}
?>
<div class="row">
    <div class="col-lg-4 col-6">
        <!-- small card -->
        <div class="small-box bg-info">
            <div class="inner">
                <h3><?php echo!empty($front_agents) ? count($front_agents) : 0; ?></h3>

                <p>Front Line Agents </p>
            </div>
            <div class="icon">
                <i class="fas fa-users"></i>
            </div>
            <a href="<?php echo get_permalink($settings['agentnode_single_page_id']); ?>?view=tree&node=0" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>

    <!-- ./col -->
    <div class="col-lg-4 col-6">
        <!-- small card -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3><?php echo!empty($agents) ? count($agents) : 0; ?></h3>

                <p>Agents Registered</p>
            </div>
            <div class="icon">
                <i class="fas fa-user-plus"></i>
            </div>
            <a href="<?php echo get_permalink($settings['agentnodes_page_id']); ?>" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-4 col-6">
        <!-- small card -->
        <div class="small-box bg-danger">
            <div class="inner">
                <h3><?php echo $total_reg_count_cw; ?></h3>
                <p>Registered in this week</p>

            </div>
            <div class="icon">
                <i class="fas fa-project-diagram"></i>
            </div>
            <a href="<?php echo get_permalink($settings['finance_report_page_id']); ?>" class="small-box-footer">
                More info <i class="fas fa-arrow-circle-right"></i>
            </a>
        </div>
    </div>
    <!-- ./col -->
</div>
<div class="row">
    <div class="col-6">
        <div class="card card-danger">
            <div class="card-header">
                <h3 class="card-title">Level gain by week</h3>
            </div>

            <div class="card-body">
                <script>
                    var donutData = <?php echo json_encode($donutData); ?>;
                </script>
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
            </div>
        </div>
        <!-- /.card-body -->

    </div>
    <div class="col-6">
        <!-- BAR CHART -->
        <div class="card card-success">
            <div class="card-header">
                <h3 class="card-title">Registration by Week</h3>

            </div>
            <script>
                var weekDayRegeistered = <?php echo json_encode($weekDayRegeistered); ?>;
            </script>
            <div class="card-body">
                <div class="chart">
                    <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
    </div>

</div>