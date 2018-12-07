<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table id="productLists" style="width: 100%">
  <thead>
     <tr>
        <th>상품코드</th>
        <th>상품명</th>
        <th>옵션1</th>
        <th>옵션2</th>
        <th>수량</th>
        <th>가격</th>
        <th>등록일</th>
        <th>판매량</th>
        <th>판매 상태</th>
     </tr>
  </thead>
</table>
   <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#productLists').DataTable({
	      ajax: {
	            'url':'/MultiShop/manage/productManageList.do',
	            'type': 'POST'
	        },
	      "columns" : [
	         {"data":"p_code","class":"p_code modify"},
	         {"data":"p_name","class":"p_name modify"},
	         {"data":"p_option1","class":"p_option1 modify"},
	         {"data":"p_option2","class":"p_option2 modify"},
	         {"data":"p_amount","class":"p_amount modify"},
	         {"data":"p_cost","class":"p_cost modify"},
	         {"data":"p_date","class":"p_date modify"},
	         {"data":"p_sales","class":"p_sales modify"},
	         {"data":"p_status","class":"p_status modify"}
	      ],
	      "searching" : true,
	      responsive : true,
	      "ordering": true,
	      "language" : {
	         "emptyTable" : "데이터가 없습니다.",
	         "info" : "_START_ - _END_ (총 _TOTAL_개)",
	         "infoEmpty" : "0명",
	         "infoFiltered" :"(전체 _MAX_개의 품목 중 검색결과)",
	         "lengthMenu" : "_MENU_"+"&emsp;&emsp;",
	         "zeroRecords" : "검색된 데이터가 없습니다.",
	         "paginate" : {
	            "first" : "첫페이지",
	            "last" : "마지막 페이지",
	            "next" : "다음",
	            "previous" : "이전"
	         },
	         "aria" : {
	            "sortAscending" : "오름차순 정렬",
	            "sortDescending" : "내림차순 정렬"
	         }
	      }
	   });
	
	
});
</script>