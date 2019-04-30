<%@page import="game.model.domain.Member"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/top.jsp"%>
<%!
	Member member;
	int member_id;
	int game_id;
%>
<html>
<head>
<%@ include file="/client/inc/style.jsp"%>
<script>
$(function(){
	<%if(session.getAttribute("member")==null){%>
		alert("로그인이 필요한 서비스입니다.");
		location.href="/client/login/index.jsp";
	<%
		}else{
		member_id=member.getMember_id();
		}
	
		if(request.getParameter("game_id")==null){
	%>
		getCart();
	<%
		}else{
		game_id=Integer.parseInt(request.getParameter("game_id"));
	%>
		registCart();
	<%}%>
})

function getCart(){
	$.ajax({
		url:"/rest/client/pay/cart/<%=member_id %>",
		type:"get",
		success:function(result){
			if(result.length==0){
				alert("장바구니에 상품이 없습니다.");
				history.back();
			}else{
				for(var i=0;i<result.length;i++){
					getCartDetail(result[i].cart_id);
				}
			}
		}
	});
}

function registCart(){
	$("form").attr({
		action:"/client/pay/cart/regist",
		method:"post"
	});
	$("form").submit();
	alert("장바구니에 상품이 등록되었습니다");
}

function getCartDetail(cart_id){
	$.ajax({
		url:"/rest/client/pay/cart/"+cart_id,
		type:"post",
		success:function(result){
			var str="";
			str+="<tr>";
			str+="<td class='product-name'>";
			str+="<div class='product-thumbnail'>";
			str+="<img name='cart-img"+result.game_id+"'>";
			str+="</div>";
			str+="<div class='product-detail'>";
			str+="<h3 class='product-title'>"+result.game_name+"</h3>";
			str+="<p>"+result.game_detail+"</p>";
			str+="</div>";
			str+="</td>";
			str+="<td class='product-price'>"+result.game_price+"원</td>";
			str+="<td class='product-qty'>-"+result.game_sale+"%</td>";
			str+="<td class='product-total'>"+(result.game_price-result.game_sale)+"원</td>";
			str+="<td class='product-total' style='text-align:center'>";
			str+="<input type='checkBox'/>";
			str+="</td>";
			str+="</tr>";
			
			getCartImg(result.game_id);
			$("tbody").append(str);
		}
	});
}

function getCartImg(game_id){
	$.ajax({
		url:"/rest/client/pay/cart/image",
		type:"get",
		data:{
			"game_id":game_id
		},
		success:function(result){
			$("img[name='cart-img"+game_id+"']").attr({
				src:"/data/game/"+result[0].img_filename
			});
		}
	});
}
</script> 
</head>
<body>
	<form>
		<input type="hidden" name="game_id" value="<%=game_id %>"/>
		<input type="hidden" name="member_id" value="<%=member_id %>"/>
	</form>
	<div id="site-content">
		<!-- Top -->
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
							<th class="product-total">Select</th>							
						</tr>
					</thead>
					<tbody>
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
						<input type="hidden" id="game_id"/>
						<a href="/client/game/products.jsp" class="button muted">쇼핑 계속하기</a>
						<a href="/client/pay/pay.jsp" class="button">결제하기</a>
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