<?php echo $header; ?>
<div class="container">

  <?php if (isset($success) && $success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>

  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> ms-account-dashboard"><?php echo $content_top; ?>
    <ul class="mm_dashboard_menu">
    	<li class="menuhead">Shop</li>
    	<li><a href="<?php echo $this->url->link('seller/account-dashboard', '', 'SSL'); ?>"><?php echo $ms_account_dashboard; ?></a></li>
    	<li class="menuhead">Catalog</li>
    	<li><a href= "<?php echo $this->url->link('seller/account-product/create', '', 'SSL'); ?>">Add new product</a></li>
    	<li><a href= "<?php echo $this->url->link('seller/account-product', '', 'SSL'); ?>">Products</a></li>
    	<li><a href="">Categories</a></li>
    	<li class="menuhead">Orders</li>
    	<li><a href= "<?php echo $this->url->link('seller/account-order', '', 'SSL'); ?>">Orders</a></li>
    	<li class="menuhead">Finances</li>
    	<li><a href= "<?php echo $this->url->link('seller/account-transaction', '', 'SSL'); ?>">Transactions</a></li>
    	<li><a href= "<?php echo $this->url->link('seller/account-withdrawal', '', 'SSL'); ?>">Payouts</a></li>
    	<li class="menuhead">Settings</li>
    	<li><a href= "<?php echo $this->url->link('seller/account-profile', '', 'SSL'); ?>">Settings</a></li>
    </ul>
    <div class="mm_dashboard">
      <?php if (isset($statustext) && ($statustext)) { ?>
        <div class="alert alert-<?php echo $statusclass; ?>"><?php echo $statustext; ?></div>
    <?php } ?>
    <h1><?php echo $ms_account_transactions_heading; ?></h1>
    <div class="mm_blocks">
			<div class="mm_dashboard_block">
				<div class="head">Your current balance</div>
				<a href=""><?php echo $ms_balance_formatted; ?></a> <span style="color: gray"><?php echo $ms_reserved_formatted; ?></span>
			</div>

			<div class="mm_dashboard_block">
				<div class="head">Your earnings to date</div>
				<a href=""><?php echo $ms_balance_formatted; ?></a> <span style="color: gray"><?php echo $ms_reserved_formatted; ?></span>
			</div>
	</div>
	<!-- BALANCE RECORDS -->
	<div class="mm_submead"><h3><?php echo $ms_account_transactions_records; ?></h3></div>
	<div class="mm_dashboard_table">
		<div class="subhead">
		<table>
			<thead>
			<tr>
				<td width="40px">#<input></input></td>
				<td width="100px">Amount<input></input></td>
				<td>Description<input></input></td>
				<td width="100px">Date created<input></input></td>
			</tr>
			</thead>
			<tr>
				<td>14</td>
				<td>$90</td>
				<td>Sale: HP LP3065 (-$0.00 commission)</td>
				<td>31/01/2015</td>
			</tr>
			<tr>
				<td>9</td>
				<td>$90</td>
				<td>Sale: HP LP3065 (-$0.00 commission)</td>
				<td>31/01/2015</td>
			</tr>
			<tr>
				<td>8</td>
				<td>$90</td>
				<td>Sale: HP LP3065 (-$0.00 commission)</td>
				<td>31/01/2015</td>
			</tr>
			<tr>
				<td>7</td>
				<td>$90</td>
				<td>Sale: iPhone (-$0.00 commission)</td>
				<td>31/01/2015</td>
			</tr>
			<tr>
				<td>5</td>
				<td>$90</td>
				<td>Sale: Canon EOS 5D (-$0.00 commission)</td>
				<td>31/01/2015</td>
			</tr>
		</table>
	</div>
	</div>

	<ul class="pagination"><li class="active"><span>1</span></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">2</a></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">&gt;</a></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">&gt;|</a></li></ul>
	
	<div class="cl"></div>

	<!-- PAYMENTS -->
	<div class="mm_submead"><h3><?php echo $ms_payment_payments; ?></h3></div>
	<div class="mm_dashboard_table">
		<div class="subhead">
		<table>
			<thead>
			<tr>
				<td>#</td>
				<td>Type</td>
				<td>Amount</td>
				<td>Description</td>
				<td>Status</td>
				<td>Date paid</td>
			</tr>
			</thead>
			<tr>
				<td colspan="6" class="mm_emtytaple">No data available in table</td>
			</tr>
		</table>
	</div></div>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>

<script>
$(function() {
	$('#list-transactions').dataTable( {
		"sAjaxSource": $('base').attr('href') + "index.php?route=seller/account-transaction/getTransactionData",
		"aoColumns": [
			{ "mData": "transaction_id" },
			{ "mData": "amount" },
			{ "mData": "description", "bSortable": false },
			{ "mData": "date_created" }
		],
        "aaSorting":  [[3,'desc']]
	});

	$('#list-payments').dataTable( {
		"sAjaxSource": $('base').attr('href') + "index.php?route=seller/account-transaction/getPaymentData",
		"aoColumns": [
			{ "mData": "payment_id" },
			{ "mData": "payment_type" },
			{ "mData": "amount" },
			{ "mData": "description", "bSortable": false },
			{ "mData": "payment_status" },
			{ "mData": "date_created" },
		],
        "aaSorting":  [[5,'desc']]
	});
});
</script>
</div>
<?php echo $footer; ?>