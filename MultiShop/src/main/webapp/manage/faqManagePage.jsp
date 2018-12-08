<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="ordSearch" class="page-body">
	<h2>FAQ</h2>
	<div class="pc-switch">
		<div class="sect-hd">
			<h3>FAQ 추가</h3>
		</div>
		<div class="sect-cont">
			<div id="faq_input_div">
				<form id="faq_form" name="faq_form">
					<table style="text-align: center;">
						<tr>
							<td><input type="text" name="q_subject" id="q_subject"
								placeholder="FAQ제목"></td>
						</tr>
						<tr>
							<td><textarea rows="20" cols="20" id="q_content"
									name="q_content" placeholder="   내용입력"></textarea></td>
						</tr>
						<tr>
							<td>
								<input type="button" id="faq_Btn" value="입력" /> 
								<input type="reset" value="다시쓰기" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div class="sect-hd">
		<h3>FAQ사항</h3>
	</div>
	<div class="sect-cont">
		<div id="faq_list" class="tbl-list tbl-extend tbl-horz mt-20">
			<jsp:include page="../manage/faq_table.jsp"></jsp:include>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(
				function() {
					$('#faq_Btn').on(
							'click',
							function() {
								if ($('#q_subject').val() == '') {
									alert('제목입력해주세요');
								} else if ($('#q_content').val() == '') {
									alert('내용을 입력해주세요');
								} else {
									$.post('/MultiShop/manage/faqInsert.do',
											$('#faq_form').serialize(),
											function(data) {
												if (data = '1') {
													alert('FAQ 등록');
													location.reload();
												} else {
													alert('실패');
												}
											});
								}
							});
				});
	</script>