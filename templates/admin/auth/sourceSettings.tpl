{**
 * templates/admin/auth/sourceSettings.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Authentication source settings under site administration.
 *
 *}
{strip}
{assign var="pageTitle" value="admin.authSources"}
{include file="common/header.tpl"}
{/strip}

<br />
<div id="sourceSettings">
<form method="post" class="form-horizontal" action="{url op="updateAuthSource" path=$authId}">
  <div class="control-group">
	{fieldLabel name="title" key="common.title" class="control-label"}
	<div class="controls">
      <input type="text" id="title" name="title" value="{$title|escape}" size="40" maxlength="120" class="textField" />
	</div>
  </div>
  <h4>{translate key="common.options"}</h4>
  
  <div class="control-group">	
    <div class="control-label">
	  <input type="checkbox" name="settings[syncProfiles]" id="syncProfiles" value="1"{if $settings.syncProfiles} checked="checked"{/if} />
    </div>
	<label for="syncProfiles" class="controls">{translate key="admin.auth.enableSyncProfiles"}</label>	    
  </div>

  <div class="control-group">	
    <div class="control-label">
	  <input type="checkbox" name="settings[syncPasswords]" id="syncPasswords" value="1"{if $settings.syncPasswords} checked="checked"{/if} />
	</div>
	<label for="syncPasswords" class="controls">{translate key="admin.auth.enableSyncPasswords"}</label>
  </div>

  <div class="control-group">	
    <div class="control-label">
	  <input type="checkbox" name="settings[createUsers]" id="createUsers" value="1"{if $settings.createUsers} checked="checked"{/if} />
	</div>
	  <label for="createUsers" class="controls">{translate key="admin.auth.enableCreateUsers"}</label>
  </div>

{if $pluginTemplate}{include file=$pluginTemplate}{/if}

<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="auth" escape=false}'" /></p>

</form>
</div>
{include file="common/footer.tpl"}

