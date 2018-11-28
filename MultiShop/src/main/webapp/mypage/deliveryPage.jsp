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
	<div id="delivery_div">
	<table class="table table-striped" id="delivery_table">
	  <thead>
	    <tr>
	      <th scope="col">주문번호</th>
	      <th scope="col">상품명</th>
	      <th scope="col">금액(수량)</th>
	      <th scope="col">총금액</th>
	      <th scope="col">주문상태</th>
	      <th scope="col">기타</th>
	    </tr>
	  </thead>
	  <tbody>
	  	  <c:forEach items="${orderList }" var="list">
		    <tr>
		      <th scope="row">${list.o_num }</th>
		      <td>${list.p_code }</td>
		      <td>${list.p_cost} (${list.p_amount }개)</td>
		      <td>${list.p_cost*list.p_amount }</td>
		      <td>${list.o_status }</td>
		      <td>기타</td>
		    </tr>
	  	 </c:forEach> 
	  </tbody>
	</table>
	<input type="hidden" id="pg" value=${pg }>
	<div id="delivery_paging">
		<ul class="pagination">
			${orderPaging}
		</ul>
	</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(window).on('load',function(){
	$('#delivery_div').load('/MultiShop/mypage/deliveryList.do',
			{"pg":$('#pg').val()},
			function(data){
				if(data=='true'){
					alert(data);
				}
			});
});


$(document).ready(function(){
	
	$('#paging').on('click',function(){
		event.preventDefault();
        event.stopPropagation();
        var pg = $(this).prop('name');
	});
	
	
});
</script>
</body>
</html>