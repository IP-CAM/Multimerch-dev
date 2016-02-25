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
    <h1><?php echo $ms_account_products_heading; ?></h1>

	<div class="table-responsive">
	<table class="list table table-bordered table-hover" id="list-products">
	<thead>
	<tr>
		<td><?php echo $ms_account_products_image; ?></td>
		<td><?php echo $ms_account_products_product; ?></td>
		<td><?php echo $ms_account_product_price; ?></td>
		<td><?php echo $ms_account_products_sales; ?></td>
		<td><?php echo $ms_account_products_earnings; ?></td>
		<td><?php echo $ms_account_products_status; ?></td>
		<td><?php echo $ms_account_products_date; ?></td>
		<td><?php echo $ms_account_products_listing_until; ?></td>
		<td class="large"><?php echo $ms_account_products_action; ?></td>
	</tr>

	<tr class="filter">
		<td></td>
		<td><input type="text"/></td>
		<td><input type="text"/></td>
		<td><input type="text"/></td>
		<td><input type="text"/></td>
		<td></td>
		<td><input type="text"/></td>
		<td><input type="text"/></td>
		<td></td>
	</tr>
	</thead>
	<tbody></tbody>
	</table>
	</div>

	  <div class="buttons clearfix">
		<div class="pull-left"><a href="<?php echo $link_back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
		<div class="pull-right"><a href="<?php echo $link_create_product; ?>" class="btn btn-primary"><?php echo $ms_create_product; ?></a></div>
	  </div>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>

<script>
	$(function() {
		$('#list-products').dataTable( {
			"sAjaxSource": $('base').attr('href') + "index.php?route=seller/account-product/getTableData",
			"aoColumns": [
				{ "mData": "image" },
				{ "mData": "product_name" },
				{ "mData": "product_price" },
				{ "mData": "number_sold" },
				{ "mData": "product_earnings" },
				{ "mData": "product_status" },
				{ "mData": "date_added" },
				{ "mData": "list_until" },
				{ "mData": "actions", "bSortable": false, "sClass": "text-right" }
			]
		});
	
		$(document).on('click', '.ms-button-delete', function() {
			if (!confirm('<?php echo $ms_account_products_confirmdelete; ?>')) return false;
		});
	});
</script>
<?php echo $footer; ?>