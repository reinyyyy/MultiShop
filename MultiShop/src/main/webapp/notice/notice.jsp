<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "../css/categoryItemList.css" rel = "stylesheet" />
<link href = "../css/common.css" rel = "stylesheet" />
<style>
div.pagingClass {

}
div.pagingClass a {
	display: inline-blick;
	padding: 8px 15px;
	height : 38px;
    color: #fff;
    background-color: #868e96;
    border-color: #868e96;
    border-radius: 5px;
}
div.pagingClass a:hover {
	text-decoration: none;
	background-color: #218838;
    border-color: #1e7e34;
}
div.pagingClass a + a {
	margin-left: 5px;
}

</style>
</head>
<body>
	<div id="jb-container">
		<!-- 상단 히스토리 바 -->
		<div id="jb-header">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<!-- 사용자 클릭히스토리로 동적 처리필요 -->
					<li class="breadcrumb-item"><a href="../main/index.do">HOME</a></li>
					<li class="breadcrumb-item"><a onclick="goPage('${cateNum}')" href = "javascript:void(0)">${pageName }</a></li>
				</ol>
			</nav>
		</div>
		<div class="container" style="margin: 20px auto;">
			<div class="row">
				<table class="table table-hover table_layout_fixed" id="notice_table">
					<colgroup>
						<col width="20%;" />
						<col width="*;" />
						<col width="20%;" />
					</colgroup>
					<thead class="table-dark">
						<tr>
							<th scope="col" class="text-center">번호</th>
							<th scope="col" class="text-center">글제목</th>
							<th scope="col" class="text-center">작성일</th>
						</tr>
					</thead>
					<tbody>
						
					</tbody>
				</table>
			</div>
			<div id="boardPagingDiv" class="pagingClass" align="center">
			
			</div>
		</div>
	</div>
	<input type="hidden" id="pg" name="pg" value="${pg }">
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type:'POST',
			url:'/MultiShop/notice/noticeList.do',
			data : {'pg':$('#pg').val()},
			dataType:"json",
			success: function(data){
				/* alert(JSON.stringify(data)); */
				$.each(data.list, function(index,items){
					$('<tr/>').append($('<td/>',{
						align : 'center',
						text : items.n_number
					})).append($('<td/>',{
						align : 'left'
					}).append($('<a/>',{
						class : 'cursor subjectA ellipsis',
						text : items.n_subject
					}))).append($('<td/>',{
						align : 'center',
						text : new Date(items.n_date).toLocaleDateString()
					})).appendTo($('#notice_table'));
				});
				$('#boardPagingDiv').html(data.noticePaging.pagingHTML);
				$('#pg').val(data.pg);
			}
		});
		$('#notice_table').on('click','.subjectA',function(){
			var pg = $('#pg').val();
			var n_number = $(this).parent().prev().text();
			location.href="./noticeView.do?n_number="+n_number+"&pg="+pg;
		});
	});
</script>
<script type="text/javascript" src="../js/notice.js"></script>
</html>