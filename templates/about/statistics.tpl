{**
 * templates/about/statistics.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the statistics table.
 *
 *}
{strip}
{assign var="pageTitle" value="about.statistics"}
{include file="common/header.tpl"}
{/strip}

{* WARNING: This page should be kept roughly synchronized with the
   implementation of the Journal Manager's statistics page.        *}
<div id="statistics">
	
<dl class="dl-horizontal">
    <dt>Year</dt>
    <dd>{$statisticsYear|escape}</dd>

	{if $statNumPublishedIssues}
		<dt>{translate key="manager.statistics.statistics.numIssues"}</dt>
		<dd>{$issueStatistics.numPublishedIssues}</dd>
	{/if}

	{if $statItemsPublished}
		<dt>{translate key="manager.statistics.statistics.itemsPublished"}</dt>
		<dd>{$articleStatistics.numPublishedSubmissions}</dd>
	{/if}

	{if $statNumSubmissions}
		<dt>{translate key="manager.statistics.statistics.numSubmissions"}</dt>
		<dd>{$articleStatistics.numSubmissions}</dd>
	{/if}

	{if $statPeerReviewed}
		<dt>{translate key="manager.statistics.statistics.peerReviewed"}</dt>
		<dd>{$limitedArticleStatistics.numReviewedSubmissions}</dd>
	{/if}

	{if $statCountAccept}
		<dt>{translate key="manager.statistics.statistics.count.accept"}</dt>
		<dd>{translate key="manager.statistics.statistics.count.value" count=$limitedArticleStatistics.submissionsAccept percentage=$limitedArticleStatistics.submissionsAcceptPercent}</dd>
	{/if}

	{if $statCountDecline}
		<dt>{translate key="manager.statistics.statistics.count.decline"}</dt>
		<dd>{translate key="manager.statistics.statistics.count.value" count=$limitedArticleStatistics.submissionsDecline percentage=$limitedArticleStatistics.submissionsDeclinePercent}</dd>
	{/if}

	{if $statCountRevise}
		<dt>{translate key="manager.statistics.statistics.count.revise"}</dt>
		<dd>{translate key="manager.statistics.statistics.count.value" count=$limitedArticleStatistics.submissionsRevise percentage=$limitedArticleStatistics.submissionsRevisePercent}</dd>
    {/if}

	{if $statDaysPerReview}
		<dt>{translate key="manager.statistics.statistics.daysPerReview"}</dt>
		<dd>
			{assign var=daysPerReview value=$reviewerStatistics.daysPerReview}
			{math equation="round($daysPerReview)"}
		</dd>
    {/if}

	{if $statDaysToPublication}
		<dt>{translate key="manager.statistics.statistics.daysToPublication"}</dt>
		<dd>{$limitedArticleStatistics.daysToPublication}</dd>
    {/if}

	{if $statRegisteredUsers}
		<dt>{translate key="manager.statistics.statistics.registeredUsers"}</dt>
		<dd>{translate key="manager.statistics.statistics.totalNewValue" numTotal=$allUserStatistics.totalUsersCount numNew=$userStatistics.totalUsersCount}</dd>
    {/if}

	{if $statRegisteredReaders}
		<dt>{translate key="manager.statistics.statistics.registeredReaders"}</dt>
		<dd>{translate key="manager.statistics.statistics.totalNewValue" numTotal=$allUserStatistics.reader|default:"0" numNew=$userStatistics.reader|default:"0"}</dd>
    {/if}

</dl>
	{if $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $statSubscriptions}
		
		<h3>{translate key="manager.statistics.statistics.subscriptions"}</h3>
		
		<dl>
		{foreach from=$allSubscriptionStatistics key=type_id item=stats}		
			<dt>{$stats.name}:</dt>
			<dd>{translate key="manager.statistics.statistics.totalNewValue" numTotal=$stats.count|default:"0" numNew=$subscriptionStatistics.$type_id.count|default:"0"}</dd>
		{/foreach}
	    </dl>
	{/if}

	<div class="pagination pagination-centered">
    <ul>
      <li><a href="{url statisticsYear=$statisticsYear-1}">{translate key="navigation.previousPage"}</a></li>
      <li><a href="{url statisticsYear=$statisticsYear-3}">{$statisticsYear-3|escape}</a></li>  
      <li><a href="{url statisticsYear=$statisticsYear-2}">{$statisticsYear-2|escape}</a></li>     
      <li><a href="{url statisticsYear=$statisticsYear-1}">{$statisticsYear-1|escape}</a></li>  
      <li><a href="{url statisticsYear=$statisticsYear}">{$statisticsYear|escape}</a></li>  
      <li><a href="{url statisticsYear=$statisticsYear+1}">{$statisticsYear+1|escape}</a></li>  
      <li><a href="{url statisticsYear=$statisticsYear+2}">{$statisticsYear+2|escape}</a></li>   
      <li><a href="{url statisticsYear=$statisticsYear+3}">{$statisticsYear+3|escape}</a></li> 
      <li><a href="{url statisticsYear=$statisticsYear+1}">{translate key="navigation.nextPage"}</a></li>
    </ul>
    </div>
</div>


{include file="common/footer.tpl"}

