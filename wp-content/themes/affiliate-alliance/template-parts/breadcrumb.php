<?php
$settings = get_option('finance_foliage_settings');
?>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1><?php echo get_the_title() ?></h1>
            </div>
            <?php if(!is_front_page()): ?>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="<?php echo get_permalink($settings['dashboard_page_id']); ?>">Dashboard</a></li>
                    <?php if (is_page($settings['agentnode_addnew_page_id'])): ?>
                        <li class="breadcrumb-item"><a href="<?php echo get_permalink($settings['agentnodes_page_id']); ?>">Agents</a></li>
                    <?php endif ?>
                    <li class="breadcrumb-item active"><?php echo get_the_title() ?></li>
                </ol>
            </div>
            <?php endif;?>
        </div>
    </div><!-- /.container-fluid -->
</section>