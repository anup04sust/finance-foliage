<?php

/* 
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */

function getrandomstring($length) {

       global $template;
       settype($template, "string");

       $template = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
       /* this line can include numbers or not */

       settype($length, "integer");
       settype($rndstring, "string");
       settype($a, "integer");
       settype($b, "integer");

       for ($a = 0; $a <= $length; $a++) {
               $b = rand(0, strlen($template) - 1);
               $rndstring .= $template[$b];
       }

       return $rndstring; 
}

function get_all_agents_users(){
    $agents_options = [];
    global $wpdb;

    $referral_nodes = $wpdb->get_results('SELECT aid,user_name FROM ' . $wpdb->prefix . 'alliance' . ' WHERE left_node IS NULL OR  right_node IS NULL ORDER BY user_name ASC');
    if (!empty($referral_nodes)) {
        foreach ($referral_nodes as $node) {
            $agents_options[$node->aid] = $node->user_name . '(' . $node->aid . ')';
        }
    }
  
    return $agents_options;
}