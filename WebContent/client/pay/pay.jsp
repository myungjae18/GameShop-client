<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/client/inc/style.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(function(){
	<%if(session.getAttribute("member")==null){%>
		alert("로그인이 필요한 서비스입니다.");
		history.back();
	<%}	%>
	<%if(request.getParameter("game_id")==null){%>
		alert("비정상적인 접근입니다");
	<%}else{%>
		order(<%=request.getParameter("game_id")%>);
	<%}%>
})

function order(game_id){
	alert(game_id);
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
결제 페이지입니다.
</body>
</html>