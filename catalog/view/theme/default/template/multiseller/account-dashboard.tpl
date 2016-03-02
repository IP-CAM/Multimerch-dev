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
		<h1>Dashboard</h1>
			<div class="mm_boards">
			<div class="mm_dashboard_block">
				<div class="head">Orders</div>
				<a href="">1,952</a>
				<p>190 in this month</p>
			</div>
			<div class="mm_dashboard_block">
				<div class="head">Revenue</div>
				<a href="">$551.00</a>
				<p>$80.00 in this month</p>
				<dl class="mm_dashboard_block_sub">
					  <dt>Listing fee</dt>
					  <dd>$3.15  <u>&nbsp;&nbsp;+&nbsp;&nbsp;5.00%</u></dd>
					  <dt>Sales fee</dt>
					  <dd>$0.00  <u>&nbsp;&nbsp;+&nbsp;&nbsp;0.00%</u></dd>
				</dl>
			</div>
			<div class="mm_dashboard_block">
				<div class="head">Views</div>
				<a href="">1,952</a>
				<p>190 in this month</p>
			</div>
			</div>
		<div class="mm_submead"><h3>Last Orders</h3><a class="mm_view" href="">View all orders</a></div>
		<div class="mm_dashboard_table">
		<div class="subhead">
		<table>
			<thead>
				<td width="25%">Customer</td>
				<td>Date created</td>
				<td width="35%">Products</td>
				<td>Status</td>
				<td>Total amount</td>
			</thead>
			<tr>
				<td>Ignacio Duarte</td>
				<td>31/01/2015</td>
				<td class="mm_table_product">
					<dl>
				 	<dt><a href="">HP LP3065</a></dt>
				   	<dd>$100.00</dd>
					</dl>
				</td>
				<td><div class="mm_complete">Complete</div></td>
				<td>$100.00</td>
			</tr>
			<tr>
				<td>Julie Chabin</td>
				<td>30/01/2015</td>
				<td class="mm_table_product">
					<dl>
				 	<dt><a href="">HP LP3065</a></dt>
				   	<dd>$100.00</dd>
				   	<dt><a href="">Dell</a></dt>
				   	<dd>$100.00</dd>
				   	<dt><a href="">Galaxy Tab</a></dt>
				   	<dd>$100.00</dd>
					</dl>
				</td>
				<td><div class="mm_complete">Complete</td>
				<td>$100.00</td>
			</tr>
			<tr>
				<td>Rez Khan</td>
				<td>04/02/2016</td>
				<td class="mm_table_product">
					<dl>
				 	<dt><a href="">iPhone 5</a></dt>
				   	<dd>$400.00</dd>
				   	<dt><a href="">Apple Cinema</a></dt>
				   	<dd>$1200.00</dd>
				   	<dt><a href="">Android</a></dt>
				   	<dd>$100.00</dd>
					</dl>
				</td>
				<td><div class="mm_complete">Complete</div></td>
				<td>$80.00</td>
			</tr>
			<tr>
				<td>Julie Chabin</td>
				<td>30/01/2015</td>
				<td class="mm_table_product">
					<dl>
				 	<dt><a href="">HP LP3065</a></dt>
				   	<dd>$100.00</dd>
				   	<dt><a href="">Lenovo</a></dt>
				   	<dd>$100.00</dd>
				   	<dt><a href="">Mouse Acer</a></dt>
				   	<dd>$100.00</dd>
					</dl>
				</td>
				<td><div class="mm_complete">Complete</div></td>
				<td>$100.00</td>
			</tr>
	</table>
	</div>
	</div>

	</div></div>
    
</div></div>
      <?php echo $content_bottom; ?></div>

<?php echo $footer; ?>
