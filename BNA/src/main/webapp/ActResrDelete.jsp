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
int actresnum = Integer.parseInt(request.getParameter("actresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveAct(actresnum);;
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
    	<!-- 헤더 -->
        <header id="header">
            <div class="header_inner">
                <h2><image class="logo" src="./images/logo.png"/></h2>
                <div class="header_btn">
                    <ul>
                        <li><span>어디든지</span></li>
                        <li><span>언제든 일주일</span></li>
                        <li><span>게스트 추가</span> <a href="javascript:;" class="search_icon"></a></li>
                    </ul>
                </div>
    
                <div class="user_menu">
					<ul>
						<li><a href="javascript:;"><image class="profile btn-open-popup" src="./images/profile.png"></a></li>
					</ul>
                </div>
                <div class="modal public">
                    <ul>
                        <li>로그인</li>
                        <li>회원가입</li>
                    </ul>
                </div>
                <div class="modal private">
                    <ul>
                        <li>내정보</li>
                        <li>로그아웃</li>
                    </ul>
                </div>
            </div>
        </header>		
		<!-- 바디 -->
		<br><br><br>
		<form action="ActResrDeletePro.jsp" method="post">
			<div class="main">
				<div class="left">
					<div class="actdeletebox" align="center">
						<div><h2>예약취소</h2></div>
						<div class="actresprice2"><h4>환불금액</h4>￦<%=rvo.getActresprice() %></div>
						<div class="actref"><h4>환불설명</h4><%=rvo.getActchkin() %>일 이전에 예약 취소시 전액 환불됩니다.<br>이후엔 환불 불가능 합니다.<br>확인 <input type="checkbox" required="required"></div>
						<div class="actref2"><input type="hidden" name="actresnum" value="<%=rvo.getActresnum() %>"><input type="submit" value="취소 요청하기"></div>
					</div>
				</div>
				<div class="right">
					<div class="actresbox">
						<div class="actimg"><img class="actimg2" src="images/<%=rvo.getActimg1()%>"></div>
						<div class="actname"><%=rvo.getActname() %></div>
						<div class="actdate">날짜</div>
						<div class="actdate"><%=rvo.getActchkin()%> ~ <%=rvo.getActchkout()%></div>
						<div class="actpeople">게스트</div>
						<div class="actpeople"><%=rvo.getActpeople()%>명</div>
						<div class="actresprice">요금</div>
						<div class="actresprice">￦<%=rvo.getActresprice()%></div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>