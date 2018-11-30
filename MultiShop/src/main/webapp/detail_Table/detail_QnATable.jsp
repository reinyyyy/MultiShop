<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_QnATable" id="detail_QnATable" style ="width : 100%;">
	<thead>
		<tr>
			<th width="70">답변상태</th>
			<th width="40" height="20">번호</th>
			<th width="150">상태</th>
			<th width="650">상품문의</th>
			<th width="100">작성자</th>
			<th width="150">등록일</th>
		</tr>
	</thead>
</table>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function format ( d ) {
	if(d.replyContent == null){
		d.replyContent = "답변이 없습니다.";
	}
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>사용자:</td>'+
            '<td>'+d.id+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>내용:</td>'+
            '<td>'+d.detail_QnAContent+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>답변:</td>'+
            '<td>'+d.replyContent+'</td>'+
        '</tr>'+
    '</table>';
}
$(document).ready(function(){
	
 	 var QnAtable = $('#detail_QnATable').DataTable({
		"ajax" : "/MultiShop/detail_page/detail_QnAPage.do",
		"columns" : [
			{
                "className":'details-control',
                "orderable": false,
                "data": null,
                "defaultContent": ''
            },
			{"data":"seq"},
			{"data":"condition"},
			{"data":"detail_QnASubject"},
			{"data":"id"},
			{"data":"logtime"}
		],
		"order": [[1, 'asc']],
		"searching" : true,
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
	$('#detail_QnATable').on('click','td.details-control',function(){
		  	var tr = $(this).closest('tr');
	        var row = QnAtable.row(tr);
	        
	        if ( row.child.isShown() ) {
	            // This row is already open - close it
	            row.child.hide();
	            tr.removeClass('shown');
	        }
	        else {
	            // Open this row
	            row.child( format(row.data()) ).show();
	            tr.addClass('shown');
	        }
	});

});
</script>	
</body>