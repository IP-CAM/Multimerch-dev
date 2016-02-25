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
			<div>
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
			<tr>
				<td>Customer</td>
				<td>Date created</td>
				<td>Products</td>
				<td>Status</td>
				<td>Total amount</td>
			</tr>
			<tr>
				<td>Ignacio Duarte</td>
				<td>31/01/2015</td>
				<td class="mm_table_product"><a href="">HP LP3065</a><div></div>$100.00</td>
				<td class="mm_complete">Complete</td>
				<td>$100.00</td>
			</tr>
			<tr>
				<td>Julie Chabin</td>
				<td>30/01/2015</td>
				<td><a href="">HP LP3065</a><div></div>$100.00</td>
				<td class="mm_complete">Complete</td>
				<td>$100.00</td>
			</tr>
			<tr>
				<td>Rez Khan</td>
				<td>04/02/2016</td>
				<td><a href="">iPhone</a><div></div>$80.00
				<a href="">iPhone</a><div></div>$80.00
				<a href="">iPhone</a><div></div>$80.00</td>
				<td class="mm_complete">Complete</td>
				<td>$80.00</td>
			</tr>
			<tr>
				<td>Julie Chabin</td>
				<td>30/01/2015</td>
				<td><a href="">HP LP3065</a><div></div>$100.00</td>
				<td class="mm_complete">Complete</td>
				<td>$100.00</td>
			</tr>
	</table>
	</div>
	</div>
	<div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $link_back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
      </div>
	</div></div>
    
</div></div>
      <?php echo $content_bottom; ?></div>

<?php echo $footer; ?>
