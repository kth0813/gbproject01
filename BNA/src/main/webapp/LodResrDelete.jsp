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
int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveLod(lodresnum);;
%>
<!-- 헤더 -->
<table border=1 width="1280px" align="center">
	<tr>
		<td>로고<%=rvo.getLodresnum() %></td>
		<td>고객페이지</td>
	</tr>
</table>
<!-- 바디 -->
<form action="LodResrDeletePro.jsp" method="post">
	<table width="1280px" height="600px" align="center">
		<tr>
			<td width="800px">
				<table align="center" width="600px">
					<tr><td colspan=2><h3>예약취소</h3></td></tr>
					<tr><td style="padding:15px 0px;border-bottom:1px solid gray"><h4>환불금액</h4>￦<%=rvo.getLodresprice() %></td></tr>
					<tr><td style="padding:15px 0px;border-bottom:1px solid gray"><h4>환불설명</h4><%=rvo.getLodchkin() %>일 이전에 예약 취소시 전액 환불됩니다.<br>이후엔 환불 불가능 합니다.<br>확인 <input type="checkbox" required="required"></td></tr>
					<tr><td style="padding:15px 0px;"><input type="hidden" name="lodresnum" value="<%=rvo.getLodresnum() %>">
					<input type="submit" value="취소버튼"></td></tr>
				</table>
			</td>
			<td width="480px">
				<table style="border-radius:15px;padding:15px;border:1px solid gray" width=100%>
					<tr><td style="padding:15px 0px;border-bottom:1px solid gray"><img style="border-radius:15px;" src="images/<%=rvo.getLodimg1()%>" width="100px" height="100px"></td><td style="border-bottom:1px solid gray"><%=rvo.getLodname() %></td></tr>
					<tr><td style="padding:15px 0px;">날짜</td><td><%=rvo.getLodchkin()%> ~ <%=rvo.getLodchkout()%></td></tr>
					<tr><td style="padding:15px 0px;border-bottom:1px solid gray">게스트</td><td style="border-bottom:1px solid gray"><%=rvo.getLodpeople()%>명</td></tr>
					<tr><td style="padding:15px 0px;">요금</td><td>￦<%=rvo.getLodresprice()%></td></tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>