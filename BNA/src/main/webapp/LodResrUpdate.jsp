<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//	int num = Integer.parseInt(request.getParameter("num"));
//	ListDAO ldao = new ListDAO();
//	ListVO lvo = ldao.getOneLod(num);
	
//	int category = cvo.getCategory();
//	String str = null;
//	if(category==1)str="소형";
//	else if(category==2)str="중형";
//	else str="대형";
%>
<!-- 바디 -->
<form action="LodResrUpdatePro.jsp" method="post">
<table border=1 width=100%>
<tr>
	<td>
		<table border="1" width=100%>
			<tr><td>로고</td></tr>
			<tr><td>예약변경</td></tr>
			<tr><td><input type="button" onClick="location.href='LodResrDetail.jsp'" value="뒤로버튼"></td></tr>
		</table>
	</td>
	<td>
		<table>
			<tr><td>숙소이름</td></tr>
			<tr><td>날짜</td></tr>
			<tr><td>인원</td></tr>
			<tr><td>변경설명<input type="checkbox" required="required"></td></tr>
			<tr><td><input type="submit" value="변경요청버튼"></td></tr>
		</table></td>
</tr>
</table>
</form>
</body>
</html>