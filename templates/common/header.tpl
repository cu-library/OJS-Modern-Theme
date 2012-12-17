{strip}
{translate|assign:"applicationName" key="common.openJournalSystems"}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}
  {translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
  {assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}

{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
  <head>
    <meta charset="{$defaultCharset|escape}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>{$pageTitleTranslated}</title>
    <meta name="description" content="{$metaSearchDescription|escape}">
    <meta name="keywords" content="{$metaSearchKeywords|escape}" />
    <meta name="viewport" content="width=device-width">
    {$metaCustomHeaders}
    {if $displayFavicon}
    <link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />
    {/if}
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/bootstrap.min.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/main.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/main-afterresponsive.css">
    {foreach from=$stylesheets item=cssUrl}
    <link rel="stylesheet" href="{$cssUrl}" type="text/css" />
    {/foreach}
    <script src="{$baseUrl}/plugins/themes/modern/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    {$additionalHeadData}
    
  </head>
  <body>
    {include file="common/navbar.tpl"}
    <div id="main-container" class="container">
      <div class="row-fluid"><div class="span12">{include file="common/breadcrumbs.tpl"}</div></div>
      
      
      
      {assign var="mainspan" value="12"}
      {* Calculate how many spans for body content *}
      {if $leftSidebarCode && $rightSidebarCode}
        {assign var="mainspan" value="6"}
      {elseif $leftSidebarCode || $rightSidebarCode}
        {assign var="mainspan" value="9"}
      {/if}
      
      <div id="body" class="row-fluid">
      {if $leftSidebarCode}
        <div id="leftSidebar" class="span3">
          {$leftSidebarCode}
        </div>
      {/if}
      
      <div id="main" class="span{$mainspan}">
     
      <h2>{$pageTitleTranslated}</h2>
      {if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
      {if $pageSubtitleTranslated}
      <h3>{$pageSubtitleTranslated}</h3>
      {/if}
      
      <div id="content">
      

      
{/strip}
