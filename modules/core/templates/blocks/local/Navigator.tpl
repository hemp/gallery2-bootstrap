{*
 * $Revision: 16235 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{if isset($reverseOrder) && $reverseOrder}
  {assign var="order" value="next-and-last current first-and-previous"}
{else}
  {assign var="order" value="first-and-previous current next-and-last"}
{/if}
{assign var="prefix" value=$prefix|default:""}
{assign var="suffix" value=$suffix|default:""}
{*
 * The strip calls in this tpl are to avoid a safari bug where padding-right is lost
 * in floated containers for elements that have whitespace before the closing tag.
 *}
<div class="pagination">
<ul>
{foreach from=$order|split item="which"}
{if $which=="next-and-last"}
    {strip}
    {if isset($navigator.next)}    {* Uncomment to omit next when same as last:
	&& (!isset($navigator.last) || $navigator.next.urlParams != $navigator.last.urlParams)} *}
    <li><a href="{g->url params=$navigator.next.urlParams}">
      {g->text text="next"}{$suffix}
      {if isset($navigator.next.thumbnail)}
	{g->image item=$navigator.next.item image=$navigator.next.thumbnail
		  maxSize=40 class="next"}
      {/if}
    </a></li>
    {/if}

    {if isset($navigator.last)}
    <li><a href="{g->url params=$navigator.last.urlParams}">
      {g->text text="last"}{$suffix}
      {if isset($navigator.last.thumbnail)}
	{g->image item=$navigator.last.item image=$navigator.last.thumbnail
		  maxSize=40 class="last"}
      {/if}
    </a></li>
    {/if}
    {/strip}
{elseif $which=="current"}
  {if (isset($currentPage) && isset($totalPages)) || (isset($currentItem) && isset($totalItems))}
  {assign var="lastPage" value=0}
  {foreach name=jumpRange from=$theme.jumpRange item=page}
  {if ($page - $lastPage >= 2)}
    {if ($page - $lastPage == 2)}
    <li><a href="{g->url params=$theme.pageUrl arg1="page=`$page-1`"}">{$page-1}</a></li>
    {else}
    <li class="disabled"><a href="#">...</a></li>
    {/if}
  {/if}

    {if ($theme.currentPage == $page)}
	<li class="active"><a href="{g->url params=$theme.pageUrl arg1="page=$page"}">{$page}</a></li>
    {else}
    <li><a href="{g->url params=$theme.pageUrl arg1="page=$page"}">{$page}</a></li>
    {/if}

  {assign var="lastPage" value=$page}
  {/foreach}
  {/if}
{else}
    {strip}
    {if isset($navigator.first)}
    <li><a href="{g->url params=$navigator.first.urlParams}">
      {if isset($navigator.first.thumbnail)}
	{g->image item=$navigator.first.item image=$navigator.first.thumbnail
		  maxSize="40" class="first"}
      {/if}
      {$prefix}{g->text text="first"}
    </a></li>
    {/if}

    {if isset($navigator.back)}    {* Uncomment to omit previous when same as first:
	&& (!isset($navigator.first) || $navigator.back.urlParams != $navigator.first.urlParams)} *}
    <li><a href="{g->url params=$navigator.back.urlParams}">
      {if isset($navigator.back.thumbnail)}
	{g->image item=$navigator.back.item image=$navigator.back.thumbnail
		  maxSize="40" class="previous"}
      {/if}
      {$prefix}{g->text text="previous"}
    </a></li>
    {/if}
    {/strip}
{/if}
{/foreach}
</ul>
</div>
