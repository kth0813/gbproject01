<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ReserveDAO" %>
<%@ page import="bna.vo.ReserveVO" %>
 <!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 800px;
        width: 800px;
       }
    </style>
   <%
   int lodresnum = Integer.parseInt(request.getParameter("lodresnum"));
   ReserveDAO rdao = new ReserveDAO();
   ReserveVO rvo = rdao.getOneReserveLod(lodresnum);
%>
  </head>
  <body>
    <div id="map"></div>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7c7df9c93397c6b9396392baccd5f21"></script>
    <script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
    	center: new kakao.maps.LatLng(<%=rvo.getLodlat()%>, <%=rvo.getLodlng()%>), //지도의 중심좌표.
    	level: 4 //지도의 레벨(확대, 축소 정도)
    };
    var map = new kakao.maps.Map(container,options); //지도 생성 및 객체 리턴
    //마커가 표시될 위치입니다 
    var positions = [
        {
            title: '<%=rvo.getLodname()%>', 
            latlng: new kakao.maps.LatLng(<%=rvo.getLodlat()%>,	<%=rvo.getLodlng()%>)
        }
    ];

    //마커 이미지의 이미지 주소입니다
    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/2018/pc/img/marker_spot.png"; 
        
    for (var i = 0; i < positions.length; i ++) {
        
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(36, 50); 
        
        // 마커 이미지를 생성합니다    
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지 
        });
    }
    </script>
  </body>
</html>
