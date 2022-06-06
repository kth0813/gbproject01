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
<title>Insert title here</title>
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
<script src="js/ui.common.js?v=<?php echo time(); ?>"></script>
</head>
<body>
<!-- 헤더 -->
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
	</div>
</div>
<!-- 바디 -->
<table align="center" width="1280px">
	<tr>
		<td height="50px" colspan=2 style="padding:0px 15px 0px 15px;"><h2>예약상세목록</h2>
	</tr>
	<tr>
		<td>
			<table width="480px" height="700px">
				<tr><td colspan="2" width="470px" height="350px" align="center"><img src="images/<%=rvo.getActimg1()%>" width="470px" height="350px"></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3><%=rvo.getActname()%></h3></td></tr>			
				<tr><td style="width:225px; border-bottom:1px solid gray; border-right:1px solid gray; padding:0px 15px 15px 15px;"><h4>체크인</h4><%=rvo.getActchkin() %></td><td style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;width:225px; "><h4>체크아웃</h4><%=rvo.getActchkout() %></td></tr>
				<tr><td style="width:225px; border-bottom:1px solid gray; border-right:1px solid gray; padding:0px 15px 15px 15px;"><h4>인원</h4><%=rvo.getActpeople() %></td><td style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;"><h4>가격</h4><%=rvo.getActresprice() %></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;"><h4>주소</h4><%=rvo.getActaddr() %></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3 onClick="location.href='ActResrUpdate.jsp?actresnum=<%=rvo.getActresnum() %>'">예약변경 ></h3></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3 onClick="location.href='ActResrDelete.jsp?actresnum=<%=rvo.getActresnum() %>'">예약취소 ></h3></td></tr>
			</table>
		</td>
		<td width="800px" height="800px" bgcolor="gray"><jsp:include page="ActResrmap.jsp"></jsp:include></td>
	</tr>
</table>
</body>
</html>