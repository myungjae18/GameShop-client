<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<%@ include file="/client/inc/style.jsp" %>
	</head>
	<body>
			<div id="site-content">
			<!-- Top -->
			<%@ include file="/client/inc/top.jsp" %>
			
			<main class="main-content">
				<div class="container">
					<div class="page">
						<div class="filter-bar">
							<div class="filter">
								<span>
									<label>Sort by:</label>
									<select>
										<option>Popularity</option>
										<option>Highest Rating</option>
										<option>Lowest price</option>
									</select>
								</span>
								<span>
									<label>Genre</label>
									<select>
										<option value="#">Show All</option>
										<option value="#">Action</option>
										<option value="#">Racing</option>
										<option value="#">Strategy</option>
									</select>
								</span>
							</div> <!-- .filter -->
						</div> <!-- .filter-bar -->
						
						<div class="product-list">
								<div class="product">
									<div class="inner-product">
										<div class="figure-image">
											<a href="single.html"><img src="../images/gta.jpg"></a>
										</div>
										<h3 class="product-title"><a href="#">GTA5</a></h3>
										<p>Lorem ipsum dolor sit consectetur adipiscing elit do eiusmod tempor...</p>
										<a href="#" class="button">Add to cart</a>
									</div>
								</div> <!-- .product -->								
						</div> <!-- .product-list -->
						<div class="pagination-bar">
							<div class="pagination">
								<a href="#" class="page-number"><img src="../images/left.png" style="width:20px"></a>
								<span class="page-number current">1</span>
								<a href="#" class="page-number">2</a>
								<a href="#" class="page-number">3</a>
								<a href="#" class="page-number">...</a>
								<a href="#" class="page-number">12</a>
								<a href="#" class="page-number"><img src="../images/right.png" style="width:20px"></a>
							</div> <!-- .pagination -->
						</div>
					</div>
				</div> <!-- .container -->
			</main> <!-- .main-content -->
	</body>

</html>