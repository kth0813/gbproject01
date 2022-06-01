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
<script src="js/LodDetail.js"></script>
<%
	int lodnum = Integer.parseInt(request.getParameter("lodnum"));
	ListDAO ldao = new ListDAO();
	ListVO lvo = ldao.getOneLod(lodnum);
%>
</head>
<body>
	   
<!-- 헤더 -->
<table border=1 width="1280px" align="center">
<tr><td align="center"><a href="javascript:;"><img src="./images/logo.png" width="93px" height="40px"></a></td>
<td>
	<div id="wrap">
 		<div class="wrap_inner" align="center">
			<header id="header" align="center">
				<div class="header_inner">
                	<div class="header_btn">
	                    <ul>
	                        <li><span>어디든지</span></li>
	                        <li><span>언제든 일주일</span></li>
	                        <li><span>게스트 추가</span> <a href="javascript:;" class="search_icon"></a></li>
						</ul>
                	</div>
 				</div>
            </header>
        </div>
    </div>
</td>
<td><div id="wrap">
	    <div class="wrap_inner">
	        <header id="header">
	            <div class="header_inner">
	                <div class="user_menu">
	                    <ul>
	                        <li><a href="javascript:;">icon</a></li>
	                        <li><a href="javascript:;">icon</a></li>
	                    </ul>
					</div>
				</div>
			</header> 
		</div>
	</div>
</td></tr>
</table>
<!-- 바디 -->
<table width="1280px" align="center">
	<tr>
		<td colspan="2">
			<table width=100%>
				<tr>
					<td><h2><%=lvo.getLodname()%></h2></td>
				</tr>
				<tr>
					<td>
						<table style="border-spacing:10px" width=100%>
							<tr>
								<td rowspan="2" width=50% height=50%><img src="images/<%=lvo.getLodimg1()%>" width="620px" height="636px"></td>
								<td width=25%><img src="images/<%=lvo.getLodimg2()%>" width="310px" height="310px"></td>
								<td width=25%><img src="images/<%=lvo.getLodimg3()%>" width="310px" height="310px"></td>
							</tr>
							<tr>
								<td width=25%><img src="images/<%=lvo.getLodimg4()%>" width="310px" height="310px"></td>
								<td width=25%><img src="images/<%=lvo.getLodimg5()%>" width="310px" height="310px"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="70%">
			<table height="100%" width="100%;">
				<tr>
					<td><h2>숙소정보</h2><%=lvo.getLodinfodet()%><br><br><hr></td>
				</tr>
				<tr>
					<td><h2>숙소규칙</h2><%=lvo.getLodrule()%><br><br><hr></td>
				</tr>
				<tr>
					<td><h2>숙소시설</h2><%=lvo.getLodfac()%><br><br><hr></td>
				</tr>
				<tr>
					<td><h2>숙소옵션</h2><%=lvo.getLodopt()%><br><br><hr></td>
				</tr>
			</table>
		</td>
		<td width="30%">
			<form action="LodResr.jsp?lodnum=1" method="post">
				<table style="border:1px solid black;border-radius:15px;padding:0px 15px" width=100%>
					<tr>
						<td style="padding:15px">￦<%=lvo.getLodprice() %> / 박</td>
					</tr>
					<tr>
						<td>
							<table align="center" style="border:1px solid black;border-radius:15px;">
								<tr style="border-bottom:1px solid gray">
									<td style="padding:15px;border-right:1px solid gray;border-bottom:1px solid gray">체크인<br><input type="date" id="today" name="today"></td>
									<td style="padding:15px;border-bottom:1px solid gray">체크아웃<br><input type="date" id="tomorrow" name="tomorrow"></td>
								</tr>
								<tr>
									<td colspan=2 style="padding:15px">인원
										<table width=100%>
											<tr>
												<td style="padding:15px;">게스트</td>
												<td align="center"><input type="number" min=1 max=4 step=1 value=2 id="people" name="people">명</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding:15px"><input type="submit" value="예약버튼"></td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<table width=100%>
				<tr>
					<td><h2>숙소 지도</h2><br><jsp:include page="LodMap.jsp?lodnum=<%=lvo.getLodnum()%>"></jsp:include><br><br><hr></td>
				</tr>
				<tr>
					<td><h2>숙소주소</h2><br><%=lvo.getLodaddr()%><br><br><hr></td>
				</tr>
				<tr>
					<td><h2>숙소 후기</h2></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<table border=1 align="center" width="1280px">
	<tr>
		<td align="center">푸터</td>
	</tr>
</table>
</body>
</html>