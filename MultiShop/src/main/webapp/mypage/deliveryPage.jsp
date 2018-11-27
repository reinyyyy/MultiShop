<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="delivery_table">
	<table id="myTable">
	    <thead>
	        <tr>
	            <th>주문번호</th>
	            <th>상품명</th>
	            <th>수량</th>
	            <th>금액</th>
	            <th>주문상태</th>
	            <th>기타www</th>
	        </tr>
	    </thead>
	</table>
</div>

<script type="text/javascript">
$(document).ready( function () {
	$('#myTable').dataTable({
    	ajax: {
            'url':'/MultiShop/mypage/delivery.do',
            'type': 'POST'
         },
         columns: [
             {"data": "o_num"},
             {"data": "p_code"},
             {"data": "p_cost"}, 
             {"data": "p_amount"}, 
             {"data": "o_status"},
             {"data": "o_tel"}
         ]
    }); 
});
</script>