{*
 * $Revision: 16235 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
<!-- <div class="page-header"><h2>{$theme.item.title|markup}</h2></div> -->

{if !count($theme.children)}
  <div class="alert-message block-message info">
    <p><strong>{g->text text="This album is empty."}</strong></p>
    {if isset($theme.permissions.core_addDataItem)}
    <div class="alert-actions"><a class="btn small" href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}">{g->text text="Add a photo!"}</a></div>
    {/if}
  </div>
{else}

  {if !$user.isGuest}
  <div class="row-fluid"><div class="span2">{g->block type="core.ItemLinks" useDropdown=false links=$theme.userLinks}</div>
  <div class="span10">
  {/if}

  {assign var="firstAlbum" value=true}

  {foreach from=$theme.children item=child}
    {if $child.canContainChildren}
    {if $firstAlbum}
      <div class="row-fluid">
      <ul class="thumbnails">
      {assign var="firstAlbum" value=false}
    {/if}
      
      <li><div class="thumbnail">
      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}" rel="tooltip" data-placement="right" data-title="{if ($child.descendentCount > 0)}{g->text text="%d Images" arg1=$child.descendentCount}{/if}">
      {if isset($child.thumbnail)}{g->image item=$child image=$child.thumbnail}{else}<img height="150" width="150" src="http://placehold.it/150&text=no%20thumbnail"/>{/if}
      </a>
      <div class="caption well" style="width:130px;height:55px;margin-bottom:0;padding-top:0;padding-bottom:0;text-align:center;display:table-cell;vertical-align:middle;">
      
      <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">{$child.title|default:$child.pathComponent|markup}</a>
      {if isset($child.itemSummaries.newitems)}<span class="label label-success">{$child.itemSummaries.newitems}</span>{/if}
      
      </div>
      </div></li>
    {/if}
  {/foreach}
  {if !$firstAlbum}
    </ul>
    </div>
  {/if}

  {assign var="firstItem" value=true}
  {foreach from=$theme.children item=child}
    {if !$child.canContainChildren}
      {if $firstItem}
        {assign var="firstItem" value=false}
        <div class="row-fluid">
        <ul class="thumbnails">
      {/if}
	<li><a class="thumbnail" href="{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}">
	  {if isset($child.thumbnail)}
	    {g->image item=$child image=$child.thumbnail}
	  {else}
	    <img height="150" width="150" src="http://placehold.it/150&text=no%20thumbnail"/>
	  {/if}
	</a></li>
    {/if}
  {/foreach}
  {if !$firstItem}
    </ul>
    </div>
  {/if}

{* Navigator *}
{if $theme.totalPages > 1}
{g->block type="core.Navigator" navigator=$theme.navigator prefix="&larr;  " suffix=" &rarr;"
	  currentPage=$theme.currentPage totalPages=$theme.totalPages}
{/if}

  
  {if !$user.isGuest}
  </div><!--./span10-->
  </div><!--./row-fluid-->
  {/if}
  
  
{/if}


{* Description *}
{if !empty($theme.item.description)}
  <hr />
  <p>{$theme.item.description|markup}</p>
{/if}

{* Show any other album blocks (comments, etc) *}
{foreach from=$theme.params.albumBlocks item=block}
  {g->block type=$block.0 params=$block.1}
{/foreach}

{if !empty($theme.userLinks)}
<!--  TODO -->
<div class="pull-right">
	{g->block type="core.ItemLinks" useDropdown=true links=$theme.userLinks}
</div>
{/if}

{* Our emergency edit link, if the user removes all blocks containing edit links 
{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="album,itemlinks"}
*}

