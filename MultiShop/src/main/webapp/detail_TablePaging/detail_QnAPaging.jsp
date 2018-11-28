<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<table class="detail_QnATable" id="detail_QnA">
   <tr>
      <th width="40" height="20">번호</th>
      <th width="150">상태</th>
      <th width="700">상품문의</th>
      <th width="100">작성자</th>
      <th width="150">등록일</th>
   </tr>
   <c:if test="${detail_QnAList == null}">
      <tr>
         <td class="detail_QnA" width="40" height="30"></td>
         <td class="detail_QnA" width="150"></td>
         <td class="detail_QnA" width="700">등록된 상품문의 게시물이 없습니다.</td>
         <td class="detail_QnA" width="100"></td>
         <td class="detail_QnA" width="150"></td>
      </tr>
   </c:if>
   <c:if test="${detail_QnAList != null}">
      <c:forEach var="detail_QnADTO" items="${detail_QnAList}">
         <tr>
            <td class="detail_QnA" width="40" height="30">${detail_QnADTO.seq}</td>
            <td class="detail_QnA" width="150"><img class="detail_QnACondition" src="../image/${detail_QnADTO.condition}.png"></td>
            <td class="detail_QnA" width="700"><span class="detail_QnA_ContactUs">${detail_QnADTO.detail_QnASubject}</span></td>
            <td class="detail_QnA" width="100">${detail_QnADTO.id }</td>
            <td class="detail_QnA" width="150">${detail_QnADTO.logtime}</td>
         </tr>
      </c:forEach>
   </c:if>
</table>
</body>