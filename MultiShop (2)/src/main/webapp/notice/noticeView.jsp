<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "../css/categoryItemList.css" rel = "stylesheet" />
<link href = "../css/common.css" rel = "stylesheet" />
<link href = "../css/bootstrap.css" rel = "stylesheet" />
<style>
table th {background-color: #dddddd;}
table td.content_box {min-height: 150px; border-top: 1px solid #dddddd; border-bottom: 1px solid #dddddd;}
</style>
</head>
<body>
<div class="container" style="margin: 20px auto;">
	<div class="row">
		<table class="table" id="notice_table">
			<colgroup>
				<col width="20%;" />
				<col width="30%;" />
				<col width="20%;" />
				<col width="30%;" />
			</colgroup>
			<tbody>
				<tr>
					<th class="text-center">제목</th>
					<td colspan="3">
						${noticeDTO.n_subject }
					</td>
				</tr>
				<tr>
					<th class="text-center">글번호</th>
					<td>${noticeDTO.n_number }</td>
					<th class="text-center">작성일</th>
					<td>${noticeDate}</td>
				</tr>
				<tr>
					<td class="content_box" colspan="4">${noticeDTO.n_content }</td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="hidden" name="pg" id="pg" value="${pg}">
			<button type="button" id="noticeViewBtn" class="btn btn-success">목록</button>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var pg = $('#pg').val();  
		$('#noticeViewBtn').on('click',function(){
			location.href="http://localhost:8080/MultiShop/notice/notice.do?pg="+pg;		
		});
	});
</script>
</html>