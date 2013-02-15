<?php

/**
 * @file ModernTheme.inc.php
 *
 * @class ModernThemePlugin
 * @ingroup plugins_themes_modernThemePluginPlugin
 *
 * @brief "ModernTheme" theme plugin
 */

// $Id$


import('classes.plugins.ThemePlugin');

class ModernThemePlugin extends ThemePlugin {

	var $templateManager;

	function ModernThemePlugin() {
		parent::ThemePlugin();
	}

	/**
	 * Get the name of this plugin. The name must be unique within
	 * its category.
	 * @return String name of plugin
	 */
	function getName() {
		return 'ModernThemePlugin';
	}

	function getDisplayName() {
		return 'Modern Theme';
	}
	
	function getDescription() {
		return 'A more modern, responsive theme for OJS';
	}
  
	function activate(&$templateMgr) {
		$this->templateManager = $templateMgr;
	}

	function register($category, $path) {
		if (parent::register($category, $path)) {
			HookRegistry::register(
				'TemplateManager::display',
				array(&$this, 'callback')
			);
			return true;
		} 
		return false;
	}

	function callback($hookName, $args) { 

		$this->templateManager->template_dir[0] = Core::getBaseDir() 
										. DIRECTORY_SEPARATOR 
										. 'plugins' 
										. DIRECTORY_SEPARATOR 
										. 'themes' 
										. DIRECTORY_SEPARATOR 
										. 'modern' 
										. DIRECTORY_SEPARATOR 
										. 'templates';
										   											      
		$this->templateManager->compile_id = 'modernTheme';
		header('Content-Type: ' . $args[2] . '; charset=' . $args[3]);
		header('Cache-Control: ' . "$this->templateManager->cacheability");
		$args[4] = $this->templateManager->fetch($args[1], null, null, true);
		return true; 

	} 
}

?>
