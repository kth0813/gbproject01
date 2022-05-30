<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bna.dao.ListDAO" %>
<%@ page import="bna.vo.ListVO" %>
 <!DOCTYPE html>
<html>
  <head>
    <style>
       #map {
        height: 400px;
        width: 100%;
       }
    </style>
   <%
	int lodnum = Integer.parseInt(request.getParameter("lodnum"));
	ListDAO ldao = new ListDAO();
	ListVO lvo = ldao.getOneLod(lodnum);
%>
  </head>
  <body>
    <div id="map"></div>
    <script>
      function initMap() {
        var local = {lat: <%=lvo.getLodlat()%>, lng: <%=lvo.getLodlng()%>};
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
