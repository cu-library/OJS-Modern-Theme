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
    $templateMgr->template_dir[0] = Core::getBaseDir() 
		                              . DIRECTORY_SEPARATOR 
		                              . 'plugins' 
		                              . DIRECTORY_SEPARATOR 
		                              . 'themes' 
		                              . DIRECTORY_SEPARATOR 
		                              . 'modern' 
		                              . DIRECTORY_SEPARATOR 
		                              . 'templates';          
		$templateMgr->clearTemplateCache();
		                              
	}
}

?>
