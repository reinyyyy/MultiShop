<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_hoogiTable">
	<tr>
		<th width="40" height="20">번호</th>
		<th width="150">만족도</th>
		<th width="700">상품평</th>
		<th width="100">작성자</th>
		<th width="150">등록일</th>
	</tr>
	<c:if test="${detail_hoogiList=='[]'}">
		<tr>
			<td class="detail_hoogi detail_hoogiSeq" width="40" height="30"></td>
			<td class="detail_hoogi" width="150"></td>
			<td class="detail_hoogi" width="700">등록된 상품평 게시물이 없습니다.</td>
			<td class="detail_hoogi" width="100"></td>
			<td class="detail_hoogi" width="150"></td>
		</tr>
	</c:if>
	<c:if test="${detail_hoogiList!=null}">
		<c:forEach var="detail_hoogiDTO" items="${detail_hoogiList}">
			<tr>
				<td class="detail_hoogi detail_hoogiSeq" width="40" height="30">${detail_hoogiDTO.seq }</td>
				<td class="detail_hoogi" width="150">${detail_hoogiDTO.detail_hoogiStar }</td>
				<td class="detail_hoogi" width="700">${detail_hoogiDTO.detail_hoogiModalContent }</td>
				<td class="detail_hoogi" width="100">${detail_hoogiDTO.id }</td>
				<td class="detail_hoogi" width="150">${detail_hoogiDTO.logtime }</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</body>