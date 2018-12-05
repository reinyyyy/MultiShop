<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div>
   <h3 style="text-align: center;">나의 1:1문의</h3>
</div>
<div id="inquiry_table_div">
   <table id="inquiry_table">
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
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   var inquiry = '';
   $('#inquiry_table').DataTable({
       ajax: {
            'url':'/MultiShop/mypage/inquiryList.do',
            'type': 'POST'
         },
         columns: [
             {"data": "i_seq"},
             {"data": "m_email"}, 
             {"data": "i_title"},
             {"data": "i_content"},
             {"data": "i_inquiry","class":"i_inquiry"}
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
