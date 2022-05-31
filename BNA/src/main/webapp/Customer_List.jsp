<%@page import="bna.VO.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bna.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Customer.css?ver=1">
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="8">회원 정보</td>
		</tr>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>나이</th>
			<th>주소</th>
		</tr>
		<!-- 반복해서 회원 전체 정보를 가져와야함 데이터베이스에서 -->
		<%
		CustomerDAO cdao = new CustomerDAO();
		ArrayList<CustomerVO> arr =  cdao.selectAll();
		for(int i=0; i<arr.size(); i++){
			CustomerVO cvo = arr.get(i);
		%>
		<tr>
			<td><%=cvo.getName()%></td>
			<td><%=cvo.getId()%></td>
			<td><%=cvo.getPasswd1()%></td>
			<td><%=cvo.getMail()%></td>
			<td><%=cvo.getTele()%></td>
			<td><%=cvo.getAge()%></td>
			<td><%=cvo.getAddress()%></td>
			<td><input type="button" onclick="location.href='Customer_delete.jsp?id=<%=cvo.getId()%>'" value="삭제"></td>
		</tr>
		<%
		}
		%>
	</table>
	
</body>
</html>