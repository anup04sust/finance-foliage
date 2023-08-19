<?php
$foliage_settings = get_option('finance_foliage_settings');
$agentnode_url = get_permalink($foliage_settings['agentnode_single_page_id']);
$finance_report_url = get_permalink($foliage_settings['finance_report_page_id']);
$agentnode_edit_url = get_permalink($foliage_settings['agentnode_addnew_page_id']);
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card card-info">
            <div class="card-header">


                <div class="card-tools">
                    <a href="#"  class="btn btn-tool" >
                        <i class="fas fa-user-plus mr-2"></i> Add new agent
                    </a>
                    |
                    <a href="#"  class="btn btn-tool" >
                        <i class="fas fa-file-upload mr-2 ml-2" ></i> Import From File
                    </a>
                </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="width: 20px">Agent ID</th>

                            <th style="width: 200px">Name</th>
                            <th style="width: 15px">Left</th>
                            <th style="width: 15px">Right</th>
                            <th style="width: 30px">Updated</th>
                            <th style="width: 30px">Registered</th>
                            <th style="width: 40px">-</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        global $wpdb;
                        $table_name = $wpdb->prefix . 'alliance';
                        $agents = $wpdb->get_results('SELECT * FROM ' . $table_name . ' ORDER BY ID ASC');

                        if (!empty($agents)):

                            foreach ($agents as $agent):
                                ?>
                        <tr>
                                    <td><?php echo $agent->aid; ?></td>

                                            <td><?php echo $agent->user_name; ?></td>
                                            <td><?php echo $agent->left_node_count; ?></td>
                                            <td><?php echo $agent->right_node_count; ?></td>
                                            <td><?php echo date("D jS, M Y", $agent->created_at); ?></td>
                                            <td><?php echo date("D jS, M Y H:i:s", strtotime($agent->updated)); ?></td>

                                            <td>
                                                        <a href="<?php echo $agentnode_edit_url . '?view=edit&node=' . $agent->ID; ?>" class="btn btn-sm" title="Edit">
                                                            <i class="fas fa-edit"></i>
                                                </a>
                                                        <a href="<?php echo $agentnode_url . '?view=tree&node=' . $agent->ID; ?>" class="btn btn-sm" title="Tree View">
                                                            <i class="fas fa-project-diagram"></i>
                                                </a>
                                                        <a href="<?php echo $agentnode_url . '?view=info&node=' . $agent->ID; ?>" class="btn btn-sm" title="Ino">
                                                            <i class="fas fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php
                                    endforeach;
                                endif;
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>CID</th>
                            <th>Name</th>
                            <th>Left</th>
                            <th>Right</th>
                            <th>Registered</th>
                            <th>Updated</th>

                            <th>-</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>