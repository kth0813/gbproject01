<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<script>
window.onload = function() {
	today = new Date();
	tomorrow = new Date(today.getTime()+(1000*60*60*24));
	today = today.toISOString().slice(0, 10);
	tomorrow = tomorrow.toISOString().slice(0, 10);
	chkin = document.getElementById("today");
	chkout = document.getElementById("tomorrow");
	chkin.setAttribute("min", today);
	chkout.setAttribute("min", tomorrow);
}
 </script>
<style>
input[type=submit] {
width: 100%;
background-color:#DE1362;
color: white;
padding: 14px 20px;
margin: 8px 0;
border: none;
border-radius: 4px;
cursor: pointer;
}
input[type=button] {
width: 100%;
background-color:lightgray;
color: black;
font-size:large;
padding: 14px 20px;
margin: 8px 0;
border: none;
border-radius: 4px;
cursor: pointer;
}
</style>
</head>
<body>

<%
int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveLod(lodresnum);
int lodnum = rvo.getLodnum();
ListDAO ldao = new ListDAO();
ListVO lvo = ldao.getOneLod(lodnum);

int people = rvo.getLodpeople();
Date day1 = new SimpleDateFormat("yyyy-MM-dd").parse(rvo.getLodchkin());
Date day2 = new SimpleDateFormat("yyyy-MM-dd").parse(rvo.getLodchkout());
long day3 = (day2.getTime() - day1.getTime()) / (1000*24*60*60);
String loddate = String.valueOf(day3);
int lodresprice=lvo.getLodprice()*Integer.parseInt(loddate)+1000*(people);
%>
<!-- 바디 -->
<table width="1280px" style="border-collapse : collapse;">
	<tr>
		<td width="280px" style="background-color:lightgray;padding:15px 0px">
			<table align="center" width="200px">
				<tr>
					<td><image class="logo" src="images/logo.png" width="100px"><h3>예약변경</h3></td>
				</tr>
				<tr height="600px">
					<td></td>
				</tr>
				<tr>
					<td><input type="button" onClick="location.href='LodResrDetail.jsp?lodresnum=<%=rvo.getLodresnum() %>'" value="뒤로가기"></td>
				</tr>
			</table>
		</td>
		
		<td width="1080px">
			<form action="LodResrUpdatePro.jsp" method="post">
				<table align="center">
					<tr>
						<td><h3>예약 세부 정보</h3></td>
					</tr>
					<tr>
						<td><%=rvo.getLodname() %></td>
					</tr>
					<tr>
						<td><h4>예약 날짜</h4></td>
					</tr>
					<tr>
						<td><table style="width:400px;border-radius:15px;border:1px solid gray;padding:15px"><tr><td>체크인<br><input type="date" id="today" name="lodchkin" value="<%=rvo.getLodchkin()%>"></td><td>체크아웃<br><input type="date" id="tomorrow" name="lodchkout" value="<%=rvo.getLodchkout()%>"></td></tr></table></td>
					</tr>
					<tr>
						<td><table style="width:400px;border-radius:15px;border:1px solid gray;padding:15px"><tr><td>게스트</td><td align="center"><input type="number" min=1 max=4 step=1 value="<%=rvo.getLodpeople() %>" name="lodpeople"> 명</td></tr></table></td>
					</tr>
					<tr>
						<td><h4>환불정책</h4><%=rvo.getLodchkin() %>일 이전에 예약 취소시 전액 환불됩니다.<br>이후엔 환불 불가능합니다.<br>확인 <input type="checkbox" required="required"></td>
					</tr>
					<tr>
						<td style="padding:15px 0px">
							<input type="hidden" name="loddate" value="<%=loddate %>">
							<input type="hidden" name="lodresnum" value="<%=rvo.getLodresnum() %>">
							<input type="hidden" name="lodresprice" value="<%=lodresprice %>">
							<input type="submit" value="예약변경요청">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>

</body>
</html>