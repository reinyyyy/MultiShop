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
div#noticePagingDiv {text-align: center;}
div#noticePagingDiv > a {
	display: inline-block;
    border-radius: 5px;
    min-width: 40px;
    margin: 0 3px;
    padding: 9px;
    color: #fff;
    background-color: #727b84;
    border-color: #6c757d;
}
div#noticePagingDiv > a:hover {
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="jb-container">
		<!-- 상단 히스토리 바 -->
		<div class="container" style="margin: 20px auto;">
			<div>
	            <img src="../image/noticeMain.png" width="100%">
	        </div>
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
				<input type="hidden" id="pg" name="pg" value="${pg}" />
			</div>
			<div id="noticePagingDiv">

			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type:'POST',
			url:'/MultiShop/notice/noticeList.do',
			data: {"pg":$('#pg').val()},
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
				$('#noticePagingDiv').html(data.noticePaging);
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