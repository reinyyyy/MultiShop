<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_hoogiTable" id="detail_hoogiTable" style="width : 100%;">
	<thead>
		<tr>
			<th width="40" height="20"></th>
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
		],
		"columnDefs": [{
			"render":function(data,type,row){
					return "";
			},
			"targets":0
			}],
		"searching" : false,
		responsive : true,
		"ordering": false,
		"language" : {
			"emptyTable" : "데이터가 없습니다.",
			"info" : "_START_-_END_(총_TOTAL_명)",
			"infoEmpty" : "0명",
			"infoFiltered" :"(전체_MAX_명 중 검색결과)",
			"lengthMenu" : "_MENU_개씩 보기",
			"zeroRecords" : "검색된 데이터가 없습니다.",
			"paginate" : {
				"first" : "첫페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			},
			"aria" : {
				"sortAscending" : "오름차순 정렬",
				"sortDescending" : "내림차순 정렬"
			}
		}
	}); 
});
</script>
</body>