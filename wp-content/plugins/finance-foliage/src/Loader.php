<?php

namespace FinanceFoliage;

/**
 * Description of Loader
 *
 * @author anup
 */
class Loader {

    /**
     * Add hooks when module is loaded.
     */
    public function __construct() {
        
        $this->init();
    }
    private function init() {
        //TODO
        new Settings();
        new Shortcodes();
        new Agents();
    }
}
