<div class="navbar navbar-static-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="{url context=$homeContext page="index"}">
          {if $displayPageHeaderTitle}
            {$displayPageHeaderTitle}
          {elseif $alternatePageHeader}
            {$alternatePageHeader}
          {elseif $siteTitle}
            {$siteTitle}
          {else}
            {$applicationName}
          {/if}
          </a>
          <div class="nav-collapse collapse">
            <ul class="nav">
		      <li id="home"><a href="{url page="index"}">{translate key="navigation.home"}</a></li>
		      <li id="about"><a href="{url page="about"}">{translate key="navigation.about"}</a></li>

		      {if $isUserLoggedIn}
			  <li id="userHome"><a href="{url journal="index" page="user"}">{translate key="navigation.userHome"}</a></li>
		      {else}
			  <li id="login"><a href="{url page="login"}">{translate key="navigation.login"}</a></li>
			  {if !$hideRegisterLink}
			  <li id="register"><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
			  {/if}
		      {/if}{* $isUserLoggedIn *}

		      {if $siteCategoriesEnabled}
			  <li id="search"><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
		      {/if}{* $categoriesEnabled *}

		      {if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			  <li id="search"><a href="{url page="search"}">{translate key="navigation.search"}</a></li>
		      {/if}

		      {if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			  <li id="current"><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
			  <li id="archives"><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
		      {/if}

		      {if $enableAnnouncements}
			  <li id="announcements"><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		      {/if}{* enableAnnouncements *}

		      {call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		      {foreach from=$navMenuItems item=navItem}
			  {if $navItem.url != '' && $navItem.name != ''}
				<li id="navItem"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{url page=""}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			  {/if}
		      {/foreach}
            </ul><!-- /nav -->
          </div><!--/.nav-collapse -->
        </div>
      </div>
  </div>

