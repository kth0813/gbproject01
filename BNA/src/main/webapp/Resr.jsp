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
	String id = (String)session.getAttribute("id");
	ReserveDAO rdao = new ReserveDAO();
	Vector<ReserveVO> vl = rdao.getAllReserveLod();
	Vector<ReserveVO> va = rdao.getAllReserveAct();
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
        <header id="header">
            <div class="header_inner">
                <h2><image class="logo" src="./images/logo.png"/></h2>
                <div class="header_btn">
                    <ul>
                        <li><span>어디든지</span></li>
                        <li><span>언제든 일주일</span></li>
                        <li><span>게스트 추가</span> <a href="javascript:;" class="search_icon"></a></li>
                    </ul>
                </div>
    
                <div class="user_menu">
					<ul>
						<li><a href="javascript:;"><image class="profile btn-open-popup" src="./images/profile.png"></a></li>
					</ul>
                </div>
                <div class="modal public">
                    <ul>
                        <li>로그인</li>
                        <li>회원가입</li>
                    </ul>
                </div>
                <div class="modal private">
                    <ul>
                        <li>내정보</li>
                        <li>로그아웃</li>
                    </ul>
                </div>
            </div>
        </header>		
<!-- 바디 -->
		<h2>숙소</h2>
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
		<h2>체험</h2>
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