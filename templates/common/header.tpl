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
{/strip}
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
    
    <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
    <!-- <link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" /> -->
    <!-- <link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" /> -->
    
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/bootstrap.min.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/from-common.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/main.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="{$baseUrl}/plugins/themes/modern/css/main-afterresponsive.css">

    {foreach from=$stylesheets item=cssUrl}
    <link rel="stylesheet" href="{$cssUrl}" type="text/css" />
    {/foreach}

    <script src="{$baseUrl}/plugins/themes/modern/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    
    <script type="text/javascript">
    var new_jQuery = $.noConflict();
    </script>
    
    <!-- Base Jquery -->
    {if $allowCDN}<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">{literal}
        // Provide a local fallback if the CDN cannot be reached
        if (typeof google == 'undefined') {
            document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
            document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
        } else {
            google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
            google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
        }
    {/literal}</script>
    {else}
    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
    {/if}

    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/general.js"></script>
    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/tag-it.js"></script>
    <!-- Add javascript required for font sizer -->
    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/fontController.js" ></script>
    <script type="text/javascript">{literal}
        $(function(){
            fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
        });
    {/literal}</script>

    <script type="text/javascript">
        // initialise plugins
        {literal}
        $(function(){
            {/literal}{if $validateId}{literal}
            jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
            $("form[name={/literal}{$validateId}{literal}]").validate({
                errorClass: "error",
                highlight: function(element, errorClass) {
                    $(element).parent().parent().addClass(errorClass);
                },
                unhighlight: function(element, errorClass) {
                    $(element).parent().parent().removeClass(errorClass);
                }
            });
            {/literal}{/if}{literal}
        });
        {/literal}
    </script>
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