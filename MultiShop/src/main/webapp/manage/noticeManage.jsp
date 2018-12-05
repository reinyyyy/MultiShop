<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="ordSearch" class="page-body">
	<h2>공지사항</h2>
	<div class="pc-switch">
		<div class="sect-hd">
			<h3>공지사항 추가</h3>
		</div>
		<div class="sect-cont">
			<div id="notice_input_div">
				<form id="notice_form" name="notice_form">
					<table style="text-align: center;">
						<tr>
							<td><input type="text" name="n_subject" id="n_subject"
								placeholder="공지사항제목"></td>
						</tr>
						<tr>
							<td><textarea rows="20" cols="20" id="n_content"
									name="n_content" placeholder="   내용입력"></textarea></td>
						</tr>
						<tr>
							<td>
								<input type="button" id="notice_Btn" value="입력" /> 
								<input type="reset" value="다시쓰기" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="sect-hd">
		<h3>공지사항</h3>
	</div>
	<div class="sect-cont">
		<div id="notice_list" class="tbl-list tbl-extend tbl-horz mt-20">
			<jsp:include page="../manage/notice_table.jsp"></jsp:include>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#notice_Btn').on(
							'click',
							function() {
								if ($('#n_subject').val() == '') {
									alert('제목입력해주세요');
								} else if ($('#n_content').val() == '') {
									alert('내용을 입력해주세요');
								} else {
									$.post('/MultiShop/manage/noticeInsert.do',
											$('#notice_form').serialize(),
											function(data) {
												if (data = '1') {
													alert('공지사항 등록');
													location.reload();
												} else {
													alert('실패');
												}
											});
								}
							});
				});
	</script>