{include file="common/header-1.tpl" nocache}
<div class="main_container">
  <div class="row dashboard">
    <div class="col-md-3"> {include file="left-nav-dashboard.tpl" nocache} </div>
    <div class="col-md-9">
      <h4 class="ds_brd">Withdrawals</h4>
       {if $message != ''}
         <div class="row">
            <div class="bg {if $action == 'error'}bg-danger{else}bg-success{/if} padding-20  m-top-40"> <i class="fa fa-warning"></i> {$message}. </div>
          </div>
       {/if}
      <div class="row">
       <div class="col-md-6"><b>Available Balance To Withdraw:</b>${$userbalance.ledger}
         </div>
      </div> 
      <div class="row">
       <div class="col-md-6"> 
       <form name="" data-parsley-validate action="{$config.url}/dashboard/withdrawal" method="post">
       <div class="form-group">
         <label>{$_phrase.amounttowithdraw}</label>
         <input type="text" name="amount" value="" placeholder="0.00" required class="form-control floatpoint">

       </div>
      
       <div class="form-group">
         <label>Payment Mode</label>
         <select name="paymethod" required  class="form-control">
                   <option value="Paypal">Paypal</option>
                   <option value="ACH">ACH</option>
                   <option value="Cheque">Cheque</option>
         </select>
         
       </div>
       <div class="form-group">
         <label>Payment Details(paypal address/ACH details/Bank Details)</label>
         <textarea required name="paydetails"  class="form-control"></textarea>
         
       </div>
       <button type="submit" class="btn btn-success">Confirm Withdraw</button>
      </form>
    </div>
      </div> 


      <div class="row mblue_box md_hide">
        <div class="col-md-2 text-center">{$_phrase.amount}</div>
        <div class="col-md-3 text-center">Date Requested</div>
        <div class="col-md-1 text-center">Paid</div>
        <div class="col-md-2 text-center">Pay Method</div>
        <div class="col-md-3 text-center">Pay Method</div>
        <!--<div class="col-md-3"> {$_phrase.amount} </div>-->
      </div>
      {if $withdraw|count <=  0}
      <div class="row mblue_box1" style="text-align:center;"> No withdraw Found </div>
      {else}
      {foreach $withdraw as $key => $val}
      <div class="row mblue_box1">
        <div data-label="Amount" class="account_p_lbl col-md-2 text-center">$ {$val.amount}</div>
        <div data-label="Date Requested" class="account_p_lbl col-md-3 text-center">{$val.date_added}</div>
        <div data-label="Paid" class="account_p_lbl col-md-1 text-center">{if $val.paid} Paid {elseif !$val.paid} Unpaid {/if}</div>
        <div data-label="Paid" class="account_p_lbl col-md-2 text-center">{$val.method}</div>
        <div data-label="Pay Method" class="account_p_lbl col-md-3 text-center">{$val.details}</div>
        <!--<div class="col-md-3">{$val.proposed_amount}</div>-->
        
      </div>
      {/foreach}
      {/if}  {$pagination_html}
  </div>
</div>
</div>
{include file="common/footer-1.tpl" nocache} 