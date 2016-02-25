<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
	<meta charset="UTF-8" />
	<base href="<?php echo $base; ?>" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />


                <?php foreach($metaProperties as $property) : ?>
                <meta property="<?php echo $property['type']; ?>" content="<?php echo $property['content']; ?>"/>
                <?php endforeach; ?>

                <?php foreach($metaTags as $tag) : ?>
                <meta name="<?php echo $tag['name']; ?>" content="<?php echo $tag['content']; ?>"/>
                <?php endforeach; ?>
            
	<title><?php echo $title; ?></title>

	<?php if ($description) { ?>
	<meta name="description" content="<?php echo $description; ?>" />
	<?php } ?>
	
	<?php if ($keywords) { ?>
	<meta name="keywords" content="<?php echo $keywords; ?>" />
	<?php } ?>

	<?php foreach ($styles as $style) { ?>
	<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>

	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<link href="catalog/view/theme/sellegance/stylesheet/bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/theme/sellegance/js/bootstrap.min.js" type="text/javascript"></script>

	<link href="catalog/view/theme/sellegance/stylesheet/jasny-bootstrap.min.css" rel="stylesheet" media="screen" />
	<script src="catalog/view/theme/sellegance/js/jasny-bootstrap.min.js" type="text/javascript"></script>

	<script src="catalog/view/theme/sellegance/js/jquery.browser.min.js" type="text/javascript"></script>
	<link href="catalog/view/theme/sellegance/stylesheet/font-awesome.min.css" rel="stylesheet" type="text/css" />

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.css" media="screen"/>

	<?php
	global $config;
	$layout = $config->get('sellegance_responsive_layout');

	$base_class = 'responsive';
	($layout=='large') ? $base_class.=' responsive-large' : ''; 
	?>

	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet-responsive.css" media="screen"/>

	<?php if($direction=='rtl'){?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/stylesheet.rtl.css" media="screen"/>
	<?php }?>

	<!-- css3-mediaqueries.js for IE less than 9 -->
	<!--[if lt IE 9]>
	<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
	<![endif]-->

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/modernizr.full.min.js"></script>

	<?php if($config->get('aslider_general_status') == '1') { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/rs-plugin/css/settings.css" media="screen"/>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript" src="catalog/view/theme/sellegance/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<?php } ?>

	<?php 
	if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') $path_image = $config->get('config_ssl') . 'image/';
	else $path_image = $config->get('config_url') . 'image/'; 
	?>

	<?php if($config->get('sellegance_full_background') == 1) { ?>

		<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/js/supersized/supersized.core.css">
		<script type="text/javascript" src="catalog/view/theme/sellegance/js/supersized/supersized.core.3.2.0.min.js"></script>

		<script type="text/javascript">
		jQuery(function($){
			$.supersized({
				slides:[ {image: '<?php echo $path_image . $config->get('sellegance_custom_image') ?>'} ]
			});
		});
		</script>

	<?php } ?>
	
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/sellegance/stylesheet/magnific-popup.css" media="screen" />
	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.magnific-popup.min.js"></script>

	<script type="text/javascript" src="catalog/view/theme/sellegance/js/jquery.cycle.js"></script>

	<script src="catalog/view/javascript/common.js" type="text/javascript"></script>

	<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" media="screen"/>


				<script type="text/javascript"> if (!window.console) console = {log: function() {}}; var config_language = <?php echo $dt_language; ?>; </script>
			

				<script type="text/javascript" src="catalog/view/theme/sellegance/js/quickview.js"></script>
				<script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/moment.js"></script>
				<script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
				<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />

				<script type="text/javascript"><!--
				$(document).ready(function() {
					$("a[rel^='mp-quickview']").magnificPopup({
					type:'ajax'
					});
				});
				//--></script>
			
	<?php foreach ($scripts as $script) { ?>
	<script type="text/javascript" src="<?php echo $script; ?>"></script>
	<?php } ?>

	<?php include(DIR_TEMPLATE . 'sellegance/template/common/custom_styles.tpl');?>

	<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>

</head>

<?php
	$lang=$language;

	global $language;
	$language->load('module/sellegance');
?>

<body class="<?php echo $base_class; ?> <?php echo $body_classes; ?>">

<?php include(DIR_TEMPLATE . 'sellegance/template/common/mobmenu.tpl');?>

<div class="topcanvas">

	<header id="header">

		<div id="topbar">
			<div class="container">
				<div class="topbar_inner">

					<button type="button" class="btn btn-menu visible-sm" data-toggle="offcanvas" data-target="#mobmenu" data-disable-scrolling="false" data-modal="true" data-canvas=".topcanvas"><i class="fa fa-bars fa-lg"></i></button>

					<?php if ($config->get('sellegance_social_header') == 1) { ?>

						<span class="social">

							<?php
								$sellegance_social = $config->get('sellegance_social');

								foreach ($sellegance_social as $sv => $sc) {
									if (!empty($sellegance_social[$sv]['url'])) {
										echo '<a href="'.$sellegance_social[$sv]['url'].'" class="fa fa-'.$sellegance_social[$sv]['class'].'" target="'.$sellegance_social[$sv]['target'].'"></a>';
									 ?>
									<?php }
								}

								$sellegance_custom_icon = $config->get('sellegance_custom_icon');

								for ($i=1; $i<=5; $i++) {
									if($sellegance_custom_icon[$i]['class'] != '') { 
										if($sellegance_custom_icon[$i]['url'] != '') {
											echo '<a href="'.$sellegance_custom_icon[$i]['url'].'" class="fa fa-'.$sellegance_custom_icon[$i]['class'].'" target="'.$sellegance_custom_icon[$i]['target'].'"></a>';
										} else {
											echo '<a class="fa fa-'.$sellegance_custom_icon[$i]['class'].'"></a>';
										}
									} 
								}
								?>
							
						</span> <!-- .social -->

						<?php } ?>

					<div id="top-links" class="nav pull-right">
					  <ul class="list-inline">
					    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle myaccount" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>
					      <ul class="dropdown-menu dropdown-menu-right">
					        <?php if ($logged) { ?>
					        <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
					        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
					        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
					        <?php } else { ?>
					        <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
					        <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
					        <?php } ?>
					        <li class="divider"></li>
					        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart-o"></i> <?php echo $text_wishlist; ?></a></li>
					      </ul>
					    </li>
					    
					  </ul>
					</div>

					<div id="wrapselector">
						<?php echo $lang; ?>
						<?php echo $currency; ?>
					</div>

					</div>
				</div>
			</div>

		<div class="container">

			<div class="header_inner">

				<?php
				$logopos=$config->get('sellegance_logo_position');
				$searchmode=$config->get('sellegance_searchbox_regular');
				?>

				<div class="row <?php echo $logopos;?>logo">

					<div id="logo" class="col-sm-4 <?php if($logopos=='center') echo 'col-sm-push-4';?>">
						<?php if ($logo) { ?>
							<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } else { ?>
							<a href="<?php echo $home; ?>" id="logo-black"><img src="catalog/view/theme/sellegance/images/logo.png" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
						<?php } ?>
					</div> <!-- #logo -->

					<div class="col-sm-4 leftbox <?php if($logopos=='center') echo 'col-sm-pull-4';?>">

						<?php if ($logopos=='left' && $searchmode==1) { echo $search; } ?>

						<?php $sellegance_header_text = $config->get('sellegance_header_info_text'); ?>
						<?php if(isset($sellegance_header_text) && strip_tags(html_entity_decode(implode($sellegance_header_text)))!='') { ?>
						<div class="header-info">
							<?php echo html_entity_decode($sellegance_header_text[$config->get('config_language_id')], ENT_QUOTES, 'UTF-8');?>
						</div>
						<?php } ?>

					</div> <!-- .leftbox -->

					<div class="col-sm-4 rightbox search-<?php echo $searchmode; ?>">

					<button type="button" class="btn btn-menu visible-xs" data-toggle="offcanvas" data-target="#mobmenu" data-disable-scrolling="false" data-modal="true" data-canvas=".topcanvas"><i class="fa fa-bars fa-lg"></i></button>

						<?php if ($logopos=='center' || $searchmode!=1) { echo $search; } ?>
						
						<?php echo $cart; ?>

					</div> <!-- .rightbox -->

				</div>

			</div>

		</div>

	</header> <!-- #header -->

				<?php if($ajaxadvancesearch_status){ ?>
				<!--
				/**
					*Ajax advanced search starts
					*/
				-->
				<script type="text/javascript" language="javascript"><!--
					// Ajax advanced search starts
					$(document).ready(function(){
					var afaxAdvancedSearch = $('#search input[name="search"]');
						var customAutocomplete = null , allRequest = null;
						afaxAdvancedSearch.autocomplete({
							delay: 500,
							responsea : function (items){
								if(typeof this.items=='undefined'){
									this.items = new Array();
								}
								if (items.length) {
									for (i = 0; i < items.length; i++) {
										this.items[items[i]['value']] = items[i];
									}
								}
								var html='';
								if(items.length){
									$.each(items,function(key,item){
										if(item.product_id!=0){
										html += '<li data-value="' + item['value'] + '"><a href="#">';
										html += '<div class="ajaxadvance">';
										html += '<div class="image">';
											if(item.image){
											html += '<img title="'+item.name+'" src="'+item.image+'"/>';
											}
											html += '</div>';
											html += '<div class="content">';
											html += 	'<h4 class="name">'+item.label+'</h4>';
											if(item.model){
											html += 	'<div class="model">';
											html +=		'<?php echo $ajaxadvancedsearch_model; ?> '+ item.model;
											html +=		'</div>';
											}
											if(item.manufacturer){
											html += 	'<div class="manufacturer">';
											html +=		'<?php echo $ajaxadvancedsearch_manufacturer; ?> '+ item.manufacturer;
											html +=		'</div>';
											}
											if(item.price){
											html += 	'<div class="price"> <?php echo $ajaxadvancedsearch_price; ?> ';
												if (!item.special) {
											html +=			 item.price;
												} else {
											html +=			'<span class="price-old">'+ item.price +'</span> <span class="price-new">'+ item.special +'</span>';
												}
											html +=		'</div>';
											}
											if(item.stock_status){
											html += 	'<div class="stock_status">';
											html +=		'<?php echo $ajaxadvancedsearch_stock; ?> '+ item.stock_status;
											html +=		'</div>';
											}
											if(item.quantity){
											html += 	'<div class="quantity">';
											html +=		'<?php echo $ajaxadvancedsearch_quantity; ?> '+ item.quantity;
											html +=		'</div>';
											}
											if (item.rating) {
											html +=		'<div class="ratings"> <?php echo $ajaxadvancedsearch_rating; ?>';
											for (var i = 1; i <= 5; i++) {
											if (item.rating < i) {
												html +=		'<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>';
											} else {
												html +=		'<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>';
											}
											}
											html +=		'</div>';
											}
											if(item.allresults){
											html += '<div class="allresults">'+ allRequest.trim()+'</div>';
											}
											html +='</div>';
											html += '</div></a></li>'
										}
									});
								}
								
								if (html) {
									afaxAdvancedSearch.siblings('ul.dropdown-menu').show();
								} else {
									afaxAdvancedSearch.siblings('ul.dropdown-menu').hide();
								}

								$(afaxAdvancedSearch).siblings('ul.dropdown-menu').html(html);
							},
							source: function(request, response) {
							customAutocomplete = this;
							if(request.trim().length >= <?php echo $ajaxadvancesearch_charlimit ?>) {
								allRequest = request;
								$.ajax({
									url: 'index.php?route=common/header/ajaxLiveSearch&filter_name=' +  encodeURIComponent(request.split('')),
									dataType : 'json',
									success : function(json) {
										customAutocomplete.responsea($.map(json, function(item) {
											return {
												label: item.name,
												name: item.name1,
												value: item.product_id,
												model: item.model,
												stock_status: item.stock_status,												
												quantity: item.quantity,
												// seo friendly starts
												url: item.url,
												// seo friendly ends
												image: item.image,
												manufacturer: item.manufacturer,
												price: item.price,
												special: item.special,
												category: item.category,
												rating: item.rating,
												allresults: item.allresults,
												reviews: item.reviews,
											}
										}));
									}
								});
								}
							},
							select : function (ui){
								return false;
							},
							selecta: function(ui) {
								if(ui.value){
									//location = 'index.php?route=product/product/&product_id='+ui.value;
									location = ui.url.replace('&amp;','&');
								}else{
								$('#search input[name=\'search\']').parent().find('button').trigger('click');
								}
								return false;
							},
							focus: function(event, ui) {
								return false;
							}
						});

						afaxAdvancedSearch.siblings('ul.dropdown-menu').delegate('a', 'click', function(){
							value = $(this).parent().attr('data-value');
							if (value && customAutocomplete.items[value]) {
								customAutocomplete.selecta(customAutocomplete.items[value]);
							}else{
								customAutocomplete.selecta(0);
							}
						});
					});
					//Ajax advanced search ends
				//--></script>
				<style>
				#search .dropdown-menu {z-index: 1050 !important; background: #fff; width: 100%;}
				#search .dropdown-menu h3, #search .dropdown-menu h4 {color: #444; }
				/* #search .dropdown-menu li:hover h3, #search .dropdown-menu li:hover h4 {color: #fff; } */
				#search .dropdown-menu li:nth-child(even){background: #<?php echo !empty($ajaxadvancedsearch_color_evenresult) ? $ajaxadvancedsearch_color_evenresult : 'FFFFFF';?>;  border: 1px solid #dbdee1;}
				#search .dropdown-menu li:nth-child(odd){background: #<?php echo !empty($ajaxadvancedsearch_color_oddresult) ? $ajaxadvancedsearch_color_oddresult : 'E4EEF7'; ?>;  border: 1px solid #fff;}
				/*<!-- 26-01-2014 starts -->*/
				<?php if($ajaxadvancedsearch_result_view!='default-view') { ?>
					#search .dropdown-menu li:nth-child(even){background: #<?php echo !empty($ajaxadvancedsearch_color_evenresult) ? $ajaxadvancedsearch_color_evenresult : 'FFFFFF';?>;  border: none; padding:0 10px; }
					#search .dropdown-menu li:nth-child(odd){background: #<?php echo !empty($ajaxadvancedsearch_color_oddresult) ? $ajaxadvancedsearch_color_oddresult : 'FFFFFF'; ?>;  border: none; padding:0 10px; }
					#search .dropdown-menu a { border-bottom: 1px solid #cdcece; border-radius: 0; white-space: normal; }
					#search .dropdown-menu li:last-child a { border-bottom: none; }
				<?php } ?>
				/** result area hover starts */
				<?php if(!empty($ajaxadvancedsearch_color_resulthover)) { ?>
				#search .dropdown-menu > li > a:hover, #search .dropdown-menu li:hover {
					background: #<?php echo $ajaxadvancedsearch_color_resulthover; ?>;
				}
				<?php } ?>
				/** result area hover ends */
				/** result area heading starts */
				<?php if(!empty($ajaxadvancedsearch_color_heading)) { ?>
				/** for heading color */
				#search .dropdown-menu li a h3,
				#search .dropdown-menu li a h4
				{ color: #<?php echo $ajaxadvancedsearch_color_heading; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_headinghover)) { ?>
				/**for heading color on hover*/
				#search .dropdown-menu li a:hover h3,
				#search .dropdown-menu li a:hover h4
				{ color: #<?php echo $ajaxadvancedsearch_color_headinghover; ?>; }
				<?php } ?>
				/** result area heading ends */
				/** result area model starts */
				<?php if(!empty($ajaxadvancedsearch_color_model)) { ?>
				/** for model color */
				#search .dropdown-menu li a .model,
				#search .dropdown-menu li a .model
				{ color: #<?php echo $ajaxadvancedsearch_color_model; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_modelhover)) { ?>
				/**for model color on hover*/
				#search .dropdown-menu li a:hover .model,
				#search .dropdown-menu li a:hover .model
				{ color: #<?php echo $ajaxadvancedsearch_color_modelhover; ?>; }
				<?php } ?>
				/** result area model ends */
				/** result area manufacturer starts */
				<?php if(!empty($ajaxadvancedsearch_color_manufacturer)) { ?>
				/** for manufacturer color */
				#search .dropdown-menu li a .manufacturer,
				#search .dropdown-menu li a .manufacturer
				{ color: #<?php echo $ajaxadvancedsearch_color_manufacturer; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_manufacturerhover)) { ?>
				/**for manufacturer color on hover*/
				#search .dropdown-menu li a:hover .manufacturer,
				#search .dropdown-menu li a:hover .manufacturer
				{ color: #<?php echo $ajaxadvancedsearch_color_manufacturerhover; ?>; }
				<?php } ?>
				/** result area manufacturer ends */
				/** result area price starts */
				<?php if(!empty($ajaxadvancedsearch_color_price)) { ?>
				/** for price color */
				#search .dropdown-menu li a .price,
				#search .dropdown-menu li a .price
				{ color: #<?php echo $ajaxadvancedsearch_color_price; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_pricehover)) { ?>
				/**for price color on hover*/
				#search .dropdown-menu li a:hover .price,
				#search .dropdown-menu li a:hover .price
				{ color: #<?php echo $ajaxadvancedsearch_color_pricehover; ?>; }
				<?php } ?>
				/** result area price ends */
				/** result area stockstatus starts */
				<?php if(!empty($ajaxadvancedsearch_color_stockstatus)) { ?>
				/** for stock_status color */
				#search .dropdown-menu li a .stock_status,
				#search .dropdown-menu li a .stock_status
				{ color: #<?php echo $ajaxadvancedsearch_color_stockstatus; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_stockstatushover)) { ?>
				/**for stock_status color on hover*/
				#search .dropdown-menu li a:hover .stock_status,
				#search .dropdown-menu li a:hover .stock_status
				{ color: #<?php echo $ajaxadvancedsearch_color_stockstatushover; ?>; }
				<?php } ?>
				/** result area stockstatus ends */
				/** result area quantity starts */
				<?php if(!empty($ajaxadvancedsearch_color_quantity)) { ?>
				/** for quantity color */
				#search .dropdown-menu li a .quantity,
				#search .dropdown-menu li a .quantity
				{ color: #<?php echo $ajaxadvancedsearch_color_quantity; ?>; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_quantityhover)) { ?>
				/**for quantity color on hover*/
				#search .dropdown-menu li a:hover .quantity,
				#search .dropdown-menu li a:hover .quantity
				{ color: #<?php echo $ajaxadvancedsearch_color_quantityhover; ?>; }
				<?php } ?>
				/** result area quantity ends */
				/** result area highlight starts */
				<?php if(!empty($ajaxadvancedsearch_color_highlight)) { ?>
				/** for highlight color */
				#search .dropdown-menu li a .highlight,
				#search .dropdown-menu li a .highlight
				{ color: #<?php echo $ajaxadvancedsearch_color_highlight; ?>; }
				<?php }else{ ?>
				#search .ajaxadvance li a .highlight {color: #38b0e3; }
				<?php } ?>
				<?php if(!empty($ajaxadvancedsearch_color_highlighthover)) { ?>
				/**for highlight color on hover*/
				#search .dropdown-menu li a:hover .highlight,
				#search .dropdown-menu li a:hover .highlight
				{ color: #<?php echo $ajaxadvancedsearch_color_highlighthover; ?>; }
				<?php }else{ ?>
				#search .ajaxadvance li a:hover .highlight {color: #38b0e3; }
				<?php } ?>
				/** result area highlight ends */

				/*<!-- 26-01-2014 ends -->*/
				/*#search .dropdown-menu li, .ui-menu .ui-menu-item { margin-bottom: 10px;}*/
				#search .dropdown-menu a {border-radius: 0; white-space: normal; }
				#search .ajaxadvance { width: 100%; min-height: <?php echo (int)$ajaxadvancesearch_imageheight+ (int)$ajaxadvancesearch_imageheight*20/100;?>px; }
				#search .ajaxadvance .name { margin:0; font-weight: bold; font-size: 1em; }
				#search .ajaxadvance .image { display:inline-flex; float: left; margin-right:10px; width: <?php echo (int)$ajaxadvancesearch_imagewidth;?>px; }
				#search .ajaxadvance .content { display:inline-block;	max-width: 300px;}
				#search .ajaxadvance .content > div { margin-top:5px; font-weight: normal; font-size: 0.9em;	}
				#search .ajaxadvance .price-old {color: #ff0000; text-decoration: line-through; }
				#search .ajaxadvance .allresults {color: #00ae7c; }

				</style>
				<!--
				/**
					*Ajax advanced search ends
					*/
				-->
				<?php } ?>
			

	<div id="content-wrapper">
		
		<?php include(DIR_TEMPLATE . 'sellegance/template/common/menu.tpl'); ?>

		<?php if($config->get('sellegance_sticky_menu') == 1) { ?>

		<script type="text/javascript">
			var startPosition = 101;
			var contentMargin =  28;

			$(window).scroll(function() {
				if($(window).scrollTop() > startPosition) {
					width = $('.container #menu').width();
					height = $('.container #menu').height();
					$('#menu .navbar').addClass('navbar-fixed-top')
					$('#menu .navcontainer').addClass('container')
					$('#cart').addClass('fixed')
				} else {
					$('#menu .navbar').removeClass('navbar-fixed-top');
					$('#menu .navcontainer').removeClass('container')
					$('#cart').removeClass('fixed');
				}
			}); 
		</script>

		<?php } ?>
