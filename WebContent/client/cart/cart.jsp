<%@page import="game.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%@ include file="/client/inc/style.jsp"%>
</head>
<body>
	<div id="site-content">
		<!-- Top -->
		<%@ include file="/client/inc/top.jsp"%>
		<main class="main-content">
		<div class="container">
			<div class="page">
				<table class="cart">
					<thead>
						<tr>
							<th class="product-name">Game</th>
							<th class="product-price">Price</th>
							<th class="product-qty">Sale</th>
							<th class="product-total">Total</th>
							<th class="action"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="product-name">
								<div class="product-thumbnail">
									<img src="../images/gta.jpg">
								</div>
								<div class="product-detail">
									<h3 class="product-title">GTA V</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Iure nobis architecto dolorum, alias laborum sit odit,
										saepe expedita similique eius enim quasi obcaecati voluptates,
										autem eveniet ratione veniam omnis modi.</p>
								</div>
							</td>
							<td class="product-price">$150.00</td>
							<td class="product-qty">-20%</td>
							<td class="product-total">$150.00</td>
							<td class="action"><a href="#"></a></td>
						</tr>
					</tbody>
				</table>
				<!-- .cart -->
				<div class="cart-total">
					<p>
						<strong>할인 전 금액</strong>59000원
					</p>
					<p class="total">
						<strong>결제 금액</strong><span class="num">39000원</span>
					</p>
					<p>
						<a href="#" class="button muted">쇼핑 계속하기</a> <a href="#"
							class="button">결제하기</a>
					</p>
				</div>
				<!-- .cart-total -->
			</div>
		</div>
		<!-- .container --> </main>
		<!-- .main-content -->
	</div>
	<div class="overlay"></div>
</body>
</html>