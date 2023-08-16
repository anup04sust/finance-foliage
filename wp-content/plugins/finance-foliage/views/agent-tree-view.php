<?php
$agent_id = esc_attr($_GET['node']);
if (!empty($agent_id)):
    global $wpdb;
    ?>
    <div class="row">
        <div class="col-sm-12">
            Hello
        </div>
    </div>
    <?php
else:
    global $wpdb;
    $table_name = $wpdb->prefix . 'alliance';
    $front_agents = $wpdb->get_results('SELECT * FROM ' . $table_name . ' WHERE parent_node IS NULL OR parent_node=0 ORDER BY ID ASC');
    //pprint($front_agents);
    ?>
    <div class="row d-flex justify-content-center">
        <?php
        if (!empty($front_agents)):
            foreach ($front_agents as $agent):
                ?>
                <div class="col-md-6">
                    <!-- Widget: user widget style 1 -->
                    <div class="card card-widget widget-user">
                        <!-- Add the bg color to the header using any of the bg-* classes -->
                        <div class="widget-user-header bg-info">
                            <h3 class="widget-user-username"><?php echo $agent->user_name; ?></h3>
                            <h5 class="widget-user-desc"><?php echo $agent->aid; ?></h5>
                        </div>
                        <div class="widget-user-image">
                            <img class="img-circle elevation-2" src="<?php echo FINANCE_FOLIGE_DIR_URL.'assets/images/user-128x128.png'?>" alt="User Avatar">
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
                            <div class="d-flex justify-content-between pt-0">
                            <a href="" class="btn btn-sm btn-outline-secondary">Tree View</a>
                            <a href="" class="btn btn-sm btn-outline-info">Info View</a>
                        </div>
                        </div>
                        
                        <div class="ribbon-wrapper ribbon-lg">
                        <div class="ribbon bg-info">
                          Level <?php ff_get_agaent_level($agent); ?>
                        </div>
                      </div> 
                    </div>
                    <!-- /.widget-user -->
                </div>
                <?php
            endforeach;
        endif;
        ?>
    </div>
    <?php endif; ?>
