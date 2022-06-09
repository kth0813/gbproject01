<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소와 체험을 한눈에 찾아보세요 - BNA</title>
<link rel="stylesheet" href="css/resr.css?v=<?php echo time(); ?>">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
//문서가 준비되면 제일 먼저 실행
$(document).ready(function(){ 
	$("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
})

//버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp27023355');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: "iamport_test_id", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "테스트", //결제창에 노출될 상품명
        amount: 100, //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("결제성공");
        } else {
            alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
        }
    });
}
</script>
</head>
<body>
<%
int people = Integer.parseInt(request.getParameter("people"));
String today= request.getParameter("today");
String tomorrow= request.getParameter("tomorrow");
int actnum = Integer.parseInt(request.getParameter("actnum"));
ListDAO ldao = new ListDAO();
ListVO lvo = ldao.getOneAct(actnum);
Date day1 = new SimpleDateFormat("yyyy-MM-dd").parse(today);
Date day2 = new SimpleDateFormat("yyyy-MM-dd").parse(tomorrow);
long day3 = (day2.getTime() - day1.getTime()) / (1000*24*60*60);
String actdate = String.valueOf(day3);
int actresprice=lvo.getActprice()*Integer.parseInt(actdate)+1000*(people);
String id = (String)session.getAttribute("id");
if(id == null){
%>
<script>
	alert("로그인이 필요합니다.");
	history.back();
</script>
<%
}
if(Integer.parseInt(actdate)<1){
	%>
	<script>
	alert("날짜가 잘못되었습니다.");
	history.back();
	</script>
	<%
}
%>
<!-- 헤더 -->
<table width="1280px" align="center" style="padding:4px 61px">
	<tr>
		<td><image class="logo" src="images/logo.png" width="100px"></td>
	</tr>
</table>
<!-- 바디 -->
<form action="ActResrPro.jsp" method="post">
<div class="resrlayout">
	<div>
		<div class="resrbox">
			<div class="resr"><h3>확인 및 결제</h3></div>
			<div class="resr"><h4>결제수단</h4><button id="iamportPayment" type="button">결제 하기</button></div>
			<div class="resr"><h4>환불 정책</h4><%=today %>일 이전에 예약 취소시 전액 환불됩니다. 이후엔 환불 불가능합니다.<br>확인 <input type="checkbox" required="required"></div>
			<div class="resr"><input type="submit" value="확인 및 예약"></div>
		</div>
	</div>
	<div>
		<div class="resinfobox">
				<div class="pad3"><img src="images/<%=lvo.getActimg1()%>" width="150px" height="150px"></div>
				<div class="pad3"><%=lvo.getActname() %></div>
				<div class="col1">날짜 : <%=today %> ~ <%=tomorrow %></div>
				<div class="col1">게스트 : <%=people%>명</div>
				<div class="col2"><h3>요금 세부 정보</h3></div>
				<div class="pad2"><%=lvo.getActprice()%>x<%=actdate %>박</div>
				<div class="pad1"><%=lvo.getActprice()*Integer.parseInt(actdate) %></div>
				<div class="pad2">수수료</div>
				<div class="pad1"><%=1000*(people) %></div>
				<div class="pad2">총 햡계(KRW)</div>
				<div class="pad1"> <%=actresprice %></div>
				<input type="hidden" name="id" value="<%=id%>">
				<input type="hidden" name="actdate" value="<%=actdate %>">
				<input type="hidden" name="actchkin" value="<%=today %>">
				<input type="hidden" name="actchkout" value="<%=tomorrow %>">
				<input type="hidden" name="actnum" value="<%=lvo.getActnum() %>">
				<input type="hidden" name="actpeople" value="<%=people %>">
				<input type="hidden" name="actresprice" value="<%=actresprice %>">
		</div>
	</div>
</div>
</form>
</body>
</html>