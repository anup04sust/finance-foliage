<style>
    #finance_foliage_settings_fields button[type="submit"]{
        display: none !important;
    }
</style>

<div class="container-fluid py-4">
    <?php echo do_shortcode('[mb_frontend_form id="finance_foliage_settings_fields" post_id="'.get_the_ID().'" ajax="false"]'); ?>
    <a href="#" class="finance-foilage-save btn btn-primary mt-3">Save settings</a>
</div>