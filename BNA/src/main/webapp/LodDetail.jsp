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
<link rel="stylesheet" href="css/detail.css?v=<?php echo time(); ?>">
<link rel="stylesheet" href="css/jquery-ui.min.css">
<link rel="stylesheet" href="css/swiper.min.css">
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/swiper.min.js"></script>
<script src="js/ui.common.js?v=<?php echo time(); ?>"></script>
<script>$(window).scroll(  
	    function(){  
	        //스크롤의 위치가 상단에서 810보다 크면  
	        if($(window).scrollTop() > 810){  
	        /* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
	            $('.lodres1').addClass("fix");  
	            //위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
	        }else{  
	            $('.lodres1').removeClass("fix");  
	            //위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
	        }  
	    }  
	);  
</script>
<style>input[type=submit] {
width: 100%;
background-color:#DE1362;
color: white;
padding: 14px 20px;
margin: 8px 0;
border: none;
border-radius: 4px;
cursor: pointer;
}
</style>
</head>
<body>
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
		<main id="main">
			<div class="lodname">
				<h2><%=lvo.getLodname()%></h2>
			</div>
			<div class="lodimgbox">
				<div class="lodimg1"><img src="images/<%=lvo.getLodimg1()%>" width="620px" height="620px"></div>
				<div class="lodimg2"><img src="images/<%=lvo.getLodimg2()%>" width="310px" height="310px"></div>
				<div class="lodimg3"><img src="images/<%=lvo.getLodimg3()%>" width="310px" height="310px"></div>
				<div class="lodimg4"><img src="images/<%=lvo.getLodimg4()%>" width="310px" height="310px"></div>
				<div class="lodimg5"><img src="images/<%=lvo.getLodimg5()%>" width="310px" height="310px"></div>
			</div>			
			<div class="loddetail">
				<div class="lodinfodet"><h2>숙소정보</h2><%=lvo.getLodinfodet()%><br><br><hr></div>
				<div class="lodres">
					<form action="LodResr.jsp?lodnum=<%=lvo.getLodnum() %>" method="post">
						<div class="lodres1">
							<div class="lodprice"><h3>￦<%=lvo.getLodprice() %> / 박</h3></div>
							<div class="lodres2">
								<div class="lodchkin">체크인<br><input type="date" id="today" name="today"></div>
								<div class="lodchkout">체크아웃<br><input type="date" id="tomorrow" name="tomorrow"></div>
								<div class="lodpeople"><br>게스트</div>
								<div class="lodpeople2"><br><input type="number" min=1 max=4 step=1 value=2 id="people" name="people">명</div>
							</div>
							<div class="col"><input type="submit" value="예약버튼"></div>
						</div>
					</form>
				</div>
				<div class="lodrule"><h2>숙소규칙</h2><%=lvo.getLodrule()%><br><br><hr></div>
				<div class="lodfac"><h2>숙소시설</h2><%=lvo.getLodfac()%><br><br><hr></div>
				<div class="lodopf"><h2>숙소옵션</h2><%=lvo.getLodopt()%><br><br><hr></div>	
			</div>
			<div class="loddetail2">
				<div class="lodmap"><h2>숙소 지도</h2><br><jsp:include page="LodMap.jsp?lodnum=<%=lvo.getLodnum()%>"></jsp:include><br><br><hr></div>
				<div class="lodaddr"><h2>숙소주소</h2><br><%=lvo.getLodaddr()%><br><br><hr></div>
				<div class="lodrev"><h2>숙소 후기</h2>
					<jsp:include page="LodReview.jsp"></jsp:include>
				</div>
			</div>
		</main>
		<footer id="footer">
            <div class="titleWrap">
                <p class="title">Bna</p>
                <image class="logo" src="images/logo.png">
            </div>
            <p class="content">(주)BNA | 대표이사 : 김태훈 | 사업자 등록번호 : 123-45-67890 | 통신판매업신고 : 신림-12345호 | 메일 : helpMe@bna.com<br/> 
                관광사업자 등록번호 : 제2022-61호 | 주소 : 서울특별시 관악구 신림로 340, 르네상스쇼핑몰 6층  |호스팅서비스 제공자 : 주식회사 BNA
                고객센터 : 1644-1234 (오전 9시 - 익일 새벽 3시)</p>
        </footer>
	</div>
</div>
</body>

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
</html>