<?php echo $header; ?>
<div class="container catalog-seller">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
	<?php if (isset($sellers) && $sellers) { ?>
      <div class="row">

      <aside id="column-left" class="col-sm-3 hidden-xs">
      <div class="list-group">
      <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=20" class="list-group-item">Desktops (18)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=18" class="list-group-item">Laptops &amp; Notebooks (5)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25" class="list-group-item active">Components (2)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25_29" class="list-group-item">&nbsp;&nbsp;&nbsp;- Mice and Trackballs (0)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25_28" class="list-group-item active">&nbsp;&nbsp;&nbsp;- Monitors (2)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25_30" class="list-group-item">&nbsp;&nbsp;&nbsp;- Printers (0)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25_31" class="list-group-item">&nbsp;&nbsp;&nbsp;- Scanners (0)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=25_32" class="list-group-item">&nbsp;&nbsp;&nbsp;- Web Cameras (0)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=57" class="list-group-item">Tablets (1)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=17" class="list-group-item">Software (0)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=24" class="list-group-item">Phones &amp; PDAs (3)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=33" class="list-group-item">Cameras (2)</a>
        <a href="http://localhost/testopencart/index.php?route=product/category&amp;path=34" class="list-group-item">MP3 Players (4)</a>
      </div>
      </aside>

      <div class="col-sm-9">
       <div class="row">

        <div class="mm_top_products_left">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
          <div id="search" class="input-group">
            <input type="text" name="search" value="" placeholder="Search" class="form-control input-lg">
            <span class="input-group-btn"><button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button></span>
          </div>
        </div>

        <div class="mm_top_products_right">
          <div class="mm_sort_group">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
          <select id="input-sort" class="form-control" onchange="location = this.value;" >
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
          </div>
          <div class="mm_sort_group">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
          </div>
        </div>
        <div class="cl"></div>
      </div>
		  <?php foreach ($sellers as $seller) { ?>
		  <div class="mm_seller">
		  <div class="product-thumb">
    		<div class="image">
    		<a href="<?php echo $seller['href']; ?>"><img src="<?php echo $seller['thumb']; ?>" title="<?php echo $seller['nickname']; ?>" alt="<?php echo $seller['nickname']; ?>" /></a>
    		</div>
      <div>
        <div class="">
          <h4><a href="<?php echo $seller['href']; ?>"><?php echo $seller['nickname']; ?></a></h4>
          Sokolniki, Moscow<br>
          <div class="mm_rating"><span class="yellow"></span><span class="yellow"></span><span class="yellow"></span><span></span><span></span></div>
        </div>

        <div class="caption">

				<?php if ($seller['company']) { ?>
					<p class="company"><b><?php echo $ms_catalog_sellers_company; ?></b> <?php echo $seller['company']; ?></p>
				<?php } ?>

				<?php if ($seller['website']) { ?>
					<p class="website"><b><?php echo $ms_catalog_sellers_website; ?></b> <?php echo $seller['website']; ?></p>
				<?php } ?>

				<p class="totalsales"><b><?php echo $ms_catalog_sellers_totalsales; ?></b> <?php echo $seller['total_sales']; ?></p>
				<p class="totalproducts"><b><?php echo $ms_catalog_sellers_totalproducts; ?></b> <?php echo $seller['total_products']; ?></p>
			</div>

      <div class="mm_catalogseller">
      <img height="46px" src="image/catalog/demo/iphone_1.jpg">
      <img height="46px" src="image/catalog/demo/iphone_1.jpg">
      <img height="46px" src="image/catalog/demo/iphone_1.jpg">
      <img height="46px" src="image/catalog/demo/iphone_1.jpg">
      <img height="46px" src="image/catalog/demo/iphone_1.jpg">
      <a href=""><b>25</b>items</a>
      </div>


			</div>
		  </div>
		  </div>
		<?php } ?>
		</div>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
	<?php } else { ?>
		<div class="content"><?php echo $ms_catalog_sellers_empty; ?></div>
	    <div class="buttons">
			<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
	    </div>
	<?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div></div>
<?php echo $footer; ?>