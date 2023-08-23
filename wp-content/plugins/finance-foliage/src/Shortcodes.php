<?php

namespace FinanceFoliage;

/**
 * Description of Shortcodes
 *
 * @author anup
 */
class Shortcodes {

    //put your code here
    public $settings;

    public function __construct() {
        $this->settings = get_option('finance_foliage_settings');
        add_filter('the_content', array($this, 'filterContent'), 9999, 1);
        add_filter('logout_redirect', array($this, 'logoutRedirect'), 9999, 1);

        add_shortcode('finance_foliage_account', array($this, 'userAccount'));
        add_shortcode('finance_foliage_dashboard', array($this, 'userDashboard'));
        add_shortcode('finance_foliage_agents', array($this, 'agentList'));
        add_shortcode('finance_foliage_add_new_agent', array($this, 'addAgent'));
        add_shortcode('finance_foliage_config_sync', array($this, 'configSync'));
    }

    public function filterContent($content) {
        if (is_page($this->settings['user_account_page_id'])) {
            $content = $this->userAccount();
        }
        if (is_page($this->settings['dashboard_page_id'])) {
            $content = $this->userDashboard();
        }
        if (is_page($this->settings['agentnodes_page_id'])) {
            $content = $this->agentList();
        }
        if (is_page($this->settings['agentnode_addnew_page_id'])) {
            $content = $this->addAgent();
        }
        if (is_page($this->settings['agentnode_edit_page_id'])) {
            $content = $this->editAgent();
        }
        if (is_page($this->settings['agentnode_single_page_id'])) {
           
            $content = $this->viewAgent();
        }
        if (is_page($this->settings['settings_page_id'])) {
            $content = $this->optionsSetting();
        }
        if (is_page($this->settings['finance_report_page_id'])) {
            $content = $this->financeReports();
        }
        if (is_page($this->settings['node_sync_page_id'])) {
            $content = $this->configSync();
        }
        return $content;
    }

    public function logoutRedirect($redirect_to) {
        $redirect_to = get_permalink($this->settings['user_account_page_id']);

        return $redirect_to;
    }

    private function userAccount() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/account.php';
        return ob_get_clean();
    }

    private function userDashboard() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/dashboard.php';
        return ob_get_clean();
    }

    private function agentList() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/agents.php';
        return ob_get_clean();
    }

    private function addAgent() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/add-agent.php';
        return ob_get_clean();
    }

    private function editAgent() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/edit-agent.php';
        return ob_get_clean();
    }

    private function viewAgent() {
        ob_start();
        $view = !empty($_REQUEST['view']) ? esc_attr($_GET['view']) : null;
       
        if (!empty($view) && $view === 'tree') {

            include_once FINANCE_FOLIGE_DIR . '/views/agent-tree-view.php';
        } else if (!empty($view) && $view === 'info') {
            include_once FINANCE_FOLIGE_DIR . '/views/agent-info-view.php';
        }
        return ob_get_clean();
    }

    private function optionsSetting() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/settings.php';
        return ob_get_clean();
    }
    private function financeReports() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/finance-report.php';
        return ob_get_clean();
    }
    private function configSync() {
        ob_start();
        include_once FINANCE_FOLIGE_DIR . '/views/config-sync.php';
        return ob_get_clean();
    }
}
