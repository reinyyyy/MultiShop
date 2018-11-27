<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>${detail_image}</p>
	<c:if test = "${detail_image != null }">
		<c:forEach var="img" items = "${detail_image }">
			<img src = "../upload/${img }"><br>
		</c:forEach>
	</c:if>
	<script src = "https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</body>
</html>