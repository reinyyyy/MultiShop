<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="order_list_table" style="width: 100%;">
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
<input type="hidden" id="orderList_option" value='0'/>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   var table = $('#order_list_table').DataTable({
       ajax: {
            'url':'/MultiShop/manage/orderList.do',
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
             },
             {
            	 "render": function(data){
            		 return '<button>'+data+'</button>';
            	 },
            	 "targets": 1
             }
         ],
         responsive: true,
         "ordering": false,
         "pageLength": 5,
         "lengthChange": false,
         "language": {
             "emptyTable": "데이터가 없어요.",
             "lengthMenu": "페이지당 _MENU_ 개씩 보기",
             "info": "현재 _START_ - _END_ / _TOTAL_건",
             "infoEmpty": "데이터 없음",
             "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
             "search": "검색: ",
             "zeroRecords": "일치하는 데이터가 없어요.",
             "loadingRecords": "로딩중...",
             "processing":     "잠시만 기다려 주세요...",
             "paginate": {
                 "next": "다음",
                 "previous": "이전"
             }
         },
         initComplete: function() {
             this.api().columns().every(function() {
                 var column = this;
                 $(column.header()).append("<br>")
                 var select = $('<select><option value=""></option></select>')
                     .appendTo($(column.header()))
                     .on('change', function() {
                         var val = $.fn.dataTable.util.escapeRegex(
                             $(this).val()
                         );
                         column
                             .search(val ? '^' + val + '$' : '', true, false)
                             .draw();
                     });
                 column.data().unique().sort().each(function(d, j) {
                     select.append('<option value="' + d + '">' + d + '</option>')
                 });
             });
         }
    }); 
   
   $('#order_list_table tbody').on('click','.o_status',function(){
	  if(confirm('주문상태를 변경하시겠습니까?')){
		 var orderNum = table.cell($(this).next()).data();
		 if(table.cell(this).data()=='배송대기'){
			 $.post('/MultiShop/manage/orderStatusUpdate.do',
					 {"o_status":"배송중","o_num":orderNum},
					 function(data){
						 if(data=='1'){
							 alert('배송상태가 변경되었습니다.');
							 location.reload();
						 }
					 });
		  }else if(table.cell(this).data()=='배송중'){
			  $.post('/MultiShop/manage/orderStatusUpdate.do',
						 {"o_status":"배송완료","o_num":orderNum},
						 function(data){
							 if(data=='1'){
								 alert('배송상태가 변경되었습니다.');
								 location.reload();
							 }
						 });
		  }else if(table.cell(this).data()=='배송완료'){
			  alert('배송완료');
		  }
	  }
   }); 
});
</script>