<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/style.jsp"%>
<%@ include file="/client/inc/top.jsp"%>
<html>
<head>
<script>
$(function(){
	getGames();
})

function getGames(){
	$.ajax({
		type:"get",
		url:"/rest/client/games",
		success:function(result){
			var str="";
			for(var i=0;i<result.length;i++){
				str+="<div class='product'>";
				str+="<div class='inner-product'>";
				str+="<div class='figure-image'>";
				str+="<a href='single.jsp?game_id="+result[i].game_id+"'><img name='"+result[i].game_id+"'></a>";
				str+="</div>";
				str+="<h3 class='product-title'>";
				str+="<a href='single.jsp?game_id="+result[i].game_id+"'>"+result[i].game_name+"</a>";
				str+="</h3>";
				str+="<p>"+result[i].game_price+"원</p>";
				str+="<a onclick='cart("+result[i].game_id+")' class='button'>Add to cart</a>";
				str+="</div>";
				str+="</div>";
				getImages(result[i].game_id);				
			}
			$(".product-list").append(str);
		}
	});
}

function getImages(game_id, fileName){
	$.ajax({
		url:"/rest/admin/game/images",
		type:"get",
		data:{
			game_id:game_id
		},
		success:function(result){
			$("img[name='"+game_id+"']").attr({
				'src':'/data/game/'+result[0].img_filename
			});
		} 
	});
}

function sort(){
	$.ajax({
		url:"/rest/client/game/sort",
		type:"get",
		data:{
			"category_id":$("select[name='category_id']").val()
		},
		success:function(result){
			if(result.length==0){
				alert("일치하는 게임이 없습니다");
				return;
			}
			$(".product-list").html("");
			var str="";
			for(var i=0;i<result.length;i++){
				str+="<div class='product'>";
				str+="<div class='inner-product'>";
				str+="<div class='figure-image'>";
				str+="<a href='single.jsp?game_id="+result[i].game_id+"'><img name='"+result[i].game_id+"'></a>";
				str+="</div>";
				str+="<h3 class='product-title'>";
				str+="<a href='single.jsp?game_id="+result[i].game_id+"'>"+result[i].game_name+"</a>";
				str+="</h3>";
				str+="<p>"+result[i].game_price+"원</p>";
				str+="<a onclick='cart("+result[i].game_id+")' class='button'>Add to cart</a>";
				str+="</div>";
				str+="</div>";
				getImages(result[i].game_id);				
			}
			$(".product-list").append(str);			
		}
	});
}

function cart(game_id){
	<%if(member==null){%>
	alert("로그인이 필요한 서비스입니다");
	<%}else{%>
	location.href="/client/pay/cart.jsp?game_id="+game_id;
	<%}%>
}
</script>
</head>
<body>
	<div id="site-content" style="background-color:#2b2b2b">
		<!-- Top -->
		<main class="main-content">
		<div class="container">
			<div class="page">
				<div class="filter-bar">
					<div class="filter">
						<span> <label>정렬 :</label> 
						<select id="sortList">
								<option value="1">인기 순</option>
								<option value="2">높은 점수 순</option>
								<option value="3">가격 순</option>
								<option value="4">최신 상품 순</option>
						</select>
						</span>
						<span><label>카테고리 :</label>
						<select name="category_id">
								<option value="0">모두</option>
								<option value="7">공포</option>
								<option value="8">스포츠</option>
								<option value="9">시뮬레이션</option>
								<option value="10">액션</option>
								<option value="11">어드벤처</option>
								<option value="12">전략</option>
						</select>
						<a class="button" onclick="sort()">정렬</a>
						</span>
					</div>
					<!-- .filter -->
				</div>
				<!-- .filter-bar -->
				<div class="product-list"></div>
				<!-- .product-list -->
				<div class="pagination-bar">
					<a href="#" class="page-number"><i class="fa fa-angle-left"></i></a>
                        <span class="page-number current">1</span>
                        <a href="#" class="page-number">2</a>
                        <a href="#" class="page-number">3</a>
                        <a href="#" class="page-number">...</a>
                        <a href="#" class="page-number">12</a>
                        <a href="#" class="page-number"><i class="fa fa-angle-right"></i></a>
				</div>
			</div>
		</div>
		</main>
</body>
</html>