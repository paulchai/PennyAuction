<div class="row mblue_box md_hide">
  <div class="col-md-3">Name</div>
  <div class="col-md-2">Subject</div>
  <div class="col-md-5">Message</div>
  <div class="col-md-2">Delete</div>
</div>
{foreach $messages as $key => $val}
<div class="row mblue_box1">
  <div data-label="Name" class="account_p_lbl col-md-3">{if $loged.userid == $val.from_id} {$val.tname} {else if $loged.userid != $val.from_id} {$val.fname}{/if}</div>
  <div data-label="Subject" class="account_p_lbl col-md-2"><a href="{$config.url}/dashboard/messages/view/{$val.r_id}">{$val.subject}</a></div>
  <div data-label="Message" class="account_p_lbl col-md-5">{$val.message_short}..({$val.date_add})</div>
  <div data-label="Delete" class="account_p_lbl col-md-2">{if ($val.from_id == $loged.userid and $val.from_status == 'delete') or ($val.to_id == $loged.userid and $val.to_status == 'delete')}<a href="{$config.url}/dashboard/messages/undelete/{$val.r_id}"><i class="fa fa-undo"></i></a>{else if ($val.from_id == $loged.userid and $val.from_status != 'delete') or ($val.to_id == $loged.userid and $val.to_status != 'delete')} <a href="javascript:void(0)"  onclick="deleteMessage({$val.r_id})"><i class="fa fa-trash"></i></a>{/if}</div>
</div>
{/foreach}


{$pagination_html} 
<script> 
                  function deleteMessage(pids)
                  {
					  
					  var r = confirm('Are you sure');
					  if(r)
					  {
						window.location = '{$config.url}/dashboard/messages/delete/'+pids;  
					  }
                  
                  } </script> 
