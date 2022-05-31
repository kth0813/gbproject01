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
<script>
function getShow(){
	document.getElementById("not1").style.display = "";
	not2.innerHTML = "";
	not3.innerHTML = "성인 : <span id='resultA'>2</span>명 어린이 : <span id='resultC'>0</span>명";
}

function printA()  {
	  const apeople = document.getElementById('apeople').value;
	  document.getElementById("resultA").innerText = apeople;
}
function printC()  {
	  const cpeople = document.getElementById('cpeople').value;
	  document.getElementById("resultC").innerText = cpeople;
}
</script>
</head>
<body>

<%
int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
ReserveDAO rdao = new ReserveDAO();
ReserveVO rvo = rdao.getOneReserveLod(lodresnum);;
%>
<!-- 바디 -->
<form action="LodResrUpdatePro.jsp" method="post">
<table border=1 width="1280px">
<tr>
	<td width="280px">
		<table align="center" width="200px">
			<tr><td>로고<h3>예약변경</h3></td></tr>
			<tr height="600px"><td></td></tr>
			<tr><td><input type="button" onClick="location.href='LodResrDetail.jsp?lodresnum=<%=rvo.getLodresnum() %>'" value="뒤로버튼"></td></tr>
		</table>
	</td>
	<td width="1080px">
		<table align="center">
			<tr><td><h3>예약 세부 정보</h3></td></tr>
			<tr><td><%=rvo.getLodname() %></td></tr>
			<tr><td><h4>예약 날짜</h4></td></tr>
			<tr><td><table style="width:400px;border-radius:15px;border:1px solid gray;padding:15px"><tr><td>체크인<br><input type="date" id="today" value="<%=rvo.getLodchkin()%>"></td><td>체크아웃<br><input type="date" id="tomorrow" value="<%=rvo.getLodchkout()%>"></td></tr></table></td></tr>
			<tr><td colspan=2 style="padding:15px 0px"><h4>인원</h4><table style="width:400px;border-radius:15px;border:1px solid gray;padding:15px"><tr><td><a onclick="getShow()" id="not2">성인 : <span id='resultA'>2</span>명 어린이 : <span id='resultC'>0</span>명 ▼</a><a onclick="getHide()" id="not3"></a>
				<div style="display:none" id="not1"><table width=100%>
					<tr><td>성인<br>만 13세 이상</td><td align="center"><input type="number" min=1 max=4 step=1 value=2 id="apeople" name="apeople" onchange='printA()'></td></tr>
					<tr><td>어린이<br>만 12세 이하</td><td align="center"><input type="number" min=0 max=4 step=1 value=0 id="cpeople" name="cpeople" onchange='printC()'></td></tr>
				</table></div></table></td></tr>
			<tr><td><h4>환불정책</h4><%=rvo.getLodchkin() %>일 이전에 예약 취소시 전액 환불됩니다.<br>이후엔 환불 불가능합니다.<br>확인 <input type="checkbox" required="required"></td></tr>
			<tr><td style="padding:15px 0px"><input type="submit" value="변경요청버튼"></td></tr>
		</table></td>
</tr>
</table>
</form>
</body>
</html>