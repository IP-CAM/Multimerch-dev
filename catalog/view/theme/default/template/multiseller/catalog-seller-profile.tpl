<?php echo $header; ?>
<div class="container ms-catalog-seller-profile">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
		<!-- left column -->

        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
		<div class="<?php echo $class; ?> seller-data">
			<?php if ($this->config->get('msconf_enable_seller_banner') && isset($seller['banner'])) { ?>
			<ul class="thumbnails seller-banner">
					<li><a class="thumbnail"><img src="<?php echo $seller['banner']; ?>" title="<?php echo $seller['nickname']; ?>" alt="<?php echo $seller['nickname']; ?>" /></a></li>
			</ul>

			<?php } ?>
			<div class="seller-description"><h3>About</h3><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus laoreet at tortor vitae accumsan. Quisque elit ante, interdum ac nisi quis, fermentum luctus elit. Nam tempor molestie efficitur. In hac habitasse platea dictumst. Proin pulvinar condimentum nibh feugiat tempor. <br>
Our site - <a href="">example.com</a></p><hr><h3>Our subtext</h3><p>Etiam faucibus nisl ut turpis aliquet dapibus. Duis rutrum vulputate quam et vestibulum. Aenean et diam orci. Nulla facilisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p><ul><li>List item 1</li><li>List item 2</li><li>List item 3</li></ul></div>

			<?php if ($seller['products']) { ?>
			<hr />
			<div class="mm_head">
			<h3>Featured products</h3><div id="search" class="input-group">
			<input type="text" name="search" value="" placeholder="Search" class="form-control input-lg">
			<span class="input-group-btn"><button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button></span>
			</div>
			<div class="cl"></div>
			</div>
			<div class="row">
			  <?php foreach ($seller['products'] as $product) { ?>
			  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
				<div class="product-thumb transition">
				  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
				  <div class="caption">
					<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
				  </div>
				  <div class="button-group">
					<a href="<?php echo $product['href']; ?>"><button type="button" class="btn btn-main btn-block"><span><?php echo $ms_view; ?></span></button></a>
				  </div>
				</div>
			  </div>
			  <?php } ?>
			</div>
			<hr>
			<div class="row">
        	<div class="col-sm-6 text-left">
        	<ul class="pagination"><li class="active"><span>1</span></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">2</a></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">&gt;</a></li><li><a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20&amp;page=2">&gt;|</a></li></ul></div>
        	<div class="browseitems">
                <a href="<?php echo $seller['href']; ?>" class="btn btn-primary btn-block"><span><?php echo $ms_catalog_seller_profile_view_products; ?></span></a>
            </div>
      		</div>
			<?php } ?>

			<!-- end products -->
		</div>

		<!-- right column -->
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
        	<div class="ms-sellerprofile description">
        	<div class="info-box">
				<a class="avatar-box thumbnail" href="<?php echo $seller['href']; ?>"><img src="<?php echo $seller['thumb']; ?>" /></a>
				<div>
				<ul class="list-unstyled">
					<li><h3 class="sellersname"><?php echo $seller['nickname']; ?></h3></li>
					<?php if (isset($seller['country']) && $seller['country']) { ?><li><?php echo $ms_catalog_seller_profile_country; ?> <?php echo $seller['country']; ?></li><?php } ?>
					<?php if (isset($seller['company']) && $seller['company']) { ?><li><?php echo $ms_catalog_seller_profile_company; ?> <?php echo $seller['company']; ?></li><?php } ?>
					<?php if ($seller['website']) { ?><li><?php echo $ms_catalog_seller_profile_website; ?> <?php echo $seller['website']; ?></li><?php } ?>
					<li><span class="mm_top_badge"></span><span class="mm_good_badge"></span><span class="mm_king_badge"></span><div class="cl"></div></li>
				</ul>
				<a href="">Contact seller</a>
				</div>
			</div>
       		</div>

       		<div class="ms-sellerprofile description">
       		<ul class="mm_stats">
       			<li class="stats_locate">Sokolniki, Moscow</li>
       			<li class="stats_sales"><a href=""><b>4 957</b> sales</a></li>
       			<li class="stats_products"><a href=""><b>29 173</b> products</a></li>
       			<li class="stats_ratings"><a href=""><b>291</b> ratings</a></li>
       			<li class="stats_followers"><a href=""><b>98</b> followers</a></li>
       		</ul>
       		</div>

       		<div class="ms-sellerprofile description">
       		<div class="mm_big_rating"><b>Rating</b><span class="yellow"></span><span class="yellow"></span><span class="yellow"></span><span></span><span></span>&nbsp;4.61 on 291 ratings</div>
       		</div>

       		<div class="ms-sellerprofile description">
       		<a class="mm_follow" href="">Follow</a><a class="mm_facebook" href=""></a><a href="" class="mm_twitter"></a><a href="" class="mm_google"></a><div class="cl">
       		</div>


			<?php if ($this->config->get('mmess_conf_enable') || $this->config->get('msconf_enable_private_messaging') == 2) { ?>
				<?php if ((!$this->customer->getId()) || ($this->customer->getId() != $seller['seller_id'])) { ?>
					<?php echo $contactForm; ?>
					<div class="contact">
						<h3><?php echo $ms_sellercontact_title ?></h3>
						<?php if ($this->customer->getId()) { ?>
						  <div class="button-group">
							<button type="button" class="btn btn-default btn-block ms-sellercontact" data-toggle="modal" data-target="#contactDialog"><span><?php echo $ms_catalog_product_contact; ?></span></button>
						  </div>
						<?php } else { ?>
							<?php echo sprintf($this->language->get('ms_sellercontact_signin'), $this->url->link('account/login', '', 'SSL'), $seller['nickname']); ?>
						<?php } ?>
					</div>
				<?php } ?>
			<?php } ?>
		</div>
	  </div>
	  <?php echo $content_bottom; ?>
	</div>
	<?php echo $column_right; ?>
  </div>
</div></div>
<?php echo $footer; ?>
