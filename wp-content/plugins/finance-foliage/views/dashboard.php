<?php
global $wpdb;
$table_alliance = $wpdb->prefix . 'alliance';
$table_finance = $wpdb->prefix . 'finance';
$settings = get_option('finance_foliage_settings');
$week = ff_week_start_end();
$prev_week = ff_week_start_end(date('Y-m-d', strtotime("-6 days")));
$front_agents = $wpdb->get_results('SELECT user_name,aid,user_id FROM ' . $table_alliance . ' WHERE parent_node IS NULL OR parent_node=\'0\' ORDER BY ID ASC');
$agents = $wpdb->get_results('SELECT * FROM ' . $table_alliance);
$agents_count_byweek = $wpdb->get_row('SELECT COUNT(user_id) as total_agent FROM ' . $table_alliance . ' WHERE created_at >=' . $week['start'] . ' AND created_at <=' . $week['end'] . '');
$agents_circle = $wpdb->get_results('SELECT *  FROM ' . $table_alliance . ' WHERE active_circle !=0 ORDER BY active_circle DESC');
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
                <h3><?php echo ($agents_count_byweek) ? $agents_count_byweek->total_agent : 0; ?></h3>
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
    <div class="col-sm-12">
        <!-- STACKED BAR CHART -->
        <div class="card card-success">
            <div class="card-header">
                <h3 class="card-title">Agents by Circle completed</h3>


            </div>
            <div class="card-body">
                <div class="small-box bg-info">

                    <div class="inner">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>CID</th>
                                    <th>Name</th>
                                    <th>Circle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                foreach ($agents_circle as $ag) {
                                    echo sprintf('<tr><td>%1$s</td><td>%2$s</td><td>%3$s</td></tr>', $ag->aid, $ag->user_name, $ag->active_circle);
                                }
                                ?>
                            </tbody>
                        </table>

                    </div>
                    <div class="icon">
                        <i class="fas fa-circle"></i>
                    </div>

                </div>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>
<script>

</script>