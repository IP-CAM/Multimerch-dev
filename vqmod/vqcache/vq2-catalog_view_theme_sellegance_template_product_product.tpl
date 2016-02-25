<?php echo $header; ?>
<div class="centralbox">
		<div class="container">
			<div class="container-inner">

<?php global $config; global $language; ?>

<?php echo $content_top; ?>

	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>

	<header class="page-header">
		<h1><?php echo $heading_title; ?></h1>
	</header>

	<?php 

	$language->load('module/sellegance');
	
	if ($column_left && $column_right) { 
		$main = "col-sm-6 middle sideleft"; }
	else if ($column_left || $column_right) { 
		$main = "col-sm-9"; 
		if($column_left) $main.=" sideleft"; else $main.= " sideright";
	} 
	else { $main = "col-sm-12"; } 

	?>

	<div class="row">

		<?php echo $column_left; ?>

		<div id="content" class="product-page <?php echo $main; ?>" role="main">

			<div class="mainborder">

				<!-- PREVNEXT BUTTONS PLACEHOLDER -->

				<div class="prevnext clearfix">
					<ul class="pager">
						<li>
							<?php if (isset($prev_url)) { ?>
							<a href="<?php echo $prev_url; ?>" rel="tooltip" title="<?php echo $prev_title;?>" class="tooltp">
								<i class="fa fa-angle-left"></i>
							</a>
						<?php } ?>
					</li>
						<li>
							<?php if (isset($next_url)) { ?>
							<a href="<?php echo $next_url; ?>" rel="tooltip" title="<?php echo $next_title;?>" class="tooltp">
								<i class="fa fa-angle-right"></i>
							</a>
						<?php } ?>
					</li>
					</ul>
				</div>
			

				<div class="row">

					<div class="col-sm-6 leftcol">

						<?php if ($thumb || $images) { ?>

						<?php $product_carousel=1; ?>

							<?php if ($thumb) { ?>

								<div class="image">

									<?php if ($price && $special) { ?>
									<span class="onsale"><?php echo $language->get('text_onsale'); ?></span>
									<?php } ?>

									<?php $arrimages=array_filter($images); ?>

									<?php if($config->get('sellegance_cloud_zoom') == 1) {

										if($config->get('sellegance_zoom_autosize') == 1) {
											$zwidth = 'auto';
											$zheight = 'auto';
										} else {
											$zwidth = $config->get('sellegance_zoom_width');
											$zheight = $config->get('sellegance_zoom_height');
										}
										?>

										<!-- image zoom  -->

										<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom" id="image" rel="adjustX: 10, adjustY:-4, tint:false,lensOpacity:0.4, zoomWidth:'<?php echo $zwidth ?>', zoomHeight:'<?php echo $zheight; ?>', position:'<?php echo $config->get('sellegance_zoom_position'); ?>', showTitle:false"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>

										<a href="<?php echo $popup; ?>"id="zoom-image" title=" <?php echo $heading_title; ?>" class="magnificPopup expand" rel="magnificPopup"><i class="fa fa-expand"></i></a>

									<?php } else if($product_carousel==1 && !empty($arrimages)) { ?>

											<div id="sync1" class="owl-carousel">

												<div class="item">
													<img src="<?php echo $thumb; ?>" id="image"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
														<a href="<?php echo $popup; ?>" title=" <?php echo $heading_title; ?>" class="magnificPopup expand" rel="magnificPopup"><span><i class="fa fa-expand"></i></span></a>
												</div>

												<?php foreach ($images as $image) { ?>
												<div class="item">
													<img src="<?php echo $image['thumb']; ?>">
													<a href="<?php echo $image['popup']; ?>" title=" <?php echo $heading_title; ?>" class="magnificPopup expand" rel="magnificPopup"><i class="fa fa-expand"></i></a>
												</div>
												<?php } ?>

											</div>

									<?php } else { ?>

										<img src="<?php echo $thumb; ?>" id="image"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />

										<a href="<?php echo $popup; ?>"id="zoom-image" title=" <?php echo $heading_title; ?>" class="magnificPopup expand" rel="magnificPopup"><i class="fa fa-expand"></i></a>

									<?php } ?>

								</div>

							<?php } ?>

							<?php if ($images) { ?>

								<div id="sync2" class="owl-carousel image-additional">

								<?php if($product_carousel==1 && $config->get('sellegance_cloud_zoom')!=1) { ?>

									<div class="item"><img src="<?php echo $small; ?>" /></div>

									<?php foreach ($images as $image) { ?>
									<div class="item">
										<img src="<?php echo $image['small']; ?>">
									</div>
									<?php } ?>

								<?php } else { ?>

									<?php if($config->get('sellegance_cloud_zoom') == 1) { ?>

										<div class="item"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'image', smallImage: '<?php echo $thumb; ?>' "><img src="<?php echo $small; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>

									<?php } ?>

									<?php foreach ($images as $image) { ?>

										<?php if($config->get('sellegance_cloud_zoom') == 1) { ?>

											<div class="item"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="cloud-zoom-gallery" rel="useZoom: 'image', smallImage: '<?php echo $image['thumb']; ?>' "><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a><a href="<?php echo $image['popup']; ?>" class="magnificPopup" style="display:none" rel="magnificPopup"></a></div>

										<?php } else {

											if($image['small']) { ?>

												<div class="item"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="magnificPopup" rel="magnificPopup"><img src="<?php echo $image['small']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>

											<?php } else { ?>

												<div class="item"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="magnificPopup" rel="magnificPopup"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></div>

											<?php } ?>

										<?php } ?>

									<?php } ?>

								<?php } ?> <!-- $product-carousel -->

								</div> <!-- #sync2 -->

								<?php if($product_carousel==1 && $config->get('sellegance_cloud_zoom')!=1) { ?>

									<script type="text/javascript">
										$(document).ready(function() {
										 
											var sync1 = $("#sync1");
											var sync2 = $("#sync2");
										 
											sync1.owlCarousel({
												singleItem : true,
												slideSpeed : 1000,
												navigation: true,
												navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
												pagination:false,
												afterAction : syncPosition,
												responsiveRefreshRate : 200,
											});
										 
											sync2.owlCarousel({
												items : 5,
												itemsDesktop      : [1199,4],
												itemsDesktopSmall     : [979,3],
												itemsTablet       : [768,3],
												itemsMobile       : [479,3],
												pagination:false,
												navigation: true,
												navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
												responsiveRefreshRate : 100,
												afterInit : function(el){
													el.find(".owl-item").eq(0).addClass("synced");
												}
											});
										 
											function syncPosition(el){
												var current = this.currentItem;
												$("#sync2")
													.find(".owl-item")
													.removeClass("synced")
													.eq(current)
													.addClass("synced")
												if($("#sync2").data("owlCarousel") !== undefined){
													center(current)
												}
											}
										 
											$("#sync2").on("click", ".owl-item", function(e){
												e.preventDefault();
												var number = $(this).data("owlItem");
												sync1.trigger("owl.goTo",number);
											});
										 
											function center(number){
												var sync2visible = sync2.data("owlCarousel").owl.visibleItems;
												var num = number;
												var found = false;
												for(var i in sync2visible){
													if(num === sync2visible[i]){
														var found = true;
													}
												}
										 
												if(found===false){
													if(num>sync2visible[sync2visible.length-1]){
														sync2.trigger("owl.goTo", num - sync2visible.length+2)
													}else{
														if(num - 1 === -1){
															num = 0;
														}
														sync2.trigger("owl.goTo", num);
													}
												} else if(num === sync2visible[sync2visible.length-1]){
													sync2.trigger("owl.goTo", sync2visible[1])
												} else if(num === sync2visible[0]){
													sync2.trigger("owl.goTo", num-1)
												}
												
											}
										 
										});
									</script>

								<?php } else { ?>

									<script type="text/javascript">

										$(document).ready(function() {

											$('#sync2').owlCarousel({
												items : 5,
												itemsDesktop      : [1199,4],
												itemsDesktopSmall     : [979,3],
												itemsTablet       : [768,3],
												itemsMobile       : [479,3],
												pagination:false,
												navigation: true,
												navigationText: ['<i class="fa fa-angle-left fa-5x"></i>', '<i class="fa fa-angle-right fa-5x"></i>'],
												responsiveRefreshRate : 100,
												afterInit : function(el){
													el.find(".owl-item").eq(0).addClass("synced");
												}
											});

											$("#sync2").on("mouseover", ".owl-item", function(e){
												e.preventDefault();
												var current = $(this).data("owlItem");
												$("#sync2")
													.find(".owl-item")
													.removeClass("synced")
													.eq(current)
													.addClass("synced")
											});

										});

									</script>

								<?php } ?>

							<?php } ?> <!-- $images -->

						<?php } ?> <!-- $thumb || $images -->
					
					</div> <!-- .span6 LEFT BOX-->


					<div class="col-sm-6 rightcol">
						
						<?php if ($price) { ?>

						<div class="price">

							<?php if (!$special) { ?>
								<span class="price-normal"><?php echo $price; ?></span>
							<?php } else { ?>
								<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
							<?php } ?>

							<?php if ($tax) { ?>
								<div class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></div>
							<?php } ?>

							<?php if ($points) { ?>
								<div class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></div>
							<?php } ?>

							<?php if ($discounts) { ?>
							<div class="discount">
								<ul>
								<?php foreach ($discounts as $discount) { ?>
									<li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
								<?php } ?>
								</ul>
							</div>
							<?php } ?>

							<div class="stock">
			<?php if ($quantity <= 0) { ?>
			<span class="outstock"><i class="fa fa-times"></i> <?php echo $stock; ?></span>
			<?php } else { ?>
			<span class="instock"><i class="fa fa-check"></i> <?php echo $stock; ?></span>
			<?php } ?>
			</div>

						</div> <!-- .price -->

						<?php } ?>


						<div class="description">

							<?php if ($manufacturer) { ?>
								<span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
							<?php } ?>
							
							<span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
							<?php if ($reward) { ?>
							<span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
							<?php } ?>

						</div> <!-- .description -->

						<div id="product">

							<?php if ($options) { ?>
							<hr>
							<?php foreach ($options as $option) { ?>
							<?php if ($option['type'] == 'select') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
								<option value=""><?php echo $text_select; ?></option>
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								<?php if ($option_value['price']) { ?>
								(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
								<?php } ?>
								</option>
								<?php } ?>
								</select>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'radio') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									<?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
									</label>
								</div>
								<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'checkbox') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="checkbox">
									<label>
									<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									<?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
									</label>
								</div>
								<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'image') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<div id="input-option<?php echo $option['product_option_id']; ?>">
								<?php foreach ($option['product_option_value'] as $option_value) { ?>
								<div class="radio">
									<label>
									<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
									<img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
									<?php if ($option_value['price']) { ?>
									(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
									<?php } ?>
									</label>
								</div>
								<?php } ?>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'text') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'textarea') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'file') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label"><?php echo $option['name']; ?></label>
								<button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
								<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'date') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group date">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'datetime') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group datetime">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php if ($option['type'] == 'time') { ?>
							<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
								<label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
								<div class="input-group time">
									<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
									<span class="input-group-btn">
										<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
									</span>
								</div>
							</div>
							<?php } ?>
							<?php } ?>
							<?php } ?>

							<div class="cart">

								<?php if ($recurrings) { ?>
									<h3><?php echo $text_payment_recurring ?></h3>
									<div class="form-group required">
										<select name="recurring_id" class="form-control">
											<option value=""><?php echo $text_select; ?></option>
											<?php foreach ($recurrings as $recurring) { ?>
											<option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
											<?php } ?>
										</select>
										<div class="help-block" id="recurring-description"></div>
									</div>
								<?php } ?>

								<div>
									<div class="input-qty">
										<div class="qty-minus" onclick="if ($(this).parent('.input-qty').find('#qty-input').val()>1) { $(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())-1); }">-</div>
											<div class="qty-input-div">
												<input id="qty-input"  type="text" name="quantity" value="<?php echo $minimum; ?>" class="form-control input-sm" />
											</div>
										<div class="qty-plus" onclick="$(this).parent('.input-qty').find('#qty-input').val(parseInt($(this).parent('.input-qty').find('#qty-input').val())+1);">+</div>
									</div>
									
									<input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

									<button type="button" 
			id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-cart <?php if ($quantity <= 0) { echo 'disabled" disabled="disabled'; } ?>" 
			><?php echo $button_cart; ?></button>

									<button type="button" data-toggle="tooltip" class="btn btn-default btn-lg wishlist" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart-o"></i></button>
									<button type="button" data-toggle="tooltip" class="btn btn-default btn-lg compare" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>

									<?php if ($minimum > 1) { ?>
										<small class="minimum"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></small>
									<?php } ?>
								</div>

							</div> <!-- .cart -->

						</div>
								
						<?php if ($review_status) { ?>

							<div class="review">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($rating < $i) { ?>
								<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
								<?php } else { ?>
								<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
								<?php } ?>
								<?php } ?>
								<a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;" class="btn btn-default btn-xs"><?php echo $text_write; ?></a>
							</div>

						<?php } ?>

						<?php if ($tags) { ?>
							<div class="tags">								
								<?php foreach ($tags as $tag) { ?>
									<a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
								<?php } ?>
							</div>
						<?php } ?>

						<div class="share">

							<?php $url = urlencode($config->get('config_url')."index.php?route=product/product&product_id=".$product_id); ?>

							<ul>
								<li><a href="http://www.facebook.com/sharer.php?u=<?php echo $url; ?>" target="_blank" title="Facebook" class="facebook" data-toggle="tooltip"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://twitter.com/share?url=<?php echo $url; ?>" target="_blank" title="Twitter" class="twitter" data-toggle="tooltip"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://plus.google.com/share?url=<?php echo $url; ?>" target="_blank" title="Google +" class="google-plus" data-toggle="tooltip" onclick="javascript:window.open(this.href,
										'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');return false;" ><i class="fa fa-google-plus"></i></a></li>
								<li><a href="//pinterest.com/pin/create/button/?url=<?php echo $url; ?>&<?php if ($thumb) {?>media=<?php echo $thumb; ?>&<?php } ?>description=<?php echo strip_tags($heading_title); ?>" target="_blank" title="Pinterest" class="pinterest" data-toggle="tooltip"><i class="fa fa-pinterest"></i></a></li>
								<li><a href="mailto:enteryour@addresshere.com?subject=<?php echo strip_tags($heading_title); ?>&body=<?php echo $config->get('config_url'); ?>index.php?route=product/product&product_id=<?php echo $product_id; ?>" class="envelope"  title="<?php echo $language->get('text_email_friend'); ?>" data-toggle="tooltip"><i class="fa fa-envelope"></i></a></li>
								<li><a href="<?php echo $config->get('config_url'); ?>index.php?route=product/product&product_id=<?php echo $product_id; ?>" class="link"  title="<?php echo $language->get('text_get_link'); ?>" data-toggle="tooltip"><i class="fa fa-link"></i></a></li>
							</ul>

						</div>

						<?php if($config->get('sellegance_product_details_layout') == 'accordion') { ?>

						<div id="full-info" class="clearfix">

							<div class="panel-group" id="product-details" role="tablist">

								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-description"><?php echo $tab_description; ?> <span class="expand"></span></a></h4>
										</div>
								<div id="tab-description" class="panel-collapse collapse in" role="tabpanel">
									<div class="panel-body">
										<?php echo $description; ?>
									</div>
								</div>
								</div>

								<?php if ($attribute_groups) { ?>
								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-attribute"><?php echo $tab_attribute; ?> <span class="expand"></span></a></h4>
								</div>
								<div id="tab-attribute" class="panel-collapse collapse" role="tabpanel">
									<div class="panel-body">
									<table class="table table-bordered attribute">
										<?php foreach ($attribute_groups as $attribute_group) { ?>
										<thead>
											<tr>
												<td colspan="2"><?php echo $attribute_group['name']; ?></td>
											</tr>
										</thead>
										<tbody>
											<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
											<tr>
												<th><?php echo $attribute['name']; ?></th>
												<td><?php echo $attribute['text']; ?></td>
											</tr>
											<?php } ?>
										</tbody>
										<?php } ?>
									</table>
									</div>
								</div>
								</div>
								<?php } ?>

								<?php if ($review_status) { ?>
								<div class="panel panel-default">
								<div class="panel-heading" role="tab">
									<h4 class="panel-title"><a class="accordion-toggle" data-toggle="collapse" data-parent="#product-details" href="#tab-review"><?php echo $tab_review; ?> <span class="expand"></span></a></h4>
								</div>
								<div id="tab-review" class="panel-collapse collapse" role="tabpanel">
									<div class="panel-body">
										<div id="list-reviews">
											<div id="review"></div>
										</div>
										
										<div id="add-review">

											<form id="form-review" class="form">

												<div class="contentset center" id="review-title">
													<h4 class="inner"><span><?php echo $text_write; ?></span></h4>
												</div>

												<?php if ($review_guest) { ?>

												<div class="form-group required">
													<label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
													<input type="text" name="name" value="" id="input-name" class="form-control" />
												</div>
												<div class="form-group required">
													<label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
													<div>
														<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
														<div class="help-block"><?php echo $text_note; ?></div>
													</div>
												</div>
												<div class="form-group required">
													<label class="control-label"><?php echo $entry_rating; ?></label>
													&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
													<input type="radio" name="rating" value="1" />
													&nbsp;
													<input type="radio" name="rating" value="2" />
													&nbsp;
													<input type="radio" name="rating" value="3" />
													&nbsp;
													<input type="radio" name="rating" value="4" />
													&nbsp;
													<input type="radio" name="rating" value="5" />
													&nbsp;<?php echo $entry_good; ?>
												</div>
												<?php echo $captcha; ?>
												<div class="buttons">
													<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
												</div>

												<?php } else { ?>
													<?php echo $text_login; ?>
												<?php } ?>

											</form> <!-- #form-review -->

										</div> <!-- #add-review -->
									</div>
								</div>
								</div>
								<?php } ?>

							</div>

						</div>

						<?php } ?>

					</div> <!-- .span6 RIGHT BOX-->

				</div>
				
				 <?php if($config->get('sellegance_product_details_layout') == 'tabs') { ?>

				 <div id="full-info" class="clearfix">

					<ul id="tabs" class="nav nav-pills">
						<li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
						<?php if ($attribute_groups) { ?>
						<li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
						<?php } ?>
						<?php if ($review_status) { ?>
						<li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
						<?php } ?>
					</ul> <!-- #tabs -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="tab-description"><?php echo $description; ?></div> <!-- #tab-description -->
						<?php if ($attribute_groups) { ?>
							<div class="tab-pane fade" id="tab-specification">
								<div class="product-atrributes">
														
									<table class="table table-striped specification">

										<?php foreach ($attribute_groups as $attribute_group) { ?>

										<thead>
											<tr>
												<td colspan="2"><?php echo $attribute_group['name']; ?></td>
											</tr>
										</thead>

										<tbody>
											<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
											<tr>
												<th><?php echo $attribute['name']; ?></th>
												<td><?php echo $attribute['text']; ?></td>
											</tr>
											<?php } ?>
										</tbody>

										<?php } ?>

									</table>

								</div>
							</div> <!-- #tab-attribute -->
						<?php } ?>
						<?php if ($review_status) { ?>
							<div class="tab-pane fade"  id="tab-review">
								<div class="row">
															
									<div id="list-reviews" class="row">
										<div id="review" class="col-sm-10 col-sm-push-1"></div>
									</div>

									<div class="contentset center" id="review-title">
										<h4 class="inner"><span><?php echo $text_write; ?></span></h4>
									</div>
									
									<div id="add-review" class="col-sm-10 col-sm-push-1">

										<form id="form-review" class="form-horizontal">

											<?php if ($review_guest) { ?>

											<div class="form-group required">
												<label class="control-label col-sm-2" for="input-name"><?php echo $entry_name; ?></label>
												<div class="col-sm-10">
													<input type="text" name="name" value="" id="input-name" class="form-control" />
												</div>
											</div>
											<div class="form-group required">
												<label class="control-label col-sm-2" for="input-review"><?php echo $entry_review; ?></label>
												<div class="col-sm-10">
													<textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
													<div class="help-block"><?php echo $text_note; ?></div>
													</div>
												</div>
											<div class="form-group required">
												<label class="control-label col-sm-2"><?php echo $entry_rating; ?></label>
												<div class="col-sm-10">
												<?php echo $entry_bad; ?>&nbsp;
													<input type="radio" name="rating" value="1" />
													&nbsp;
													<input type="radio" name="rating" value="2" />
													&nbsp;
													<input type="radio" name="rating" value="3" />
													&nbsp;
													<input type="radio" name="rating" value="4" />
													&nbsp;
													<input type="radio" name="rating" value="5" />
													&nbsp;<?php echo $entry_good; ?>
												</div>
											</div>
											<?php echo $captcha; ?>
											<div class="buttons">
												<button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
											</div>
											<?php } else { ?>
												<?php echo $text_login; ?>
											<?php } ?>

										</form> <!-- #form-review -->

									</div>

								</div>
							</div> <!-- #tab-review -->
						<?php } ?>
					</div>

				</div> <!-- #full-info -->

				<?php } ?>

			</div>
			
		</div>

		<?php echo $column_right; ?>

	</div>

	<?php echo $content_bottom; ?>

	<script type="text/javascript"><!--
	$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
		$.ajax({
			url: 'index.php?route=product/product/getRecurringDescription',
			type: 'post',
			data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
			dataType: 'json',
			beforeSend: function() {
				$('#recurring-description').html('');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				
				if (json['success']) {
					$('#recurring-description').html(json['success']);
				}
			}
		});
	});
	//--></script> 
	<script type="text/javascript"><!--
	$('#button-cart').on('click', function() {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
			dataType: 'json',
			beforeSend: function() {
				$('#button-cart').button('loading');
			},
			complete: function() {
				$('#button-cart').button('reset');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();
				$('.form-group').removeClass('has-error');

				if (json['error']) {
					if (json['error']['option']) {
						for (i in json['error']['option']) {
							var element = $('#input-option' + i.replace('_', '-'));
							
							if (element.parent().hasClass('input-group')) {
								element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							} else {
								element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
							}
						}
					}
					
					if (json['error']['recurring']) {
						$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
					}
					
					// Highlight any found errors
					$('.text-danger').parent().addClass('has-error');
				}
				
				if (json['success']) {
					$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('.cart-heading > span').html(json['total']);
					
					$('html, body').animate({ scrollTop: 0 }, 'slow');
					
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	});
	//--></script> 
	<script type="text/javascript"><!--
	$('.date').datetimepicker({
		pickTime: false
	});

	$('.datetime').datetimepicker({
		pickDate: true,
		pickTime: true
	});

	$('.time').datetimepicker({
		pickDate: false
	});

	$('button[id^=\'button-upload\']').on('click', function() {
		var node = this;
		
		$('#form-upload').remove();
		
		$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
		
		$('#form-upload input[name=\'file\']').trigger('click');
		
	if (typeof timer != 'undefined') {
		clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
	});
	//--></script> 
	<script type="text/javascript"><!--
	$('#review').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();

		$('#review').fadeOut('slow');

		$('#review').load(this.href);

		$('#review').fadeIn('slow');
	});

	$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

	$('#button-review').on('click', function() {
		$.ajax({
			url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
			type: 'post',
			dataType: 'json',
			data: $("#form-review").serialize(),
			beforeSend: function() {
				$('#button-review').button('loading');
			},
			complete: function() {
				$('#button-review').button('reset');
			},
			success: function(json) {
				$('.alert-success, .alert-danger').remove();
				
				if (json['error']) {
				$('#add-review').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
				}
				
				if (json['success']) {
				$('#add-review').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
					
					$('input[name=\'name\']').val('');
					$('textarea[name=\'text\']').val('');
					$('input[name=\'rating\']:checked').prop('checked', false);
				}
			}
		});
	});

//--></script> 

<script type="text/javascript"><!--
	$(document).ready(function() {
		$("a[rel^='magnificPopup']").magnificPopup({
		type:'image',
			gallery:{
				enabled:true
			}
		});
	});
	//--></script>

	<script type="text/javascript"><!--
		$(document).ready(function() {
			$('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
		});
		//--></script>

<?php echo $footer; ?>