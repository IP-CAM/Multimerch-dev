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
	<div class="mm_dashboard_table">
		<div class="subhead">
		<table>
			<tr>
				<td>Product</td>
				<td>Price</td>
				<td>Sales</td>
				<td>Earnings</td>
				<td>Action</td>
			</tr>
			<tr>
				<td><img width="46px" height="46px" src="image/catalog/demo/canon_eos_5d_2.jpg">Apple Cinema 30”</td>
				<td> <strike>$100.00</strike> $90</td>
				<td>1</td>
				<td>$100.00</td>
				<td><a href="" class="table_search"></a><a href="" class="table_minus"></a><a href="" class="table_edit"></a><a href="" class="table_delete"></a></td>
			</tr>
		</table>
	</div>
	</div>
	<div class="table-responsive">
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
</script></div>
<?php echo $footer; ?>