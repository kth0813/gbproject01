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
    <script>
      function initMap() {
        var local = {lat: <%=rvo.getLodlat()%>, lng: <%=rvo.getLodlng()%>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 18,
          center: local
        });
        var marker = new google.maps.Marker({
          position: local,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMiY1IXYOUD-YGz1Lz7RPpCfOvfQ3Qpc0&callback=initMap">
    </script>
  </body>
</html>
