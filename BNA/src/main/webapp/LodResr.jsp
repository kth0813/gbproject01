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
int result1 = Integer.parseInt(request.getParameter("result1"));
int result2 = Integer.parseInt(request.getParameter("result2"));
//	ListDAO ldao = new ListDAO();
//	ListVO lvo = ldao.getOneLod(num);
	
//	int category = cvo.getCategory();
//	String str = null;
//	if(category==1)str="소형";
//	else if(category==2)str="중형";
//	else str="대형";
%>
<!-- 헤더 -->
<table border=1 width=100%>
<tr><td>로고</td></tr><%=result1 %>
</table>
<!-- 바디 -->
<form action="LodResrPro.jsp" method="post">
<table border=1 width=100%>
<tr>
	<td>
		<table border="1" width=100%>
			<tr><td>예약정보</td></tr>
			<tr><td>결제수단</td></tr>
			<tr><td>약관동의<br><input type="checkbox" required="required"></td></tr>
			<tr><td><input type="submit" value="확인버튼"></td></tr>
		</table>
	</td>
	<td>
		<table border=1 width=100%>
			<tr><td>숙소사진</td><td>숙소명</td></tr>
			<tr><td colspan="2">날짜</td></tr>
			<tr><td colspan="2">인원수</td></tr>
			<tr><td colspan="2">요금</td></tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>