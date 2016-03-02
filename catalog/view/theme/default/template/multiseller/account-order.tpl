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
    	<li class="active">Dashboard</li>
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

		<h1><?php echo $ms_account_orders_heading; ?></h1>
		<div class="mm_dashboard_table">
		<div class="subhead">
		<table>
			<thead>
			<tr>
				<td width="40px">#<input></input></td>
				<td>Customer<input></input></td>
				<td width="100px">Status</td>
				<td>Products<input></input></td>
				<td width="100px">Date created<input></input></td>
				<td width="100px">Total amount</td>
				<td width="50px">Action</td>
			</tr>
			</thead>
			<tr>
				<td>14</td>
				<td>Ignacio Duarte<a class="mm_emailcustomer" href="">vendor4@example.com</a></td>
				<td><div class="mm_complete">Complete</div></td>
				<td><a href="">HP LP3065</a></td>
				<td>31/10/2015</td>
				<td>$100.00</td>
				<td><a href="" class="table_search"></a></td>
			</tr>
			<tr>
				<td>7</td>
				<td>Ignacio Duarte<a class="mm_emailcustomer" href="">vendor4@example.com</a></td>
				<td><div class="mm_complete">Complete</div></td>
				<td><a href="">HP LP3065</a></td>
				<td>31/10/2015</td>
				<td>$100.00</td>
				<td><a href="" class="table_search"></a></td>
			</tr>
			<tr>
				<td>6</td>
				<td>Ignacio Duarte<a class="mm_emailcustomer" href="">vendor4@example.com</a></td>
				<td><div class="mm_complete">Complete</div></td>
				<td><a href="">HP LP3065</a></td>
				<td>31/10/2015</td>
				<td>$100.00</td>
				<td><a href="" class="table_delete"></a></td>
			</tr>
			<tr>
				<td>5</td>
				<td>Ignacio Duarte<a class="mm_emailcustomer" href="">vendor4@example.com</a></td>
				<td><div class="mm_complete">Complete</div></td>
				<td><a href="">HP LP3065</a></td>
				<td>31/10/2015</td>
				<td>$100.00</td>
				<td><a href="" class="table_search"></a></td>
			</tr>
			<tr>
				<td>3</td>
				<td>Ignacio Duarte<a class="mm_emailcustomer" href="">vendor4@example.com</a></td>
				<td><div class="mm_complete">Complete</div></td>
				<td><a href="">HP LP3065</a></td>
				<td>31/10/2015</td>
				<td>$100.00</td>
				<td><a href="" class="table_search"></a></td>
			</tr>
		</table>
		</div>
	</div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script>
	$(function() {
		$('#list-orders').dataTable( {
			"sAjaxSource": $('base').attr('href') + "index.php?route=seller/account-order/getTableData",
			"aoColumns": [
				{ "mData": "order_id" },
				{ "mData": "customer_name" },
				{ "mData": "suborder_status", "bSortable": false },
				{ "mData": "products", "bSortable": false, "sClass": "products" },
				{ "mData": "date_created" },
				{ "mData": "total_amount" },
				{ "mData": "view_order" }
			],
			"aaSorting":  [[4,'desc']]
		});
	});
</script>

</div>
<?php echo $footer; ?>