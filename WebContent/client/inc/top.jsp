<%@ page contentType="text/html; charset=UTF-8"%>
<script>
$(function(){
	$("#searchGame").keydown(function(key) {
		if (key.keyCode == 13) {
			if($("#searchGame").val()==""){
				alert("검색하고 싶은 게임 이름을 입력해주세요");
				return;
			}
			searchGame();
		}
	});
})

function searchGame(){
	$.ajax({
		url:"/rest/client/game/search",
		type:"get",
		data:{
			game_name:$("#searchGame").val()
		},
		success:function(result){
			if(result==0){
				alert("일치하는 정보가 없습니다");
				return;
			}
			location.href="/client/game/single.jsp?game_id="+result.game_id;
		}
	});
}

function popup(){
	alert();
	$("#gamepop").append("<table></table>");
}
</script>
<div class="site-header">
	<div class="container">
		<a href="../main/index.jsp" id="branding"> <img
			src="../images/logo.png" class="logo">
			<div class="logo-text">
				<h1 class="site-title">은기컴퍼니</h1>
			</div>
		</a>
		<!-- #branding -->
		<div class="right-section pull-right" style="float: right">
			<a href="/client/cart/cart.jsp" class="cart"><i class="icon-cart"></i>Cart</a> <a
				href="/client/login/index.jsp">Login/Register</a>
		</div>
		<!-- .right-section -->

		<div class="main-navigation">
			<button class="toggle-menu">
				<i class="fa fa-bars"></i>
			</button>
			<ul class="menu">
				<li class="menu-item home current-menu-item"><a
					href="../main/index.jsp"><i class="icon-home"></i></a></li>
				<li class="menu-item"><a href="/client/game/products.jsp">Games</a></li>
				<li class="menu-item"><a href="/client/event/index.jsp">Events</a></li>
				<li class="menu-item"><a href="/client/cart/cart.jsp">Cart</a></li>
				<li class="menu-item"><a href="/client/myPage/index.jsp">MyPage</a></li>
			</ul>
			<!-- .menu -->
			<div class="search-form">
				<label style="height: 50%"><img
					src="../images/icon-search.png"></label> <input type="text"
					placeholder="Search..." id="searchGame" style="text-indent:40px;" />
			</div>
			<!-- .search-form -->
			<div class="mobile-navigation"></div>
			<!-- .mobile-navigation -->
		</div>
	</div>
</div>