<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<h3 style="text-align: center;">나의 주문</h3>
</div>

<div id="delivery_table_div">
   <table id="delivery_table">
       <thead>
		<tr>
			<th>주문일시</th>
			<th class="order_status">주문상태</th>
			<th>주문번호</th>
			<th>주문자</th>
			<th>배송번호</th>
			<th>배송지주소</th>
			<th>상품코드</th>
			<th>수량</th>
			<th>가격</th>
			<th>총액</th>
		</tr>
	</thead>
   </table>
</div>
<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
	
	$('#delivery_table').DataTable({
       ajax: {
            'url':'/MultiShop/mypage/delivery.do',
            'type': 'POST'
         },
         columns: [
             {"data": "o_date"},
             {"data": "o_status","class":"o_status"},
             {"data": "o_num"}, 
             {"data": "m_email"},
             {"data": "d_code"}, 
             {"data": "o_addr"}, 
             {"data": "p_code"},
             {"data": "p_amount"},
             {"data": "p_cost"},
             {"data": "p_cost"}
         ],
         "columnDefs": [
             {
                 "render": function ( data, type, row ) {
                     return data *row['p_amount'];
                 },
                 "targets": 9
             }
         ],
         responsive: true,
         "ordering": false,
         "searching": false,
         "pageLength": 5,
         "lengthChange": false,
         "language": {
             "emptyTable": "데이터가 없어요.",
             "lengthMenu": "페이지당 _MENU_ 개씩 보기",
             "info": "현재 _START_ - _END_ / _TOTAL_건",
             "infoEmpty": "데이터 없음",
             "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
             "search": "전체 검색: ",
             "zeroRecords": "일치하는 데이터가 없어요.",
             "loadingRecords": "로딩중...",
             "processing":     "잠시만 기다려 주세요...",
             "paginate": {
                 "next": "다음",
                 "previous": "이전"
             }
    }});
});
</script>