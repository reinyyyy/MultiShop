<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_hoogiTable" id="detail_hoogiTable">
	<thead>
		<tr>
			<th width="40" height="20">번호</th>
			<th width="150">만족도</th>
			<th width="700">상품평</th>
			<th width="100">작성자</th>
			<th width="150">등록일</th>
		</tr>
	</thead>
</table>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
 	$('#detail_hoogiTable').dataTable({
		"ajax" : "/MultiShop/detail_page/detail_hoogiPage.do",
		"columns" : [
			{"data":"seq"},
			{"data":"detail_hoogiStar"},
			{"data":"detail_hoogiModalContent"},
			{"data":"id"},
			{"data":"logtime"}
		]
	}); 
});
</script>
</body>