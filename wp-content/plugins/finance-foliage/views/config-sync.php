<?php
$settings = get_option('finance_foliage_settings');
$last_sync_date_time = !empty($settings['last_sync_date']) ? $settings['last_sync_date'] : null;
$active_sync_date = strtotime('now');
$bill = ff_get_bill_duration($active_sync_date);

$time_flug = ($bill['bill_type'] == 'daily')? 86400: (($bill['bill_type'] == 'weekly')? 604800 : 2629746);
//pprint($bill);
?>
<div class="row">
    
    <div class="col-sm-12">

        <div class="callout callout-danger">
            <h5><i class="fas fa-bullhorn"></i> Why synchronization is important?</h5>
            <p>When you register a new agent, system update his/her referral agents child agents count status base on current bill duration. 
                If you need to change bill duration then you need synchronize all linked agents status base on bill duration. </p>
            <p>Also from here you can generate historical financial report overview.</p>
        </div>

    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="info-box  bg-success">
            <span class="info-box-icon"><i class="far fa-calendar-alt"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Last synchronization</span>
                <span class="info-box-number"><?php echo $last_sync_date_time ? date("D jS, M Y H:i:s", $last_sync_date_time) : 'Not set!!'; ?> | <?php echo !empty($settings['sync_date']) ? date("D jS, M Y", $settings['sync_date']) : 'Not Set'; ?></span>
                               <?php if ($last_sync_date_time): ?>
                    <div class="progress">
                        <div class="progress-bar" style="width: <?php echo (($time_flug - (strtotime('now')-$last_sync_date_time))*100/$time_flug);?>%"></div>
                    </div>
                    <span class="progress-description">
                        <?php echo human_time_diff($last_sync_date_time)?> ago
                    </span>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div id="message-wrap" class="alert alert-danger"></div>
    </div>
     <div class="col-sm-12 col-md-6">
        <div class="card card-warning">
            <div class="card-header">
                <h3 class="card-title">Active synchronization</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form id="active-sync" class="agent-sync-form" method="post">
                <div class="card-body">
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Bill duration</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration" class="form-control" id="bill-duration" value="<?php echo @$settings['bill_duration']; ?>" readonly/>
                        </div>
                    </div>
                    <?php if(!empty($settings['bill_duration']) && $settings['bill_duration'] === 'weekly'):?>
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Week</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration_label" class="form-control" id="bill-duration" value="<?php echo @$bill['week_label']; ?>" readonly/>
                        </div>
                    </div>
                    <?php endif?>
                    <?php if(!empty($settings['bill_duration']) && $settings['bill_duration'] === 'monthly'):?>
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Month</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration_label" class="form-control" id="bill-duration" value="<?php echo @$bill['month_label']; ?>" readonly/>
                        </div>
                    </div>
                    <?php endif?>
                    <div class="form-group row">
                        <label for="sl-no" class="col-sm-2 col-form-label">Date:</label>
                        <div class="col-sm-10">
                            <div class="input-group date" id="sync-date">
                                <input required readonly type="text" name="sync_date" class="form-control" data-target="#sync-date" id="sync-date" value="<?php echo date('Y-m-d',$active_sync_date) ?>"/>
                                <div class="input-group-append">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="know-sync" required="">
                        <label class="form-check-label" for="know-sync">I know whats happend after synchronization agents status</label>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer text-right">
                     <img class="spin-img d-none" src="<?php echo get_admin_url() ?>/images/wpspin_light.gif" />
                    <button type="submit" class="btn btn-warning ml-1">Sync Now</button>
                   
                </div>
                 <?php wp_nonce_field('addnew_agent'); ?>
                <input type="hidden" name="action" value="sync_agents" />
                <input type="hidden" name="sync_status" value="active" />
            </form>
        </div>
    </div>
    <div class="col-sm-12 col-md-6">
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title">Customize synchronization</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form id="custom-sync" class="agent-sync-form" method="post">
                <div class="card-body">
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Bill duration</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration" class="form-control" id="bill-duration" value="<?php echo @$settings['bill_duration']; ?>" readonly/>
                        </div>
                    </div>
                    <?php if(!empty($settings['bill_duration']) && $settings['bill_duration'] === 'weekly'):?>
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Week</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration_label" class="form-control" id="bill-duration" value="<?php echo @$bill['week_label']; ?>" readonly/>
                        </div>
                    </div>
                    <?php endif?>
                    <?php if(!empty($settings['bill_duration']) && $settings['bill_duration'] === 'monthly'):?>
                    <div class="form-group row">
                        <label for="bill-duration" class="col-sm-2 col-form-label">Month</label>
                        <div class="col-sm-10">
                            <input type="text" name="bill_duration_label" class="form-control" id="bill-duration" value="<?php echo @$bill['month_label']; ?>" readonly/>
                        </div>
                    </div>
                    <?php endif?>
                    <div class="form-group row">
                        <label for="sl-no" class="col-sm-2 col-form-label">Date:</label>
                        <div class="col-sm-10">
                            <div class="input-group date" id="sync-date-wrap" data-target-input="nearest">
                                <input required type="text" name="sync_date" class="form-control datetimepicker-input" data-target="#sync-date-picker" id="sync-date-picker" value="<?php echo date('Y-m-d',$bill['bill_date']) ?>"/>
                                <div class="input-group-append" data-target="#sync-date-picker" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="know-sync-custom" required>
                        <label class="form-check-label" for="know-sync-custom">I know whats happend after synchronization agents status</label>
                    </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer text-right">
                     <img class="spin-img d-none" src="<?php echo get_admin_url() ?>/images/wpspin_light.gif" />
                    <button type="submit" class="btn btn-info ml-1">Sync Now</button>
                   
                </div>
                 <?php wp_nonce_field('addnew_agent'); ?>
                 <input type="hidden" name="action" value="sync_agents" />
                 <input type="hidden" name="sync_status" value="csustomize" />
            </form>
        </div>
    </div>
   
</div>