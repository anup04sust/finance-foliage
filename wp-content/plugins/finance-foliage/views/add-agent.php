<?php
$param_import = !empty($_GET['import']) ? esc_attr($_GET['import']) : null;
$param_referral = !empty($_GET['referral']) ? esc_attr($_GET['referral']) : null;
$param_wing = !empty($_GET['wing']) ? esc_attr($_GET['wing']) : null;
$param_redirect = !empty($_GET['redirect']) ? esc_attr($_GET['redirect']) : null;
$param_nodeid = !empty($_GET['redirect']) ? esc_attr($_GET['node']) : null;
$foliage_settings = get_option('finance_foliage_settings');
?>
<div class="row d-flex justify-content-center">
    <div class="col-sm-12 col-md-12 col-lg-8">
        <?php if (empty($_GET['import']) || $_GET['import'] != 'csv'): ?>
            <!-- Horizontal Form -->
            <form class="form-horizontal" method="post" id="form-add-new-agent">
                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Agent Registration Form</h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->

                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-sm-12">
                                <div id="form-message" class="callout" style="display: none"></div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="sl-no" class="col-sm-2 col-form-label">Date:</label>
                            <div class="col-sm-10">
                                <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                    <input required type="text" name="created_at" class="form-control datetimepicker-input" data-target="#created_at" id="created_at" value="<?php echo date('Y-m-d') ?>"/>
                                    <div class="input-group-append" data-target="#created_at" data-toggle="datetimepicker">
                                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="sl-no" class="col-sm-2 col-form-label">SL No:</label>
                            <div class="col-sm-10">
                                <input type="text" name="slno" class="form-control" id="agent-sl" placeholder="80305" tabindex="1" required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="agent-name" class="col-sm-2 col-form-label">Agent Name:</label>
                            <div class="col-sm-10">
                                <input type="text" name="aname" class="form-control" id="agent-name" placeholder="Full Name" tabindex="2" required>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Referral ID:</label>
                            <div class="col-sm-10">
                                <select name="referral" class="form-control select2bs4" id="agent-referral" tabindex="1">
                                    <option value="0">Select Referral</option>
                                    <?php
                                    $user_options = ff_get_referral_agents();
                                    foreach ($user_options as $value => $name) {

                                        $selected = (!empty($param_referral) && $value == $param_referral) ? 'selected' : '';
                                        echo sprintf('<option %3$s value="%1$s">%2$s</option>', $value, $name, $selected);
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Wings:</label>
                            <div class="col-sm-10 d-flex justify-content-between">
                                <?php if (!empty($param_wing)): ?>
                                    <div class="custom-control custom-radio">
                                        <input 
                                        <?php
                                        if ($param_wing === 'L') {
                                            echo 'checked';
                                        } else {
                                            echo 'disabled';
                                        }
                                        ?> class="custom-control-input" type="radio" id="ref-wings-left" name="ref-wings" checked value="L">
                                        <label for="ref-wings-left" class="custom-control-label">Left Side</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input  
                                        <?php
                                        if ($param_wing === 'R') {
                                            echo 'checked';
                                        } else {
                                            echo 'disabled';
                                        }
                                        ?> class="custom-control-input" type="radio" id="ref-wings-right" name="ref-wings" value="R">
                                        <label for="ref-wings-right" class="custom-control-label">Right Side</label>
                                    </div>
    <?php else: ?>
                                    <div class="custom-control custom-radio">
                                        <input checked class="custom-control-input" type="radio" id="ref-wings-left" name="ref-wings" checked value="L">
                                        <label for="ref-wings-left" class="custom-control-label">Left Side</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input class="custom-control-input" type="radio" id="ref-wings-right" name="ref-wings" value="R">
                                        <label for="ref-wings-right" class="custom-control-label">Right Side</label>
                                    </div>
    <?php endif ?>
                            </div>
                        </div>
                        <div id="frontline-wrap" class="form-group row" style="display: none">
                            <label class="col-sm-2 col-form-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" id="ref-frontline" name="frontline" value="1">
                                    <label for="ref-frontline" class="custom-control-label">Please check if Front Line(Root) agent</label>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer text-right">

                        <button id="form-add-new-agent-submit" type="submit" class="btn btn-info">Submit</button>
                    </div>
                    <!-- /.card-footer -->

                </div>
                <input type="hidden" name="action" value="addnew_agent" />
                <input type="hidden" name="redirect" value="<?php echo $param_redirect ? get_permalink($foliage_settings[$param_redirect . '_page_id']) . 'view=tree&node=' . $param_nodeid : ""; ?>" />
    <?php wp_nonce_field('addnew_agent'); ?>
            </form>
            <!-- /.card -->
<?php else : ?>
            <div class="col">
                <form class="form-horizontal" method="post" id="form-import-new-agent">
                    <div class="card card-info">
                        <div class="card-header">
                            <h3 class="card-title">Import agent from .csv file</h3>
                            <div class="card-tools">
                                <a href="" class="btn btn-block btn-secondary btn-xs"><i class="fa-solid fa-file-arrow-down mr-2"></i> Sample</a>
                            </div>
                        </div>
                        <div class="card-body">

                        </div>
                    </div>
                </form>
            </div>
<?php endif ?>
        <div class="col">

        </div>
    </div>
</div>