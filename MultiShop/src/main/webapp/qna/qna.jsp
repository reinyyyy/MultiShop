<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.qna_container {width: 80%; display: block; overflow: hidden; margin: 10px auto 30px;}
ul.qna_list {overflow: hidden; padding : 0px;}
ul.qna_list li:nth-child(odd) {background-color:#b1b8c0; border-radius: 5px;}
ul.qna_list li:nth-child(odd) .qna_content {border:1px solid #b1b8c0;}
ul.qna_list li:nth-child(even) {background-color:#636d79; border-radius: 5px;}
ul.qna_list li:nth-child(even) .qna_content {border:1px solid #636d79;}
.qna_title {
	color:#ffffff;
	padding: 0px 5px;
	font-weight: bold;
}
.qna_title_area {padding-top: 15px; min-height: 50px;}
.qna_title_area p {
	display: inline-block;
	margin:0px;
	padding: 0px;
}
.qna_title_area span.qna_date {
	float: right;
}
.qna_content {
	color:#000000;
    background-color: #ffffff;
    border-radius: 0px 0px 5px 5px;
	padding: 0px 5px;
	display: block;
}
.qna_content div {padding: 15px;}
</style>
<body>
<div class="qna_container">
	<div>
      <img src="../image/faq.png" width="100%">
   </div>
	<c:if test="${qnalist=='[]'}">
		<p>내용이 존재하지않습니다.</p>
	</c:if>
	<c:if test="${qnalist!='[]'}">
		<ul class="qna_list">
			<c:forEach var="qnaDTO" items="${qnalist}">
				<li>
					<div class="qna_title">
						<div class="qna_title_area">
							<p>${qnaDTO.q_subject}</p>
							<span class="qna_date">
								<fmt:formatDate value="${qnaDTO.q_date}" pattern="yyyy-MM-dd"/>
							</span>
						</div>
					</div>
					<div class="qna_content">
						<div>${qnaDTO.q_content}</div>
					</div>
				</li>
			</c:forEach>		
		</ul>
	</c:if>
</div>
</body>
<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$(".qna_content").hide();
	//content 클래스를 가진 div를 표시/숨김(토글)
	$(".qna_title").click(function(){
		$(this).next(".qna_content").slideToggle("slow");
		$("i", this).toggleClass("fa-chevron-down fa-chevron-up");
	});
});
</script>
</html>