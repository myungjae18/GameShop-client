<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="/client/inc/style.jsp" %>
	</head>


	<body class="slider-collapse">
		
		<div id="site-content">
			<!-- Top -->
			<%@ include file="/client/inc/top.jsp" %>
			<div class="home-slider">
				<ul class="slides">
					<li data-bg-image="../images/kill.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">Kill Zone 3</h2>
								<small class="slide-subtitle">$190.00</small>
								
								<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.</p>
								
								<a href="cart.html" class="button">Add to cart</a>
							</div>

							<img src="../images/kill.jpg" class="slide-image">
						</div>
					</li>
					<li data-bg-image="../images/gta.jpg">
						<div class="container">
							<div class="slide-content">
								<h2 class="slide-title">GTA5</h2>
								<small class="slide-subtitle">$210.00</small>
								
								<p>Perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.</p>
								
								<a href="cart.html" class="button">Add to cart</a>
							</div>

							<img src="../images/gta.jpg" class="slide-image">
						</div>
					</li>
					
			</div> <!-- .home-slider -->

			<main class="main-content">
				<div class="container">
					<div class="page">
						<section>
							<header>
								<h2 class="section-title">New Products</h2>
								<a href="#" class="all">Show All</a>
							</header>

							<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="../images/gta.jpg"></a>
										</div>
										<h3 class="product-title"><a href="#">GTA5</a></h3>
										<small class="price">$19.00</small>
										<p>Lorem ipsum dolor sit consectetur adipiscing elit do eiusmod tempor...</p>
										<a href="cart.html" class="button">Add to cart</a>
									</div>
								</div> <!-- .product -->

							</div> <!-- .product-list -->

						</section>

						<section>
							<header>
								<h2 class="section-title">promotion</h2>
								<a href="#" class="all">Show All</a>
							</header>

							<div class="product-list">
								
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="../images/gta.jpg"></a>
										</div>
										<h3 class="product-title"><a href="#">Watch Dogs</a></h3>
										<small class="price">$19.00</small>
										<p>Lorem ipsum dolor sit consectetur adipiscing elit do eiusmod tempor...</p>
										<a href="cart.html" class="button">Add to cart</a>
									</div>
								</div> <!-- .product -->
								
								
							</div> <!-- .product-list -->

						</section>
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->

			<!-- bottom -->
			
		</div>

		<div class="overlay"></div>

		
	</body>

</html>