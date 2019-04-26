<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/style.jsp"%>
<%int game_id=Integer.parseInt(request.getParameter("game_id"));%>
<html>
<head>
<script>
$(function(){
	gameInfo();
	getImage();
})

function gameInfo(){
	$.ajax({
		type:"get",
		url:"/rest/client/games/<%=game_id%>",
		success:function(result){
			$(".entry-title").html(result.game_name);
			$(".price").html(result.game_price+"원");
			$("#detail_first").html(result.game_detail);
		}
	});
}

function getImage(){
	$.ajax({	     
		url : "/rest/client/game/images",
		type : "get",
		data : {
			game_id : <%=game_id%>
		},
		success : function(result) {
				switch (result.length) {
				case 1:
					$("#image_first").attr({
						'src' : '/data/game/' + result[0].img_filename
					});
					break;
				case 2:
					$("#image_first").attr({
						'src' : '/data/game/' + result[0].img_filename
					});
					$("#image_second").attr({
						'src' : '/data/game/' + result[1].img_filename
					});
					break;
				case 3:
					$("#image_first").attr({
						'src' : '/data/game/' + result[0].img_filename
					});
					$("#image_second").attr({
						'src' : '/data/game/' + result[1].img_filename
					});
					$("#image_third").attr({
						'src' : '/data/game/' + result[2].img_filename
					});
					break;
				case 4:
					$("#image_first").attr({
						'src' : '/data/game/' + result[0].img_filename
					});
					$("#image_second").attr({
						'src' : '/data/game/' + result[1].img_filename
					});
					$("#image_third").attr({
						'src' : '/data/game/' + result[2].img_filename
					});
					$("#image_fourth").attr({
						'src' : '/data/game/' + result[3].img_filename
					});
					break;
				default:
					$("#image_first").attr({
						'src' : '/data/game/' + result[0].img_filename
					});
					$("#image_second").attr({
						'src' : '/data/game/' + result[1].img_filename
					});
					$("#image_third").attr({
						'src' : '/data/game/' + result[2].img_filename
					});
					$("#image_fourth").attr({
						'src' : '/data/game/' + result[3].img_filename
					});	
				}
			}
		});
	}
</script>
<%@ include file="/client/inc/style.jsp"%>
<body>
	<div id="site-content" style="background-color:#2b2b2b">
		<!-- Top -->
		<%@ include file="/client/inc/top.jsp"%>
		<main class="main-content">
		<div class="container">
			<div class="page">
				<div class="entry-content">
					<div class="row">
						<div class="col-sm-6 col-md-4">
							<div class="product-images">
								<!-- 이미지들 -->
								<figure class="large-image">
									<a href="dummy/image-1.jpg"><img id="image_first"></a>
								</figure>
								<div class="thumbnails">
									<a href="dummy/image-2.jpg"><img id="image_second"></a> <a
										href="dummy/image-3.jpg"><img id="image_third"></a> <a
										href="dummy/image-4.jpg"><img id="image_fourth"></a>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-8">
							<h2 class="entry-title"></h2>
							<small class="price"></small>
							<!-- p 태그는 게임설명..  -->
							<p id="detail_first"></p>
							<p id="detail_second"></p>
							<p id="detail_third"></p>

							<!-- <div class="addtocart-bar" style="width: 30%"> -->
								<form action="#">
									<input type="button" value="Add to cart">
									<input type="button" value="Buy This">
								</form>
							<!-- </div> -->
						</div>
					</div>
					<br>
					<hr>
					<br>
					<div>
						<h1 id="my_nick">nivelian</h1>
						<h2>
							<a>추천</a>/
							<a>비추천</a>
						</h2>
						<textarea placeholder="댓글 입력...."></textarea>
						<br>
						<br>
						<input type="button" value="댓글 등록" />
					</div>
				</div>
			</div>
		</div>
		<!-- .container --> </main>
		<!-- .main-content -->
		<!-- bottom -->
	</div>
	<!-- 댓글 -->
</body>
</html>