<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="rvo" class="bna.vo.ReserveVO">
		<jsp:setProperty name="rvo" property="*"/>
	</jsp:useBean>
<%
			//데이터베이스 클래스에 대한 객체 생성
			ReserveDAO rdao = new ReserveDAO();
			rdao.setReserveLod(rvo);

			//회원정보 목록 보기로 이동
			response.sendRedirect("Resr.jsp?id=user");
%>

</body>
</html>

