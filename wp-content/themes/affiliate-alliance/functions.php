<?php

function affiliate_alliance_scripts() {
    //Add Styles
    wp_enqueue_style('affiliate-alliance-admin-style', get_template_directory_uri() . '/assets/css/dashboard.css', array(), wp_get_theme()->get('Version'));
    wp_enqueue_style('fontawesome-free', get_template_directory_uri() . '/assets/fontawesome/css/all.min.css', array(), wp_get_theme()->get('Version'));
    // Print styles.
    wp_enqueue_style('affiliate-alliance-print-style', get_template_directory_uri() . '/assets/css/print.css', array(), wp_get_theme()->get('Version'), 'print');

    // Responsive embeds script.
    wp_enqueue_script(
            'affiliate-alliance-admin-script',
            get_template_directory_uri() . '/assets/js/scripts.js',
            array('jquery'),
            wp_get_theme()->get('Version'),
            true
    );
    wp_enqueue_script(
            'affiliate-alliance-admin-bootstrap',
            get_template_directory_uri() . '/assets/bootstrap/js/bootstrap.bundle.min.js',
            array('jquery'),
            wp_get_theme()->get('Version'),
            true
    );
    wp_enqueue_script(
            'affiliate-alliance-admin-dashboard',
            get_template_directory_uri() . '/assets/js/dashboard.js',
            array('jquery'),
            wp_get_theme()->get('Version'),
            true
    );
}

add_action('wp_enqueue_scripts', 'affiliate_alliance_scripts');
