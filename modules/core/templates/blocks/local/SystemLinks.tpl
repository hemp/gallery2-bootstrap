{*
 * $Revision: 16235 $
 * Read this before changing templates!  http://codex.gallery2.org/Gallery2:Editing_Templates
 *}
{assign var="class" value=$class|replace:"SystemLinks":"SystemLink"}
{assign var="order" value=$order|default:""|split}
{assign var="othersAt" value=$othersAt|default:0}
{assign var="othersAt" value=$othersAt-1}
{assign var="separator" value=$separator|default:""}

{capture name="SystemLinks"}
  {foreach from=$theme.systemLinks key=linkId item=link}
    {if !in_array($linkId, $order)}
    <li><a href="{g->url params=$link.params}">{$link.text}</a></li>
    {$separator}
    {/if}
  {/foreach}
{/capture}

<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown">Profile <b class="caret"></b></a>
<ul class="dropdown-menu">
{foreach from=$order key=index item=linkId}
  {if $index==$othersAt}
    {assign var="SystemLinksShown" value=true}
    {$smarty.capture.SystemLinks}
  {/if}
  {if isset($theme.systemLinks[$linkId])}
  <li><a href="{g->url params=$theme.systemLinks[$linkId].params}">{$theme.systemLinks[$linkId].text}</a></li>
  {$separator}
  {/if}
{/foreach}
</ul></li>
{if !isset($SystemLinksShown)}{$smarty.capture.SystemLinks}{/if}
