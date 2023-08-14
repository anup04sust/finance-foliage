<?php
wp_head();
while (have_posts()){
  echo the_content();  
}
