<?php
$agent_id = esc_attr($_GET['node']);
$foliage_settings = get_option('finance_foliage_settings');
$agent_url = get_permalink($foliage_settings['agentnode_single_page_id']);

if (!empty($agent_id)):
    global $wpdb;
    ?>
    <div class="row">
        <div class="col-sm-12">
            <div class="small-box bg-info">
                <div class="inner">
                    <div class="ff-tree-wrap  d-flex justify-content-center">
                        <ul>
                            <?php echo ff_get_agents_tree($agent_id); ?>
                        </ul>
                    </div>

                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">
                        Load More <i class="fas fa-arrow-circle-right"></i>
                    </a>
                </div>
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
                                <div class="d-flex justify-content-between pt-0">
                                    <a href="<?php echo $agent_url . '?view=tree&node=' . $agent->ID ?>" class="btn btn-sm btn-outline-secondary"> <i class="fas fa-project-diagram mr-2"></i>View tree</a>
                                    <a href="<?php echo $agent_url . '?view=info&node=' . $agent->ID ?>" class="btn btn-sm btn-outline-info"><i class="fas fa-info mr-2"></i> View info</a>
                                </div>
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
                endforeach;
            endif;
            ?>
        </div>
    <?php endif; ?>

<div  class="modal fade" id="modal-node-details">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class="modal-body">
                <div class="card card-widget widget-user">
                    <!-- Add the bg color to the header using any of the bg-* classes -->
                    <div class="widget-user-header bg-warning">
                        <h3 class="widget-user-username n-name">------</h3>
                        <h5 class="widget-user-desc n-aid">......</h5>
                    </div>
                    <div class="widget-user-image">
                        <img class="img-circle elevation-2" src="<?php echo FINANCE_FOLIGE_DIR_URL . 'assets/images/user-128x128.png' ?>" alt="User Avatar">
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header ln-count">0</h5>
                                    <span class="description-text">Left Nodes</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header date-registered">------------</h5>
                                    <span class="description-text">Registered</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header rn-count">0</h5>
                                    <span class="description-text">Right Nodes</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                        </div>

                    </div>
                    <div class="ribbon-wrapper ribbon-lg">
                        <div class="ribbon bg-warning">
                            Level <span class="level-number">0</span></div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
