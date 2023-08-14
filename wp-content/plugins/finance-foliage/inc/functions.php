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
    //global $wpdb;
    $query_arg = array(
        'role' => 'finance_agent',
        'orderby' => 'display_name', 
        'order' => 'ASC'
        );
    $user_query = new WP_User_Query($query_arg);
    
    $finance_agents = $user_query->get_results();
    //pprint($user_query->query_fields);
    //pprint($user_query->query_from);
}