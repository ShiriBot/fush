<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp" %>
<title>평가하기</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div class="center">
<div class="session">
<h2> 하여튼 뭔가 간지나고 평가를 독려하는 문구 </h2>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
<%@ include file="ratingContent.jsp" %>
별점을 누르면 바로 저장되고+스크롤하면 계속 새로 생성되도록 할 생각
이미 평가한 작품은 다시 나오지 않도록
</div>
</div>
<%@ include file="footer.jsp" %>

</body>
</html>


