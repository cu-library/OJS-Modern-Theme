{strip}
{if $pageFooter==''}
	{if $currentJournal && $currentJournal->getSetting('onlineIssn')}
		{assign var=issn value=$currentJournal->getSetting('onlineIssn')}
	{elseif $currentJournal && $currentJournal->getSetting('printIssn')}
		{assign var=issn value=$currentJournal->getSetting('printIssn')}
	{/if}
	{if $issn}
		{translate|assign:"issnText" key="journal.issn"}
		{assign var=pageFooter value="$issnText: $issn"}
	{/if}
{/if}
{/strip}
{if $displayCreativeCommons}
	{translate key="common.ccLicense"}
{/if}
{if $pageFooter}
	<br /><br />
	{$pageFooter}
{/if}
{call_hook name="Templates::Common::Footer::PageFooter"}

</div><!--main-->
{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
      {if $rightSidebarCode}
         <div id="rightSidebar" class="span3 well well-small">
           <ul class="nav nav-list">
             {$rightSidebarCode|regex_replace:'/<\/div>.*?<div/s':'</div><li class="divider"></li><div'|replace:'<br />':''|replace:'<div':'<li'|replace:'div>':'li>'|replace:'ul>':'ul class="nav nav-list">'|replace:'span':'li'|replace:'li class="blockTitle"':'li class="nav-header"'|replace:'blockSubtitle':'nav-header sub-header'|replace:'<form':'<li><form'|replace:'/form>':'/form></li>'}
            </ul>
         </div>
      {/if}
      </div> <!-- /body -->
      </div> <!-- /content -->
        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){literal}{var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}{/literal}(document,'script'));
        </script>

        {get_debug_info}
        {if $enableDebugStats}{include file=$pqpTemplate}{/if}
    </body>
</html>



