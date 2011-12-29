{*
 * $Revision: 16727 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<!DOCTYPE html>
<html lang="{g->language}">
  <head>
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, insert our own. *}
    {if empty($head.title)}
      <title>{g->text text="Error!"}</title>
    {/if}

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link href="/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      body {ldelim}
        padding-top: 60px;
      {rdelim}
    </style>

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">
    
    <script src="/js/bootstrap-modal.js"></script>
    <script src="/js/bootstrap-alerts.js"></script>

    <script src="/js/bootstrap-twipsy.js"></script>
    <script src="/js/bootstrap-popover.js"></script>
    <script src="/js/bootstrap-dropdown.js"></script>
    <script src="/js/bootstrap-scrollspy.js"></script>
    <script src="/js/bootstrap-tabs.js"></script>
    <script src="/js/bootstrap-buttons.js"></script>
	
    <script src="/js/libs/modernizr-2.0.6.min.js"></script>
  </head>
  <body>
    <div {g->mainDivAttributes}>
      {include file=$theme.errorTemplate}
    </div>

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}
  </body>
</html>
