<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="faq_list_table" style="width: 100%;">
	<thead>
		<tr>
			<th>faq번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>등록일</th>
		</tr>
	</thead>
</table>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   var table = $('#faq_list_table').DataTable({
       ajax: {
            'url':'/MultiShop/manage/faqList.do',
            'type': 'POST'
         },
         columns: [
             {"data": "q_number"},
             {"data": "q_subject"},
             {"data": "q_content"},
             {"data": "q_date"}
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
             "search": "전체 검색: ",
             "zeroRecords": "일치하는 데이터가 없어요.",
             "loadingRecords": "로딩중...",
             "processing":     "잠시만 기다려 주세요...",
             "paginate": {
                 "next": "다음",
                 "previous": "이전"
             }
         }
    }); 
});
</script>