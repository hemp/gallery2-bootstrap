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
  {assign var="firstAlbum" value=true}

  {foreach from=$theme.children item=child}
    {if $firstAlbum}
      <div class="row">
      {assign var="firstAlbum" value=false}
    {/if}
      
    {if $child.canContainChildren}    
    <div class="span8">
      <h3><a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">{$child.title|default:$child.pathComponent|markup}</a></h3>
      <ul class="media-grid">
          <li><a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}" rel="twipsy" data-placement="right" title="{if ($child.descendentCount > 0)}{g->text text="%d Images" arg1=$child.descendentCount}{/if}">
          {if isset($child.thumbnail)}
            {g->image item=$child image=$child.thumbnail class="thumbnail"}
          {else}
            {g->text text="no thumbnail"}
          {/if}
          </a>

          {if isset($child.summary) && $child.summary.length>0}<p>&nbsp;&nbsp;{$child.summary|entitytruncate:256|markup}</p>{/if}
          
          {if isset($child.itemSummaries.newitems)}&nbsp;&nbsp;<span class="label success">{$child.itemSummaries.newitems}</span><br/>{/if}		
		  </li>
      </ul>
    </div>	
    {/if}
  {/foreach}
  {if !$firstAlbum}
     </div>
  {/if}
    
  {assign var="firstItem" value=true}

  {foreach from=$theme.children item=child}
    {if !$child.canContainChildren}
      {if $firstItem}
		<ul class="media-grid">
        {assign var="firstItem" value=false}
      {/if}
	<li><a href="{g->url params=$theme.pageUrl arg1="itemId=`$child.id`"}">
	  {if isset($child.thumbnail)}
	    {g->image item=$child image=$child.thumbnail class='thumbnail'}
	  {else}
	    {g->text text="no thumbnail"}
	  {/if}
	</a></li>
    {/if}
  {/foreach}
  {if !$firstItem}
      <div class="clear"></div>
  {/if}
{/if}
</div></div>

{* Navigator *}
{if $theme.totalPages > 1}
{g->block type="core.Navigator" navigator=$theme.navigator prefix="&larr;  " suffix=" &rarr;"
	  currentPage=$theme.currentPage totalPages=$theme.totalPages}
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
	{g->block type="core.ItemLinks" useDropdown=true
	  links=$theme.userLinks class="floatrix-userLinks"}
</div>
{/if}

{* Guest preview mode *}
{g->block type="core.GuestPreview" class="gbBlock"}

{* Our emergency edit link, if the user removes all blocks containing edit links *}
{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkBlocks="album,itemlinks"}

