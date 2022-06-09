<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<%
int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveLod(lodresnum);;
%>
<link rel="stylesheet" href="css/resdelete.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/swiper.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/ui.common.js?v=<?php echo time(); ?>"></script>
</head>
<body>

<div id="wrap">
	<div class="wrap_inner">
		<!-- 바디 -->
		<br><br><br>
		<form action="LodResrDeletePro.jsp" method="post">
			<div class="main">
				<div class="left">
					<div class="loddeletebox" align="center">
						<div><h2>예약취소</h2></div>
						<div class="lodresprice2"><h4>환불금액</h4>￦<%=rvo.getLodresprice() %></div>
						<div class="lodref"><h4>환불설명</h4><%=rvo.getLodchkin() %>일 이전에 예약 취소시 전액 환불됩니다.<br>이후엔 환불 불가능 합니다.<br>확인 <input type="checkbox" required="required"></div>
						<div class="lodref2"><input type="hidden" name="lodresnum" value="<%=rvo.getLodresnum() %>"><input type="submit" value="취소 요청하기"></div>
					</div>
				</div>
				<div class="right">
					<div class="lodresbox">
						<div class="lodimg"><img class="lodimg2" src="images/<%=rvo.getLodimg1()%>"></div>
						<div class="lodname"><%=rvo.getLodname() %></div>
						<div class="loddate">날짜</div>
						<div class="loddate"><%=rvo.getLodchkin()%> ~ <%=rvo.getLodchkout()%></div>
						<div class="lodpeople">게스트</div>
						<div class="lodpeople"><%=rvo.getLodpeople()%>명</div>
						<div class="lodresprice">요금</div>
						<div class="lodresprice">￦<%=rvo.getLodresprice()%></div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>