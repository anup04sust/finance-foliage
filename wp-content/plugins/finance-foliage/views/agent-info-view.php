<?php
$agent_id = esc_attr($_GET['node']);
$foliage_settings = get_option('finance_foliage_settings');
$agent_url = get_permalink($foliage_settings['agentnode_single_page_id']);
if (!empty($agent_id)):
    global $wpdb;
    $table_name = $wpdb->prefix . 'alliance';
    $agent = $wpdb->get_row('SELECT * FROM ' . $table_name . ' WHERE ID=' . $agent_id);
    ?>
    <div class="row">
        <?php
        if (!empty($agent)):
            ?>
            <div class="col-sm-12">
                <!-- Widget: user widget style 1 -->
                <div class="card card-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header bg-info">
                        <h3 class="widget-user-username"><?php echo $agent->user_name; ?></h3>
                        <h5 class="widget-user-desc"><?php echo $agent->aid; ?></h5>
                    </div>
                    <div class="widget-user-image">
                        <img class="img-circle elevation-2" src="<?php echo FINANCE_FOLIGE_DIR_URL . 'assets/images/user-128x128.png' ?>" alt="User Avatar">
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header"><?php echo $agent->left_node_count; ?></h5>
                                    <span class="description-text">Left Nodes</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header"><?php echo date("D jS, M Y H:i:s", strtotime($agent->updated)); ?></h5>
                                    <span class="description-text">Last Update</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header"><?php echo $agent->right_node_count; ?></h5>
                                    <span class="description-text">Right Nodes</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->

                    </div>
                    <?php $level = ff_get_agaent_level($agent); ?>
                    <div class="ribbon-wrapper ribbon-lg">
                        <div class="ribbon bg-info">
                            Level <?php echo @$level['level']; ?>
                        </div>
                    </div> 
                </div>
                <!-- /.widget-user -->
            </div>
            <?php
            $child_nodes = ff_generate_tree_array($agent->aid);
            ?>
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
                                echo ff_get_treetable($child_nodes);
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <?php
             
        endif;
        ?>
    </div>
<?php endif;

// Example usage
$customStartDate = '2023-08-03'; // Replace this with your desired start date
$numWeeks = 10; // Replace this with the number of weeks you want to generate

$weekList = ff_generateWeekList();
pprint($weekList);