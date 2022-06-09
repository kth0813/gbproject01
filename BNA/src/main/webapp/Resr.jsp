<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
<%@ page import ="java.util.Vector" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<%
	String id = (String)session.getAttribute("id");
	ReserveDAO rdao = new ReserveDAO();
	Vector<ReserveVO> vl = rdao.getAllReserveLod(id);
	Vector<ReserveVO> va = rdao.getAllReserveAct(id);
%>
<link rel="stylesheet" href="css/detail.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/swiper.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/ui.common.js?v=<?php echo time(); ?>"></script>
</head>
<body>
<!-- 헤더 -->
<div id="wrap">
	<div class="wrap_inner">
    	<!-- 헤더 -->
		<jsp:include page="header.jsp" flush="false"/>
		<!-- 바디 -->
		<main id="main">
			<h2>숙소</h2><br>
				<% 
				for(int i=0;i<vl.size();i++){
				ReserveVO rvo = vl.get(i);
				if(rvo.getLodname()!=null){
				%>
			<div class="lodresbox" onclick="location.href='LodResrDetail.jsp?lodresnum=<%=rvo.getLodresnum()%>'">
				<div class="lodresname"><%=rvo.getLodname() %></div>
				<div class="lodresimg"><img style="display:block" src="images/<%=rvo.getLodimg1()%>" width="400px" height="200px"></div>
				<div class="lodresdate"><%=rvo.getLodchkin() %> ~ <%=rvo.getLodchkout() %></div>
				<div class="lodresaddr"><%=rvo.getLodaddr() %></div>
			</div><br>	
				<%
					}else{out.print("예약된 숙소가 없습니다.");}
				}
				%>	
			<br><h2>체험</h2><br>
				<% 
				for(int i=0;i<va.size();i++){
					ReserveVO rvo = va.get(i);
					if(rvo.getActname()!=null){
				%>
			<div class="actresbox" onclick="location.href='ActResrDetail.jsp?actresnum=<%=rvo.getActresnum()%>'">
				<div class="actresname"><%=rvo.getActname() %></div>
				<div class="actresimg"><img style="display:block" src="images/<%=rvo.getActimg1()%>" width="400px" height="200px"></div>
				<div class="actresdate"><%=rvo.getActchkin() %> ~ <%=rvo.getActchkout() %></div>
				<div class="actresaddr"><%=rvo.getActaddr() %></div>
			</div><br>	
				<%
					}else{out.print("예약된 체험이 없습니다.");}
				}
				%>	
		</main>		
	</div>
</div>
<script>
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
        if( modal.style.display === 'block'){
            modal.style.display = 'none';
        }else {
            modal.style.display = 'block';
        }
    });
</script>
</body>
</html>