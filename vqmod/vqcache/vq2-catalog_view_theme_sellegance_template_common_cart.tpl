<div id="cart" class="btn-group">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse dropdown-toggle cart-heading"><span id="cart-total"><?php echo $text_items; ?></span> <i class="fa fa-shopping-cart"></i></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-items">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>

			<?php
				$this->load->language('multiseller/multiseller');
				$seller = $this->MsLoader->MsSeller->getSeller($this->MsLoader->MsProduct->getSellerId($product['product_id']));
				if ($seller) {
					echo "<span class='ms-by-seller'>" . $this->language->get('ms_by') . " <a href='". $this->url->link('seller/catalog-seller/profile', 'seller_id=' . $seller['seller_id']) ."'>{$seller['ms.nickname']}</a>";
				}
			?>
			
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right"><?php echo $product['total']; ?> <br>x <?php echo $product['quantity']; ?> </td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right"><?php echo $voucher['amount']; ?> <br> x&nbsp;1</td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <div class="text-right">

        	<a href="<?php echo $cart; ?>" class="btn btn-primary btn-block btn-sm"><?php echo $text_cart; ?></a>
        	<a href="<?php echo $checkout; ?>" class="btn btn-default btn-cart btn-block btn-sm"><?php echo $text_checkout; ?></a>
        </div>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="empty  white text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>