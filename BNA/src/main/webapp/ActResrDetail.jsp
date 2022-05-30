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
<!-- 헤더 -->
<table border=1 width=100%>
<tr><td>로고</td><td>고객페이지</td></tr>
</table>
<!-- 바디 -->
<table border=1 width=100%>
<tr>
	<td width=80%>예약상세목록
		<table border="1" width=100%>
			<tr><td colspan="2">사진</td></tr>
			<tr><td>체크인</td><td>체크아웃</td></tr>
			<tr><td colspan="2">인원</td></tr>
			<tr><td colspan="2">주소</td></tr>
			<tr><td colspan="2"><input type="button" onClick="location.href='ActResrUpdate.jsp'" value="예약변경"></td></tr>
			<tr><td colspan="2"><input type="button" onClick="location.href='ActResrDelete.jsp'" value="예약취소"></td></tr>
		</table>
	</td>
	<td><jsp:include page="map.jsp"></jsp:include></td>
</tr>
</table>
</body>
</html>