<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<style>
#memberQnATable td{
	text-align: center;
}

</style>
<body>
<div id="prdSearch" class="page-body">
        <h2 style="margin-bottom: 10px;">고객관리</h2>
    <div class="sect-top">
    	<table id="memberTotalTable" style="width : 100%;">
    		<thead>
	    		<tr>
	    			<td align="center">주문자</td>
	    			<td align="center">휴대폰</td>
	    			<td align="center">번지</td>
	    			<td align="center">주소</td>
	    			<td align="center">상세주소</td>
	    			<td align="center">포인트</td>
	    			<td align="center">등록일</td>
	    		</tr>
    		</thead>
    	</table>
	</div>
	<br><br>
	<h2 style="margin-bottom: 10px;">답변하기</h2>
	<div class="sect-top" style="overflow: hidden;">
		<table id= "answerTable">
			<colgroup>
				<col style="width:*;"/>
				<col style="width:*;"/>
				<col style="width:*;"/>
				<col style="width:*;"/>
				<col style="width:*;"/>
				<col style="width:*;"/>
				<col style="width:*;"/>
			</colgroup>
			<tr>
				<td colspan="1" align="center">제목 :</td>
				<td colspan="6"><input type="text" style="width: 95%; height:50px; margin-bottom: 20px; margin-top: 10px;" id="qna_Answer_subject" readonly></td>
			</tr>
			<tr>
				<td colspan="1" align="center">내용 : </td>
				<td colspan="6"><textarea style="width: 95%; height:200px; margin-bottom: 20px;" id="qna_Answer_content" readonly></textarea></td>
			</tr>
			<tr>
				<td colspan="1" align="center">답변 : </td>
				<td colspan="6"><input type="text" id="answerComplet" style="width:95%; height:150px; margin-bottom: 20px;">
								<div id="answerCompletDiv"></div>
				</td>
			</tr>
		</table>
		<div style="float: right; margin-bottom: 10px; margin-right: 10px;"><input type="button" id="answerCompletBtn" value="답변하기">
			<input type="hidden" id="detail_hidden_P_code">
			<input type="hidden" id="detail_hidden_Seq">
		</div>
	</div>
	<br><br>
	<div style = "overflow: hidden; margin : 0 0 10px 0;">
	<h2 style="float : left;">Q&A 질문</h2>
	</div>
	<div class="sect-top">
		<table id="memberQnATable" style="width : 100%;">
			<thead>
				<tr>
					<td>문의번호</td>
					<td>상품번호</td>
					<td align="center">작성자</td>
					<td align="center">제목</td>
					<td align="center">등록일</td>
					<td align="center" class="memberQnATableFirst">답변하기</td>
				</tr>
			</thead>
		</table>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){

	$('#memberTotalTable').DataTable({
		"ajax" : "/MultiShop/manage/getMembersList.do",
		
		"columns" : [
			{"data":"m_name"},
			{"data":"m_tel_phone"},
			{"data":"m_zipcode"},
			{"data":"m_roadAddress"},
			{"data":"m_jibunAddress"},
			{"data":"m_point"},
			{"data":"m_date"}
		],
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
		$('#memberQnATable').DataTable({
		"ajax" : "/MultiShop/manage/getQnAReadyList.do",
		"columns" : [
			{"data":"seq"},
			{"data":"p_code"},
			{"data":"id"},
			{"data":"detail_QnASubject"},
			{"data":"logtime"},
			{"data":"reply","class":"memberQnAComplet"}
		],
		"columnDefs": [{
		"render":function(data,type,row){
			if(data == 'ready'){
				return "<img src='../image/on.png' style='width :30px; height:30px; cursor:pointer;'>";
			}
		},
		"targets":5,
		}],
		"order": [[1, 'asc']],
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

	//질문 보기기능
	$('#memberQnATable tbody').on('click','.memberQnAComplet',function(){
		var seq = $(this).prev().prev().prev().prev().prev().text();
		var p_code = $(this).prev().prev().prev().prev().text();
		$.ajax({
			type : 'POST',
			url : '/MultiShop/manage/getDetail_AnswerList.do',
			data : {'p_code':p_code,
					'seq':seq},
			dataType : 'json',
			success : function(data){
				 $.each(data.getDetail_AnswerList, function(index,items){
		               $('#qna_Answer_subject').val(items.detail_QnASubject);
		               $('#qna_Answer_content').val(items.detail_QnAContent);
		               $('#detail_hidden_P_code').val(items.p_code);
		               $('#detail_hidden_Seq').val(items.seq);
		            });
			}
		});
		
	});
	$('#answerCompletBtn').on('click',function(){
		if($('#answerComplet').val()==""){
			$('#answerCompletDiv').text("답변 내용이 없습니다.").css("color","red").css("font-size","9px");
		}
		else{
			var p_code =  $('#detail_hidden_P_code').val();
			var replyContent = $('#answerComplet').val();
			var seq =  $('#detail_hidden_Seq').val();
			var reply = "complet";
			$.ajax({
				type : 'POST',
				url : '/MultiShop/manage/detail_AnswerUpdate.do',
				data : {
					'p_code':p_code,
					'replyContent':replyContent,
					'reply':reply,
					'seq':seq
				},
				success : function(){
					alert("답변 완료");
					location.reload();
				}
			});
		}
		
	});
});
</script>
</body>
