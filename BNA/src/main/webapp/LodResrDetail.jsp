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
</head>
<body>
<%
int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveLod(lodresnum);

%>
<!-- 헤더 -->
<table border=1 align="center" width="1280px">
<tr><td>로고</td><td>고객페이지</td></tr>
</table>
<!-- 바디 -->
<table align="center" width="1280px">
	<tr>
		<td height="50px" colspan=2 style="padding:0px 15px 0px 15px;"><h2>예약상세목록</h2>
	</tr>
	<tr>
		<td>
			<table width="480px" height="700px">
				<tr><td colspan="2" width="470px" height="350px" align="center"><img src="images/<%=rvo.getLodimg1()%>" width="470px" height="350px"></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3><%=rvo.getLodname()%></h3></td></tr>			
				<tr><td style="width:225px; border-bottom:1px solid gray; border-right:1px solid gray; padding:0px 15px 15px 15px;"><h4>체크인</h4><%=rvo.getLodchkin() %></td><td style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;width:225px; "><h4>체크아웃</h4><%=rvo.getLodchkout() %></td></tr>
				<tr><td style="width:225px; border-bottom:1px solid gray; border-right:1px solid gray; padding:0px 15px 15px 15px;"><h4>인원</h4><%=rvo.getLodpeople() %></td><td style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;"><h4>가격</h4><%=rvo.getLodresprice() %></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 15px 15px;"><h4>주소</h4><%=rvo.getLodaddr() %></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3 onClick="location.href='LodResrUpdate.jsp?lodresnum=<%=rvo.getLodresnum() %>'">예약변경 ></h3></td></tr>
				<tr><td colspan="2" style="border-bottom:1px solid gray; padding:0px 15px 0px 15px;"><h3 onClick="location.href='LodResrDelete.jsp?lodresnum=<%=rvo.getLodresnum() %>'">예약취소 ></h3></td></tr>
			</table>
		</td>
		<td width="800px" height="800px" bgcolor="gray"><jsp:include page="LodResrmap.jsp"></jsp:include></td>
	</tr>
</table>
</body>
</html>