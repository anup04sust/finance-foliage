<?php

/**
 * Description of FfSetups
 *
 * @author anup
 */
class FfSetups {

    private $setting_options;
    public $option_name = 'finance_foliage_settings';

    public function init() {
        if (!current_user_can('activate_plugins')) {
            return;
        }

        $this->setting_options = get_option($this->option_name);
        $this->crateLoginPage();
        $this->crateDashboardPage();
        $this->crateSettingsPage();
        $this->crateAgentNodesPage();
        $this->crateFinanceReportPage();
        $this->crateFinanceReportPrintPage();
        $this->crateAddAgentPage();
        $this->singleAgentPage();
        $this->addUserRoles();

        update_option($this->option_name, $this->setting_options);

        $this->createDbTable();
    }

    private function crateLoginPage() {
        $page_slug = 'user-account'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'My Account', // Title of the Content
            'post_content' => 'Login Form shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['user_account_page_id'] = $page_id;
        }
    }

    private function crateDashboardPage() {
        $page_slug = 'dashboard'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Dashboard', // Title of the Content
            'post_content' => 'Dashboard shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['dashboard_page_id'] = $page_id;

            update_option('page_on_front', $page_id);
            update_option('show_on_front', 'page');
        }
    }

    private function crateSettingsPage() {
        $page_slug = 'settings'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Settings', // Title of the Content
            'post_content' => 'Dashboard shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['settings_page_id'] = $page_id;
        }
    }

    private function crateAgentNodesPage() {
        $page_slug = 'agent-nodes'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Agent List', // Title of the Content
            'post_content' => 'Agent Nodes shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['agentnodes_page_id'] = $page_id;
        }
    }

    private function crateFinanceReportPage() {
        $page_slug = 'finance-report'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Finance Report', // Title of the Content
            'post_content' => 'finance-report shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['finance_report_page_id'] = $page_id;
        }
    }

    private function crateFinanceReportPrintPage() {
        $page_slug = 'finance-report'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Finance Report Print', // Title of the Content
            'post_content' => 'finance-report shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['finance_report_print_page_id'] = $page_id;
        }
    }

    private function crateAddAgentPage() {
        $page_slug = 'add-agent'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Add Agent', // Title of the Content
            'post_content' => 'add agent shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['agentnode_addnew_page_id'] = $page_id;
        }
    }

    private function singleAgentPage() {
        $page_slug = 'agent-info'; // Slug of the Post
        $pageObj = array(
            'post_type' => 'page', // Post Type Slug eg: 'page', 'post'
            'post_title' => 'Agent info', // Title of the Content
            'post_content' => 'add agent shortcode', // Content
            'post_status' => 'publish', // Post Status
            'post_author' => 1, // Post Author ID
            'post_name' => $page_slug   // Slug of the Post
        );
        if (!get_page_by_path($page_slug, OBJECT, 'page')) { // Check If Page Not Exits
            $page_id = wp_insert_post($pageObj);

            $this->setting_options['agentnode_single_page_id'] = $page_id;
        }
    }

    private function addUserRoles() {
        /* Create Finance Manager User Role */
        add_role(
                'finance_manager', //  System name of the role.
                __('Finance Manager'), // Display name of the role.
                array(
                    'read' => true,
                    'add_users' => true,
                    'create_users' => true,
                    'list_users' => true,
                    'edit_users' => true,
                    'upload_files' => true,
                )
        );
        /* Create Finance Agent User Role */
        add_role(
                'finance_agent', //  System name of the role.
                __('Finance Agent'), // Display name of the role.
                array(
                    'read' => false,
                    'create_posts' => false,
                    'edit_posts' => false,
                    'edit_others_posts' => false,
                    'publish_posts' => false,
                    'manage_categories' => false,
                    'manage_options' => false, // Most plugi
                )
        );
    }

    private function createDbTable() {
        global $wpdb;
        $charset_collate = $wpdb->get_charset_collate();
        $table_name = $wpdb->prefix . 'affiliate_alliance';
        $sql = "CREATE TABLE " . $table_name . " (
  ID bigint NOT NULL,
  user_id bigint NOT NULL,
  agent_cid int NOT NULL,
  user_name varchar(255) NOT NULL,
  business_center int NOT NULL DEFAULT '1',
  left_node int NOT NULL DEFAULT '0',
  right_node int NOT NULL DEFAULT '0',
  left_hand_count int NOT NULL DEFAULT '0',
  right_hand_count int NOT NULL DEFAULT '0',
  parent_node int NOT NULL,
  wallet_amount float NOT NULL DEFAULT '0',
  updated datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) " . $charset_collate . ";";

        $sql .= "ALTER TABLE " . $table_name . "
  ADD PRIMARY KEY (ID),
  ADD KEY parent_node (parent_node);";

        $sql .= "ALTER TABLE affiliate_alliance
  MODIFY ID bigint NOT NULL AUTO_INCREMENT;
COMMIT;";
        require_once(ABSPATH . 'wp-admin/includes/upgrade.php');
        dbDelta($sql);
    }
}
