<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table id="memberQnATable" style="width : 100%;">
   <thead>
      <tr>
         <td>문의번호</td>
         <td>상품번호</td>
         <td align="center">작성자</td>
         <td align="center">제목</td>
         <td align="center">등록일</td>
         <td align="center" class="memberQnATableFirst">답변하기</td>
      </tr>
   </thead>
</table>
   <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$('#memberQnATable').DataTable({
	ajax: {
        'url':'/MultiShop/manage/productQnaList.do',
        'type': 'POST'
     },
    "columns" : [
       {"data":"seq"},
       {"data":"p_code"},
       {"data":"id"},
       {"data":"detail_QnASubject"},
       {"data":"logtime"},
       {"data":"reply","class":"memberQnAComplet"}
    ],
    "columnDefs": [{
    "render":function(data,type,row){
       if(data == 'ready'){
          return "<img src='../image/on.png' style='width :30px; height:30px; cursor:pointer;'>";
       }
    },
    "targets":5,
    }],
    "order": [[1, 'asc']],
    "searching" : false,
    responsive : true,
    "ordering": false,
    "language" : {
       "emptyTable" : "데이터가 없습니다.",
       "info" : "_START_-_END_(총_TOTAL_명)",
       "infoEmpty" : "0명",
       "infoFiltered" :"(전체_MAX_명 중 검색결과)",
       "lengthMenu" : "_MENU_개씩 보기",
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
</script>