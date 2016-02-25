<?php echo $header; ?>
<div class="container ms-catalog-seller-products">
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


    <aside id="column-left" class="col-sm-3 hidden-xs">
    <div class="ms-sellerprofile description">
        <div class="seller-data">
          <div class="avatar-box">
            <a href="<?php echo $seller['href']; ?>"><img style="width: 80px; height: 80px;" src="<?php echo $seller['thumb']; ?>" /></a>
          </div>
          <div class="info-box">
          <ul class="list-unstyled">
            <li><a class="nickname" style="text-decoration: none" href="<?php echo $seller['href']; ?>"><?php echo $seller['nickname']; ?></a></li>

            <li>Sokolniki, Moscow</li>

            <li class="mm_rating"><span class="yellow"></span><span class="yellow"></span><span class="yellow"></span><span></span><span></span></li>

            <li class="mm_social"><a class="mm_facebook_mini" href=""></a><a href="" class="mm_twitter_mini"></a><a href="" class="mm_google_mini"></a><div class="cl"></li>
            <div class="contact"><button type="button" class="btn btn-primary btn-block ms-sellercontact" data-toggle="modal" data-target="#contactDialog"><span>Contact seller</span></button>
                                </div>
          </ul>
          </div>
        </div>
      </div>
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
    <div id="content" style="width: 877px" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($seller['products']) { ?>
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

      <div class="row">
        <?php foreach ($seller['products'] as $product) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <p><?php echo $product['description']; ?></p>
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
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
      <p><?php echo $ms_catalog_seller_products_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>