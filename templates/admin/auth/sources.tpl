{**
 * templates/admin/auth/sources.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of authentication sources in site administration.
 *
 *}
{strip}
{assign var="pageTitle" value="admin.authSources"}
{include file="common/header.tpl"}
{/strip}

<br />

<form method="post" action="{url op="updateAuthSources"}">

<div id="sources">
<table class="table table-bordered">
	<thead>
		<tr>
		<th>{translate key="common.default"}</td>
		<th>{translate key="common.title"}</td>
		<th>{translate key="common.plugin"}</td>
		<th>{translate key="common.action"}</td>
		<tr>
	</thead>
	<tbody>
	{iterate from=sources item=auth}
	<tr>
		<td><input type="radio" id="defaultAuthId_{$auth->getAuthId()}" name="defaultAuthId" value="{$auth->getAuthId()}"{if $auth->getDefault()} checked="checked"{assign var="defaultAuthId" value=$auth->getAuthId()}{/if} /></td>
		<td><label for="defaultAuthId_{$auth->getAuthId()}">{$auth->getTitle()|escape}</label></td>
		<td>{$auth->getPlugin()}</td>
		<td align="right"><a href="{url op="editAuthSource" path=$auth->getAuthId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a class="action" href="{url op="deleteAuthSource" path=$auth->getAuthId()}" onclick="return confirm('{translate|escape:"jsparam" key="admin.auth.confirmDelete"}')">{translate key="common.delete"}</a></td>
	</tr>
	{/iterate}
	{if $sources->wasEmpty()}
	<tr>
		<td colspan="4" class="nodata">{translate key="admin.auth.noneCreated"}</td>
	</tr>
	{else}
		<tr>
			<td colspan="2">{page_info iterator=$sources}</td>
			<td colspan="2">{page_links anchor="sources" name="sources" iterator=$sources}</td>
		</tr>
	{/if}
	<tr>
		<td><input type="radio" id="defaultAuthId_0" name="defaultAuthId" value="0"{if !$defaultAuthId} checked="checked"{/if} /></td>
		<td colspan="1"><label for="defaultAuthId_0">{translate key="admin.auth.ojs"}</label></td>
		<td colspan="2" align="right">
			<input type="submit" value="{translate key="common.save"}" class="button" />
		</td>
	</tr>
</tbody>
</table>

</form>

{translate key="admin.auth.defaultSourceDescription"}
<div id="createAuth">
<h4>{translate key="admin.auth.create"}</h4>

<form method="post" action="{url op="createAuthSource"}">
	{translate key="common.plugin"}: <select name="plugin" size="1"><option value=""></option>{html_options options=$pluginOptions}</select> <input type="submit" value="{translate key="common.create"}" class="button" />
</form>
</div>
</div>
{include file="common/footer.tpl"}

