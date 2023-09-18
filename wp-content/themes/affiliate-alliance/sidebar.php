<?php
$current_user = wp_get_current_user();
$settings = get_option('finance_foliage_settings');
?>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-lightblue elevation-4">   
    <?php get_template_part('template-parts/brand-logo'); ?>
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="<?php echo get_stylesheet_directory_uri() . '/assets/images/avata.png' ?>" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="<?php echo get_home_url(); ?>" class="d-block"><?php echo esc_html($current_user->display_name); ?> </a>
            </div>
        </div>

        <!-- SidebarSearch Form -->
        <div class="form-inline">
            <div class="input-group" data-widget="sidebar-search">
                <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-sidebar">
                        <i class="fas fa-search fa-fw"></i>
                    </button>
                </div>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['dashboard_page_id']); ?>" class="nav-link <?php if (is_page($settings['dashboard_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-tachometer-alt mr-1"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['agentnodes_page_id']); ?>" class="nav-link 
                       <?php if (is_page($settings['agentnodes_page_id']) | is_page($settings['agentnode_addnew_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-users mr-1"></i>
                        <p>
                            Agents
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href=<?php echo get_permalink($settings['agentnodes_page_id']); ?>" class="nav-link">
                                <i class="fas fa-list mr-2"></i>
                                <p>All Agents</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href=<?php echo get_permalink($settings['agentnode_addnew_page_id']); ?>" class="nav-link">
                                <i class="far fa-plus-square mr-2"></i>
                                <p>Add New</p>
                            </a>
                        </li>

                    </ul>

                </li>
                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['finance_payment_page_id']); ?>" class="nav-link <?php if (is_page($settings['finance_payment_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-hand-holding-usd"></i>
                        <p>
                            Make Payment
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['finance_report_page_id']); ?>" class="nav-link <?php if (is_page($settings['finance_report_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-chart-pie mr-1"></i>
                        <p>
                            Reports
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['settings_page_id']); ?>" class="nav-link <?php if (is_page($settings['settings_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-tools mr-1"></i>
                        <p>
                            Settings
                        </p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<?php echo get_permalink($settings['node_sync_page_id']); ?>" class="nav-link <?php if (is_page($settings['node_sync_page_id'])) echo 'active'; ?>">
                        <i class="fas fa-sync mr-1"></i>
                        <p>
                            Sync
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>