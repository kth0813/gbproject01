<%@page import="bna.vo.ReserveVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<%
int actresnum = Integer.parseInt(request.getParameter("actresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveAct(actresnum);

%>
<link rel="stylesheet" href="css/detail.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/swiper.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/swiper.min.js"></script>
</head>
<body>
<!-- 헤더 -->
<div id="wrap">
	<div class="wrap_inner">
    	<!-- 헤더 -->
		<jsp:include page="header.jsp" flush="false"/>
<!-- 바디 -->
<div class="resdetbox">
	<div class="title"><h2>예약상세목록</h2></div>
	<div class="resdetbox2">
		<div class="img2"><img src="images/<%=rvo.getActimg1()%>" width="470px" height="350px"></div>
		<div class="name2"><h3><%=rvo.getActname()%></h3></div>			
		<div class="chkin2"><h4>체크인</h4><%=rvo.getActchkin() %></div>
		<div class="chkout2"><h4>체크아웃</h4><%=rvo.getActchkout() %></div>
		<div class="people2"><h4>인원</h4><%=rvo.getActpeople() %></div>
		<div class="price2"><h4>가격</h4><%=rvo.getActresprice() %></div>
		<div class="addr2"><h4>주소</h4><%=rvo.getActaddr() %></div>
		<div class="update2"><h3 onClick="location.href='ActResrUpdate.jsp?actresnum=<%=rvo.getActresnum() %>'">예약변경 ></h3></div>
		<div class="delete2"><h3 onClick="location.href='ActResrDelete.jsp?actresnum=<%=rvo.getActresnum() %>'">예약취소 ></h3></div>
	</div>
	<div class="map2">		
		<jsp:include page="ActResrmap.jsp"></jsp:include>
	</div>
</div>
</body>
</html>