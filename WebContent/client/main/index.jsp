<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/client/inc/style.jsp"%>
<%@ include file="/client/inc/top.jsp"%>
<script>
	$(function() {
		getEvent();
		getGameList();
		eventGameList();
	});

	function getEvent() {
		$.ajax({
					url : "/rest/client/events",
					type : "get",
					success : function(result) {
						var str = "";

						for (var i = 0; i < result.length; i++) {
							str += "<li data-bg-image='/data/event/"+result[i].event_img+"'>";
							str += "<div class='container'>";
							str += "<div class='slide-content'>";
							str += "<h2 class='slide-title'>"
									+ result[i].event_name + "&nbsp&nbsp";
							str += "<img src='/data/event/"+result[i].event_icon+"' width='70px'>";
							str += "</h2>";
							str += "<small class='slide-subtitle'><font color='red'>"
									+ result[i].event_discount + "% 세일</font></small>";
							str += "<p name='select"+result[i].event_id+"'>";
							str += "</p>"
							str += "<a href='/client/event/index.jsp?event_id="+result[i].event_id+"'+ class='button' id='eventDirect'>이벤트 페이지 바로가기</a>";
							str += "</div>";
							str += "<img src='/data/event/"+result[i].event_img+"' class='slide-image' width='400px'>";
							str += "</div>";
							str += "</li>";
							getEventGame(result[i].event_id);
						}
						$(".slides").append(str);
					}
				});
	}
	function getEventGame(event_id) {
		$.ajax({
			url : "/rest/client/event/games",
			type : "get",
			data : {
				event_id : event_id
			},
			success : function(result) {
				str = "";
				for (var i = 0; i < result.length; i++) {
					str += "<b style='font-size: 20px'>["
							+ result[i].game.game_name + "]&nbsp&nbsp";
					str += "</b>";
				}
				$("p[name='select" + event_id + "']").append(str);
			}
		});
	}

	function getGameList() {
		$.ajax({
					url : "/rest/client/gameList",
					type : "get",
					success : function(result) {
						var str = "";
						for (var i = 0; i < 8; i++) {
							if (i == result.length)
								break;
							str += "<div class='product'>";
							str += "<div class='inner-product'>";
							str += "<div class='figure-image'>";
							gameimage(result[i].game_id);
							str += "<a href='/client/game/single.jsp?game_id="+result[i].game_id+"'><img name='"+result[i].game_id+"'></a>";
							str += "</div>"
							str += "<h3 class='product-title'><a href='/client/game/single.jsp?game_id="+result[i].game_id+"'>"
									+ result[i].game_name + "</a></h3>";
							str += "<small class='price'>"
									+ result[i].game_price + "원</small>";
							str += "<p>" + result[i].game_detail + "</p>";
							str += "<a href='/client/pay/cart.jsp?game_id="+result[i].game_id+"' class='button'>Add to cart</a>&nbsp";
							str += "<a href='/client/pay/pay.jsp?game_id="+result[i].game_id+"' class='button' style='background-color:orange'>Buy This</a>";
							str += "</div>";
							str += "</div>";
						}
						$("#new-product").append(str);
					}
				});
	}
	function gameimage(game_id) {
		$.ajax({
			url : "/rest/admin/game/images",
			type : "get",
			data : {
				game_id : game_id
			},
			success : function(result) {
				$("img[name='" + game_id + "']").attr({
					'src' : '/data/game/' + result[0].img_filename,
					'width' : 100
				});
			}
		});
	}
	function eventGameList() {
		$.ajax({
					url : "/rest/client/eventGames",
					type : "get",
					success : function(result) {
						var str = "";
						for (var i = 0; i < 8; i++) {
							if (i == result.length)
								break;
							str += "<div class='product'>";
							str += "<div class='inner-product'>";
							str += "<div id='icon'>";
							str += "<img src='/data/event/"+result[i].event.event_icon+"'>";
							str += "</div>";
							str += "<div class='figure-image'>";
							gameimage(result[i].game.game_id);
							str += "<a href='/client/game/single.jsp?game_id="+result[i].game.game_id+"'><img name='"+result[i].game.game_id+"'></a>";
							str += "</div>";
							str += "<h3 class='product-title'><a href='/client/game/single.jsp?game_id="+result[i].game.game_id+"'>"
									+ result[i].game.game_name + "</a></h3>";
							str += "<small class='price'><del>"
									+ result[i].game.game_price + "원</del>";
							str += "&nbsp&nbsp <font size='5px' color='red'>"
									+ result[i].event.event_discount
									+ "%</font></small>"
							var sale_price = result[i].game.game_price
									* (100 - result[i].event.event_discount)
									* 0.01;
							str += "<small class='price'>" + sale_price
									+ "원</small>";
							str += "<p>" + result[i].game.game_detail + "</p>";
							str += "<a href='/client/pay/cart.jsp?game_id="+result[i].game.game_id+"' class='button'>Add to cart</a>&nbsp";
							str += "<a href='/client/pay/pay.jsp?game_id="+result[i].game.game_id+"' class='button' style='background-color:orange'>Buy This</a>";
							str += "</div>";
							str += "</div>";
						}
						$("#sale-product").append(str);
					}
				});
	}
</script>
</head>
<body class="slider-collapse">
	<div id="site-content">
		<!-- Top -->
		<div class="home-slider">
			<ul class="slides">
			</ul>
		</div>

		<!-- .home-slider -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<section>
					<header>
						<h2 class="section-title">New Products</h2>
						<!-- 전체 상품 보기 -->
						<a href="/client/game/products.jsp" class="all">Show All</a>
					</header>
					<!-- 상품 정보 -->
					<div class="product-list" id="new-product"></div>
					<!-- .product-list -->
				</section>
				<hr>
				<section>
					<header>
						<h2 class="section-title">Sales Product</h2>
						<a href="/client/game/products.jsp" class="all">Show All</a>
					</header>
					<div class="product-list" id="sale-product"></div>
					<!-- .product-list -->
				</section>
			</div>
		</div>
		<!-- .container --> </main>
	</div>
	<div class="overlay"></div>
</body>
</html>