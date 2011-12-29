{*
 * $Revision: 16727 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<!DOCTYPE html>
<html lang="{g->language}">
  <head>
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      <title>{$theme.item.title|markup:strip|default:$theme.item.pathComponent}</title>
    {/if}

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
<!--    <link href="{g->theme url="gallery2.css"}" rel="stylesheet"> -->

<!-- DEV MODE -->
<link rel="stylesheet/less" type="text/css" href="{g->theme url="lib/gallery2.less"}">
<script src="{g->theme url="js/libs/less-1.1.5.min.js"}" type="text/javascript"></script>
<script type="text/javascript">
    less.env = "development";
    less.watch();
</script>
<!-- DEV MODE -->

    <style type="text/css">
      body {ldelim}
        padding-top: 40px;
      {rdelim}
    </style>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="{g->theme url="images/favicon.ico"}">
    <link rel="apple-touch-icon" href="{g->theme url="images/apple-touch-icon.png"}">
    <link rel="apple-touch-icon" sizes="72x72" href="{g->theme url="images/apple-touch-icon-72x72.png"}">
    <link rel="apple-touch-icon" sizes="114x114" href="{g->theme url="images/apple-touch-icon-114x114.png"}">
	
    <script src="{g->theme url="js/libs/modernizr-2.0.6.min.js"}"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="{g->theme url="js/libs/jquery-1.7.1.min.js"}"><\/script>')</script>
  </head>
  <body>
    <div class="topbar" data-scrollspy="scrollspy">
      <div class="topbar-inner">
        <div class="container">
          <a class="brand" href="{$smarty.get.page}">Photos</a>

          <ul class="nav">
<!--             <li class="active"><a href="#overview">Overview</a></li> -->
<!--             <li><a href="#about">About</a></li> -->
<!--             <li><a href="#grid-system">Grid</a></li> -->
<!--             <li><a href="#layouts">Layouts</a></li> -->

<!--             <li><a href="#javascript">Javascript</a></li> -->
<!--             <li><a href="#less">Less</a></li> -->
<!--                   <form action=""> -->
<!--                     <input type="text" placeholder="Search" /> -->
<!--                   </form> -->
          </ul>
          {g->block type="core.SystemLinks" order="core.SiteAdmin core.YourAccount core.Login core.Logout" othersAt=4}
        </div>
      </div>
    </div>
  
  
  	<div class="container">
    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we don't draw
       * a header, footer, navbar, etc.  Those views are responsible for drawing everything.
       *}
      {if $theme.useFullScreen}
		{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {elseif $theme.pageType == 'progressbar'}
		<div class="content">
		  {g->theme include="progressbar.tpl"}
		</div>
      {else}
		  <div class="content">
		  <div class="span16">
			{g->block type="core.BreadCrumb" skipRoot=true separator="/"}

			{* Include the appropriate content type for the page we want to draw. *}
			{if $theme.pageType == 'album'}
			  {g->theme include="album.tpl"}
			{elseif $theme.pageType == 'photo'}
			  {g->theme include="photo.tpl"}
			{elseif $theme.pageType == 'admin'}
			  {g->theme include="admin.tpl"}
			{elseif $theme.pageType == 'module'}
			  {g->theme include="module.tpl"}
			{/if}

			<div class="footer"><footer>
			  <!-- {g->logoButton type="validation"}
			  {g->logoButton type="gallery2"}
			  {g->logoButton type="gallery2-version"}
			  {g->logoButton type="donate"} -->
			  Powered by <a href="http://gallery.menalto.com/" target="_new">Gallery</a>.<br/>
			  <a href="https://github.com/hemp/bootstrap" target="_new">Gallery theme</a> by <a href="http://chrishemp.com" target="_new">Chris Hemp</a>.
			</footer></div>
		  </div>
		  </div>
      {/if}  {* end of full screen check *}
    </div>
	</div>

    {*
     * Give Gallery a chance to output any cleanup code, like javascript that needs to be run
     * at the end of the <body> tag.  If you take this out, some code won't work properly.
     *}
    {g->trailer}

	
    <script src="{g->theme url="js/bootstrap-modal.js"}"></script>
    <script src="{g->theme url="js/bootstrap-alerts.js"}"></script>
    <script src="{g->theme url="js/bootstrap-twipsy.js"}"></script>
    <script src="{g->theme url="js/bootstrap-popover.js"}"></script>
    <script src="{g->theme url="js/bootstrap-dropdown.js"}"></script>
    <script src="{g->theme url="js/bootstrap-scrollspy.js"}"></script>
    <script src="{g->theme url="js/bootstrap-tabs.js"}"></script>
    <script src="{g->theme url="js/bootstrap-buttons.js"}"></script>

  <script>
    window._gaq = [['_setAccount','UA-369415-3'],['_trackPageview'],['_trackPageLoadTime']];
    /* Modernizr.load({ldelim}
      load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
    {rdelim}); */
  </script>
  
{literal}
<script>
$(document).ready(function() {
   $("a[rel=twipsy]").twipsy({ live: true });

   $("a[rel=popover]")
      .popover({
         offset: 10
      })
      .click(function(e) {
         e.preventDefault()
      });
 });
</script>
{/literal}
	
  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){ldelim}CFInstall.check({ldelim}mode:'overlay'{rdelim}){rdelim})</script>
  <![endif]-->

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}  
  </body>
</html>
