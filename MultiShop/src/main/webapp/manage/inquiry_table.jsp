<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="inquiry_list_table" style="width: 100%;">
	<thead>
		<tr>
			<th>문의번호</th>
			<th>고객이메일</th>
			<th>제목</th>
			<th>내용</th>
			<th>답변</th>
		</tr>
	</thead>
</table>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var inquiry = '';
   var table = $('#inquiry_list_table').DataTable({
       ajax: {
            'url':'/MultiShop/manage/inquiryList.do',
            'type': 'POST'
         },
         columns: [
             {"data": "i_seq"},
             {"data": "m_email"}, 
             {"data": "i_title"},
             {"data": "i_content"},
             {"data": "i_inquiry","class":"i_inquiry"}
         ],
         "columnDefs": [
             {
                 "render": function ( data, type, row ) {
                     	if(data==null){
                     		return "답변달기";
                     	}else{
                     		return data;
                     	}
                 
                 },
                 "targets": 4
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
   
   $('#inquiry_list_table tbody').on('click','.i_inquiry',function(){
	  if(confirm('답변을 작성하시겠습니까?')){
		 var inquiryNum = table.cell($(this).prev().prev().prev().prev()).data();
		 if(table.cell($(this)).data()==null){
			 if(inquiry= prompt('답변을 달아주세요','')){
	   			$.post('/MultiShop/manage/inquiryUpdate.do',
	   				 {"i_seq":inquiryNum,"i_inquiry":inquiry},
					 function(data){
						 if(data=='1'){
							 alert('답변을 달았습니다.');
							 location.reload();
						 }
					 });
  			 }
		 }else{
			 alert('이미 답변이 작성되었습니다');
		 }
	  }
   }); 
  
   
});
</script>