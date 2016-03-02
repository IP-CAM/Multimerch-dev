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

    <h1><?php echo $ms_account_sellerinfo_heading; ?></h1>
    <div class="tab-content">
    <fieldset>
		<input type="hidden" name="action" id="ms_action" />
		<!-- todo status check update -->
		<?php if ($seller['ms.seller_status'] == MsSeller::STATUS_DISABLED || $seller['ms.seller_status'] == MsSeller::STATUS_DELETED) { ?>
		<div class="ms-overlay"></div>
		<?php } ?>

		<div class="form-group required">
			<?php if (!$this->config->get('msconf_change_seller_nickname') && !empty($seller['ms.nickname'])) { ?>
				<label class="mm_label mm_req"><?php echo $ms_account_sellerinfo_nickname; ?></label>
				<div class="mm_form">
					<b><?php echo $seller['ms.nickname']; ?></b>
				</div>
			<?php } else { ?>
				<label class="mm_label mm_req"><?php echo $ms_account_sellerinfo_nickname; ?></label>
				<div class="mm_form">
					<input type="text" class="form-control"  name="seller[nickname]" value="<?php echo $seller['ms.nickname']; ?>" />
					<p class="ms-note"><?php echo $ms_account_sellerinfo_nickname_note; ?></p>
				</div>
			<?php } ?>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_description; ?></label>
			<div class="mm_form">
				<!-- todo strip tags if rte disabled -->
				<textarea name="seller[description]" id="seller_textarea" class="form-control <?php echo $this->config->get('msconf_enable_rte') ? 'ckeditor' : ''; ?>"><?php echo $this->config->get('msconf_enable_rte') ? htmlspecialchars_decode($seller['ms.description']) : strip_tags(htmlspecialchars_decode($seller['ms.description'])); ?></textarea>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_description_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_company; ?></label>
			<div class="mm_form">
				<input type="text" class="form-control"  name="seller[company]" value="<?php echo $seller['ms.company']; ?>" />
				<p class="ms-note"><?php echo $ms_account_sellerinfo_company_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_country; ?></label>
			<div class="mm_form">
				<select name="seller[country]" class="form-control">
					<option value="" selected="selected"><?php echo $ms_account_sellerinfo_country_dont_display; ?></option>
					<?php foreach ($countries as $country) { ?>
					<option value="<?php echo $country['country_id']; ?>" <?php if ($seller['ms.country_id'] == $country['country_id'] || $country_id == $country['country_id']) { ?>selected="selected"<?php } ?>><?php echo $country['name']; ?></option>
					<?php } ?>
				</select>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_country_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_zone; ?></label>
			<div class="mm_form">
				<select name="seller[zone]" class="form-control"></select>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_zone_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_paypal; ?></label>
			<div class="mm_form">
				<input type="text" class="form-control"  name="seller[paypal]" value="<?php echo $seller['ms.paypal']; ?>" />
				<p class="ms-note"><?php echo $ms_account_sellerinfo_paypal_note; ?></p>
			</div>
		</div>

		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_avatar; ?></label>
			<div class="mm_form">
				<div class="dragndropmini">
            	<u>Drag & Drop your images here</u>
            	</div>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_avatar_note; ?></p>
				<p class="error" id="error_sellerinfo_avatar"></p>

				<div id="sellerinfo_avatar_files">
				<?php if (!empty($seller['avatar'])) { ?>
					<div class="ms-image">
						<input type="hidden" name="seller[avatar_name]" value="<?php echo $seller['avatar']['name']; ?>" />
						<img src="<?php echo $seller['avatar']['thumb']; ?>" />
						<span class="ms-remove"></span>
					</div>
				<?php } ?>
				</div>
			</div>
		</div>

		<?php if ($this->config->get('msconf_enable_seller_banner')) { ?>
		<div class="form-group">
			<label class="mm_label"><?php echo $ms_account_sellerinfo_banner; ?></label>
			<div class="mm_form">
				<div class="dragndropmini">
            	<u>Drag & Drop your images here</u>
            	</div>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_banner_note; ?></p>
				<p class="error" id="error_sellerinfo_banner"></p>

				<div id="sellerinfo_banner_files">
				<?php if (!empty($seller['banner'])) { ?>
					<div class="ms-image">
						<input type="hidden" name="seller[banner_name]" value="<?php echo $seller['banner']['name']; ?>" />
						<img src="<?php echo $seller['banner']['thumb']; ?>" />
						<span class="ms-remove"></span>
					</div>
				<?php } ?>
				</div>
			</div>
		</div>
		<?php } ?>

		<?php if ($ms_account_sellerinfo_terms_note) { ?>
		<div class="form-group required">
			<label class="mm_label mm_req"><?php echo $ms_account_sellerinfo_terms; ?></label>
			<div class="col-sm-10">
				<p style="margin-bottom: 0">
					<input type="checkbox" name="seller[terms]" value="1" />
					<?php echo $ms_account_sellerinfo_terms_note; ?>
				</p>
			</div>
		</div>
		<?php } ?>

		<?php if ((!isset($seller['seller_id']) || $seller['ms.seller_status'] == MsSeller::STATUS_INCOMPLETE) && $seller_validation != MsSeller::MS_SELLER_VALIDATION_NONE) { ?>
		<div class="form-group">
			<label class="mm_label mm_req"><?php echo $ms_account_sellerinfo_reviewer_message; ?></label>
			<div class="col-sm-10">
				<textarea name="seller[reviewer_message]" id="message_textarea" class="form-control"></textarea>
				<p class="ms-note"><?php echo $ms_account_sellerinfo_reviewer_message_note; ?></p>
			</div>
		</div>
		<?php } ?>

		<?php if (isset($group_commissions) && $group_commissions[MsCommission::RATE_SIGNUP]['flat'] > 0) { ?>
			<p class="alert alert-warning ms-commission">
				<?php echo sprintf($this->language->get('ms_account_sellerinfo_fee_flat'),$this->currency->format($group_commissions[MsCommission::RATE_SIGNUP]['flat'], $this->config->get('config_currency')), $this->config->get('config_name')); ?>
				<?php echo $ms_commission_payment_type; ?>
			</p>

			<?php if(isset($payment_form)) { ?><div class="ms-payment-form"><?php echo $payment_form; ?></div><?php } ?>
		<?php } ?>
		</fieldset></div>
		<div class="buttons">
			<div class="pull-left"><a href="<?php echo $back; ?>"><span><?php echo $ms_button_cancel; ?></span></a></div>
			<?php if ($seller['ms.seller_status'] != MsSeller::STATUS_DISABLED && $seller['ms.seller_status'] != MsSeller::STATUS_DELETED && $seller['ms.seller_status'] != MsSeller::STATUS_INCOMPLETE) { ?>
			<div class="pull-right"><a class="btn btn-primary" id="ms-submit-button"><span><?php echo $ms_button_submit; ?></span></a></div>
			<?php } ?>
		</div>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>


<?php $timestamp = time(); ?>
<script>
	var msGlobals = {
		timestamp: '<?php echo $timestamp; ?>',
		token : '<?php echo md5($salt . $timestamp); ?>',
		session_id: '<?php echo session_id(); ?>',
		zone_id: '<?php echo $seller['ms.zone_id'] ?>',
		uploadError: '<?php echo htmlspecialchars($ms_error_file_upload_error, ENT_QUOTES, "UTF-8"); ?>',
		formError: '<?php echo htmlspecialchars($ms_error_form_submit_error, ENT_QUOTES, "UTF-8"); ?>',
		config_enable_rte: '<?php echo $this->config->get('msconf_enable_rte'); ?>',
		zoneSelectError: '<?php echo htmlspecialchars($ms_account_sellerinfo_zone_select, ENT_QUOTES, "UTF-8"); ?>',
		zoneNotSelectedError: '<?php echo htmlspecialchars($ms_account_sellerinfo_zone_not_selected, ENT_QUOTES, "UTF-8"); ?>'
	};
</script>
</div></div>
<?php echo $footer; ?>