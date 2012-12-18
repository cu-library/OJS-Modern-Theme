</div><!--content-->
</div><!--main-->
{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
      {if $rightSidebarCode}
         <div id="rightSidebar" class="span3 well well-small">
           <ul class="nav nav-list">
           {$rightSidebarCode|regex_replace:'/<\/div>.*?<div/s':'</div><li class="divider"></li><div'|replace:'<br />':''|replace:'<div':'<li'|replace:'div>':'li>'|replace:'ul>':'ul class="nav nav-list">'|replace:'span':'li'|replace:'li class="blockTitle"':'li class="nav-header"'|replace:'blockSubtitle':'nav-header sub-header'}
           </ul>
         </div>
      {/if}
      </div>
        </div> <!-- /container -->

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="{$baseUrl}/plugins/themes/modern/js/vendor/jquery-1.8.3.min.js"><\/script>')</script>

        <script src="{$baseUrl}/plugins/themes/modern/js/vendor/bootstrap.min.js"></script>

        <script src="{$baseUrl}/plugins/themes/modern/js/main.js"></script>

        <script>
            var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
            (function(d,t){literal}{var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
            g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
            s.parentNode.insertBefore(g,s)}{/literal}(document,'script'));
        </script>
    </body>
</html>
