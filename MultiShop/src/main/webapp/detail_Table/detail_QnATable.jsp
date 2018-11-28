<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_QnATable" id="detail_QnATable">
	<thead>
		<tr>
			<th width="40" height="20">번호</th>
			<th width="150">상태</th>
			<th width="650">상품문의</th>
			<th width="50">알림</th>
			<th width="100">작성자</th>
			<th width="150">등록일</th>
		</tr>
	</thead>
</table>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
 	$('#detail_QnATable').dataTable({
		"ajax" : "/MultiShop/detail_page/detail_QnAPage.do",
		"columns" : [
			{"data":"seq"},
			{"data":"condition"},
			{"data":"detail_QnASubject"},
			{"data":"reply"},
			{"data":"id"},
			{"data":"logtime"}
		]
	}); 
});
</script>	
</body>