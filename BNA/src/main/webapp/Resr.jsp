<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import ="java.util.Vector" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
//	String id = request.getParameter("id");
	ReserveDAO rdao = new ReserveDAO();
	Vector<ReserveVO> vl = rdao.getAllReserveLod();
	Vector<ReserveVO> va = rdao.getAllReserveLod();

%>
</head>
<body>
<!-- 헤더 -->
<table border=1 width="1280px" align="center">
<tr><td>로고</td><td>고객페이지</td></tr>
</table>
<!-- 바디 -->
<table width="1280px" align="center">
	<tr><td><h2>숙소</h2></td></tr>
	<tr>
		<td>
		<% 
		for(int i=0;i<vl.size();i++){
		ReserveVO rvo = vl.get(i);
		if(rvo.getLodname()!=null){
		%>
			<table style="border-radius:30px; overflow:hidden; box-shadow:0px 0px 10px 0px gray; border-collapse: collapse;" width="900px" height="200px" onclick="location.href='LodResrDetail.jsp?lodresnum=<%=rvo.getLodresnum()%>'">
				<tr><td colspan="2" width="470px" height="70px" style="padding:15px; border-bottom:1px solid gray"><%=rvo.getLodname() %></td><td style="margin:0px; padding:0px;" rowspan="2" width="300px"><img style="display:block" src="images/<%=rvo.getLodimg1()%>" width="400px" height="200px"></td></tr>
				<tr><td  width="120px" height="69px" style="padding:15px; border-right:1px solid gray"><%=rvo.getLodchkin() %>-<br><%=rvo.getLodchkout() %></td><td width="320px" style="padding:15px"><%=rvo.getLodaddr() %></td></tr>
			</table><br>
		
		<%}else out.print("예약된 숙소가 없습니다.");
		}
		%>
		</td>
		
	</tr>
	<tr><td><h2>체험</h2></td></tr>
	<tr>
		<td>
		<% 
		for(int i=0;i<va.size();i++){
		ReserveVO rvo = va.get(i);
		if(rvo.getActname()!=null){
		%>
			<table style="border-radius:30px; overflow:hidden; box-shadow:0px 0px 10px 0px gray; border-collapse: collapse;" width="900px" height="200px" onclick="location.href='LodResrDetail.jsp?actresnum=<%=rvo.getActresnum()%>'">
				<tr><td colspan="2" width="470px" height="70px" style="padding:15px;border-bottom:1px solid gray"><%=rvo.getActname() %></td><td style="margin:0px; padding:0px;" rowspan="2" width="300px"><img  style="display:block" src="images/<%=rvo.getActimg1()%>" width="400px" height="200px"></td></tr>
				<tr><td width="120px" height="69px" style="padding:15px; border-right:1px solid gray"><%=rvo.getActchkin() %>-<br><%=rvo.getActchkout() %></td><td width="320px" style="padding:15px"><%=rvo.getActaddr() %></td></tr>
			</table>
		<% 
		}else out.print("예약된 체험이 없습니다.");
		}
		%>
		</td>
	</tr>
</table>

</body>
</html>