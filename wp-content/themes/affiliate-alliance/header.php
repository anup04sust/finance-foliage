<!DOCTYPE html>
<html <?php language_attributes(); ?>>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <?php
        wp_head();
        ?>
    </head>
    <body <?php body_class('sidebar-mini'); ?>>
        <!-- Site wrapper -->
        <div class="wrapper">
            <!-- Navbar -->
            <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <?php
                    if (function_exists('ff_week_start_end')) {
                    $week = ff_week_start_end();
                    echo sprintf('<li><span class="nav-link">%s - %s</span></li>', date("D jS, M Y", $week['start']), date("D jS, M Y", $week['end']));
                    }
                    ?>
                    </ul>
                    <!--Right navbar links-->
                    <ul class = "navbar-nav ml-auto">
                    <!--Notifications Dropdown Menu-->
                    <?php
                    $current_user = wp_get_current_user();
                    $settings = get_option('finance_foliage_settings');
                    ?>


                    <li class="nav-item dropdown">
                        <a class="nav-link" data-toggle="dropdown" href="#">
                            <i class="far fa-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                            <span class="dropdown-item dropdown-header">
                                <?php echo esc_html($current_user->display_name); ?>                                
                            </span>
                            <div class="dropdown-divider"></div>
                            <a href="<?php echo get_permalink($settings['settings_page_id']); ?>" class="dropdown-item">
                                <i class="fas fa-tools mr-2"></i> Settings
                            </a>

                            <div class="dropdown-divider"></div>
                            <a href="<?php echo wp_logout_url(); ?>" class="dropdown-item dropdown-footer"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </li>
                </ul>
            </nav>
            <?php
            