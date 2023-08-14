<?php get_header(); ?>
<!-- /.navbar -->
<?php get_sidebar(); ?>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <?php get_template_part('template-parts/breadcrumb'); ?>

    <!-- Main content -->
    <section class="content">

        <?php get_template_part('template-parts/content'); ?>

    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->


<?php
get_footer();
?>