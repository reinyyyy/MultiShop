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
</head>
<body>
<div class="container" style="margin: 20px auto;">
	<div class="row">
		<table class="table" id="notice_table">
			<colgroup>
				<col width="20%;" />
				<col width="*;" />
				<col width="20%;" />
				<col width="*;" />
			</colgroup>
			<tbody>
				<tr>
					<th class="text-center">제목</th>
					<td colspan="3">제에모옥</td>
				</tr>
				<tr>
					<th class="text-center">글번호</th>
					<td>3</td>
					<th class="text-center">작성일</th>
					<td>나알짜아</td>
				</tr>
				<tr>
					<td colspan="4">내용이 들어가욤!</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="n_number" id="n_number" value="${n_number}">
	</div>
</div>
</body>
</html>