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
<script src="./js/ActDetail.js"></script>
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
<tr><td>로고</td><td>검색창</td><td>고객페이지</td></tr>
</table>
<!-- 바디 -->
<table border=1 width=100%>
<tr>
	<td colspan="2">
		<table border=1 width=100%>
			<tr><td>체험이름</td></tr>
			<tr><td>체험사진</td></tr>
		</table>
	</td>
</tr>
<tr>
	<td>
		<table border="1" width=100%>
			<tr><td>체험 상세정보</td></tr>
		</table>
	</td>
	<td>
		<form action="ActResr.jsp" method="post">
		<table border=1 width=100%>
			<tr><td>체크인</td><td>체크아웃</td></tr>
			<tr><td colspan="2">인원</td></tr>
			<tr><td colspan="2">예약버튼</td></tr>
			<tr><td colspan="2">요금</td></tr>
		</table>
		</form>
	</td>
</tr>
<tr>
	<td colspan="2">
		<table border=1 width=100%>
			<tr><td>체험 지도<br><jsp:include page="ActMap.jsp"></jsp:include>체험주소</td></tr>
			<tr><td>체험 후기</td></tr>
		</table>
	</td>
</tr>
</table>
</body>
</html>