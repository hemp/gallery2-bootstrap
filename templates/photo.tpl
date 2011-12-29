{*
 * $Revision: 16235 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

<div class="page-header"><h2>{$theme.item.title|markup}</h2></div>

{if !empty($theme.imageViews)}
  {capture name="fallback"}
    <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"
		     forceFullUrl=true forceSessionId=true}">
      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
    </a>
  {/capture}

  {if ($image.viewInline)}
	<ul class="media-grid">
      {if $theme.params.enableImageMap}{strip}
		{if isset($theme.navigator.back)}
		{/if}
		<li><a href="#">{g->image item=$theme.item image=$image class="thumbnail" fallback=$smarty.capture.fallback usemap=#prevnext}</a></li>
		{if isset($theme.navigator.next)}
		{/if}
      {/strip}{else}
        {g->image item=$theme.item image=$image class="thumbnail" fallback=$smarty.capture.fallback}
      {/if}
	</ul>
  {else}
    {$smarty.capture.fallback}
  {/if}
{else}
  {g->text text="There is nothing to view for this item."}
{/if}

{* Navigation image map *}
{if $theme.params.enableImageMap && !empty($image.width) && !empty($image.height)}
<map id="prevnext" name="prevnext">
{if isset($theme.navigator.back)}
  <area shape="rect" coords="0,0,{math equation="round(x/2-1)" x=$image.width},{$image.height}" href="{g->url params=$theme.navigator.back.urlParams}" alt="{$theme.item.title|markup:strip|default:$theme.item.pathComponent}"/>
{/if}
{if isset($theme.navigator.next)}
  <area shape="rect" coords="{math equation="round(x/2)" x=$image.width},0,{$image.width},{$image.height}" href="{g->url params=$theme.navigator.next.urlParams}" alt="{$theme.item.title|markup:strip|default:$theme.item.pathComponent}"/>
{/if}
</map>
{/if}

{if isset($theme.navigator.back) || isset($theme.navigator.next)}{literal}
<script>
$(document).ready(function () {
$(document).keydown(function(e){
{/literal}{if isset($theme.navigator.back)}{literal}
    if (e.keyCode == 37)
    {
       window.location = "{/literal}{g->url params=$theme.navigator.back.urlParams}{literal}";
       return false;
    }
{/literal}{/if}
{if isset($theme.navigator.next)}{literal}
    if (e.keyCode == 39)
    {
       window.location = "{/literal}{g->url params=$theme.navigator.next.urlParams}{literal}";
       return false;
    }
{/literal}{/if}{literal}
});
});
</script>
{/literal}{/if}


{* Navigator *}
{if !empty($theme.navigator)}
  {g->callback type="core.LoadPeers" item=$theme.item windowSize=1}
  {g->block type="core.Navigator" navigator=$theme.navigator prefix="&larr;  " suffix=" &rarr;"
      currentItem=$block.core.LoadPeers.thisPeerIndex totalItems=$block.core.LoadPeers.peerCount}
{/if}

<hr/>

{* Description *}
{if !empty($theme.item.description) && ($theme.item.description != $theme.item.title)}
  <p>{$theme.item.description|markup}</p>
{/if}

{* Download *}
{if !empty($theme.sourceImage) &&
    (count($theme.imageViews) > 1 || $theme.sourceImage.mimeType != $theme.item.mimeType)}
 <p>
  {if $theme.sourceImage.mimeType != $theme.item.mimeType}
  <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
    {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
  {else}
  <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.sourceImage.id`"}">
    {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
  {/if}
  {if !empty($theme.sourceImage.width)}
    {g->text text="(%dx%d)" arg1=$theme.sourceImage.width arg2=$theme.sourceImage.height}
  {/if}
  </a>
</p>
{/if}

{* Show any other album blocks (comments, exif etc) *}
{foreach from=$theme.params.photoBlocks item=block}
  {g->block type=$block.0 params=$block.1}
{/foreach}

{* Guest preview mode *}
{g->block type="core.GuestPreview" class="gbBlock"}

{* Our emergency edit link, if the user removes all blocks containing edit links *}
{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="photo"}

