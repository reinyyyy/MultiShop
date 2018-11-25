<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped" id="delivery_table">
  <thead>
    <tr>
      <th scope="col">주문번호</th>
      <th scope="col">상품명</th>
      <th scope="col">금액(수량)</th>
      <th scope="col">주문상태</th>
      <th scope="col">기타</th>
    </tr>
  </thead>
  <tbody>
  	 <c:forEach items="${deleveryList }" var="">
	    <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	    </tr>
  	 </c:forEach>
  </tbody>
</table>

</body>
</html>