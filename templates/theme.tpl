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
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<!-- DEV MODE -->
<link rel="stylesheet/less" type="text/css" href="{g->theme url="lib/gallery2.less"}">
<script src="{g->theme url="js/libs/less-1.2.1.min.js"}" type="text/javascript"></script>
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
    
    <link href='http://fonts.googleapis.com/css?family=Droid+Sans' rel='stylesheet' type='text/css'>
    
    <script src="{g->theme url="js/libs/modernizr-2.0.6.min.js"}"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="{g->theme url="js/libs/jquery-1.7.1.min.js"}"><\/script>')</script>
  </head>
  <body>
        <div class="subnav" style="position:fixed;right:100px;top:0px;z-index:1050;">
      <ul class="nav nav-pills">
          {g->block type="core.SystemLinks" order="core.SiteAdmin core.YourAccount core.Login core.Logout" othersAt=4}
      </ul>
      </div>
      
  	<div class="container-fluid">
  	<!-- Start includes of theme.tpl -->
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we don't draw
       * a header, footer, navbar, etc.  Those views are responsible for drawing everything.
       *}
      {if $theme.useFullScreen}
		{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {elseif $theme.pageType == 'progressbar'}
		  {g->theme include="progressbar.tpl"}
      {else}
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
    <!-- End includes of theme.tpl -->  

			<footer class="footer">
{* Guest preview mode *}
<div class="pull-right">
{g->block type="core.GuestPreview" class="gbBlock"}
</div>

			  <!-- Old school
			  {g->logoButton type="validation"}
			  {g->logoButton type="gallery2"}
			  {g->logoButton type="gallery2-version"}
			  {g->logoButton type="donate"}
			  -->
			  Powered by <a href="http://gallery.menalto.com/" target="_new">Gallery</a> and <a href="https://github.com/hemp/gallery2-bootstrap" target="_new">theme</a>.
			</footer>
      {/if}  {* end of full screen check *}
    </div>

    {*
     * Give Gallery a chance to output any cleanup code, like javascript that needs to be run
     * at the end of the <body> tag.  If you take this out, some code won't work properly.
     *}
    {g->trailer}

<script src="{g->theme url="js/bootstrap-transition.js"}"></script>
<script src="{g->theme url="js/bootstrap-alert.js"}"></script>
<script src="{g->theme url="js/bootstrap-modal.js"}"></script>
<script src="{g->theme url="js/bootstrap-dropdown.js"}"></script>
<script src="{g->theme url="js/bootstrap-scrollspy.js"}"></script>
<script src="{g->theme url="js/bootstrap-tab.js"}"></script>
<script src="{g->theme url="js/bootstrap-tooltip.js"}"></script>
<script src="{g->theme url="js/bootstrap-popover.js"}"></script>
<script src="{g->theme url="js/bootstrap-button.js"}"></script>
<script src="{g->theme url="js/bootstrap-collapse.js"}"></script>
<script src="{g->theme url="js/bootstrap-carousel.js"}"></script>
<script src="{g->theme url="js/bootstrap-typeahead.js"}"></script>

  <script>
    window._gaq = [['_setAccount','UA-369415-3'],['_trackPageview'],['_trackPageLoadTime']];
    /* Modernizr.load({ldelim}
      load: ('https:' == location.protocol ? '//ssl' : '//www') + '.google-analytics.com/ga.js'
    {rdelim}); */
  </script>
  
{literal}
<script>
$(document).ready(function() {
	$('#gbSiteAdminLinks').addClass('nav-list');
	$('#gbSiteAdminLinks > li > span').addClass('nav-header');
 });

</script>
	
  <!--[if lt IE 7 ]>
    <script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script>
    <script>window.attachEvent('onload',function(){CFInstall.check({mode:'overlay'})})</script>
  <![endif]-->
{/literal}

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}  
  </body>
</html>
