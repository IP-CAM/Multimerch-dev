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
				<td><?php echo $ms_account_orders_id; ?></td>
				<?php if (!$this->config->get('msconf_hide_customer_email')) { ?>
					<td><?php echo $ms_account_orders_customer; ?></td>
				<?php } ?>
				<td><?php echo $ms_status; ?></td>
				<td><?php echo $ms_account_orders_products; ?></td>
				<td><?php echo $ms_date_created; ?></td>
				<td><?php echo $ms_account_orders_total; ?></td>
				<td><?php echo $ms_action; ?></td>
			</tr>
		
			<?php if (isset($orders) && $orders) { ?>
			<?php foreach ($orders as $order) { ?>
			<tr>
				<td><?php echo $order['order_id']; ?></td>
				<?php if (!$this->config->get('msconf_hide_customer_email')) { ?>
					<td><?php echo $order['customer']; ?></td>
				<?php } ?>
				<td><?php echo $order['status']; ?></td>
				<td class="left products">
				<?php foreach ($order['products'] as $p) { ?>
				<p>
					<span class="name"><?php if ($p['quantity'] > 1) { echo "{$p['quantity']} x "; } ?> <a href="<?php echo $this->url->link('product/product', 'product_id=' . $p['product_id'], 'SSL'); ?>"><?php echo $p['name']; ?></a></span>
                    <?php foreach ($p['options'] as $option) { ?>
                    <br />
                    &nbsp;<small> - <?php echo $option['name']; ?>:<?php echo $option['value']; ?></small>
                    <?php } ?>
                    <span class="total"><?php echo $this->currency->format($p['seller_net_amt'], $this->config->get('config_currency')); ?></span>
				</p>
				<?php } ?>
				</td>
				<td><?php echo $order['date_created']; ?></td>
				<td><?php echo $order['total']; ?></td>
				<td>
					<a href="<?php echo $this->url->link('seller/account-order/viewOrder', 'order_id=' . $order['order_id']); ?>" class="ms-button ms-button-view" title="<?php echo $this->language->get('ms_view_modify') ?>"></a>
				</td>
			</tr>
			<?php } ?>
		<?php } else { ?>
			<tr>
				<td colspan="6" class="nothing"><?php echo $ms_account_orders_noorders; ?></td>
			</tr>
		<?php } ?>
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
