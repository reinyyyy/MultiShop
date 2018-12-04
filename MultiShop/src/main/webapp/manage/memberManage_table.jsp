<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="sect-top">
       <table id="memberTotalTable" style="width : 100%;">
          <thead>
             <tr>
                <td align="center">이메일</td>
                <td align="center">주문자</td>
                <td align="center">휴대폰</td>
                <td align="center">주소</td>
                <td align="center">등록일</td>
             </tr>
          </thead>
       </table>
   </div>
   <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function(){

	   $('#memberTotalTable').DataTable({
	      ajax: {
	            'url':'/MultiShop/manage/memberList.do',
	            'type': 'POST'
	         },
	      "columns" : [
	         {"data":"m_email"},
	         {"data":"m_name"},
	         {"data":"m_tel_phone"},
	         {"data":"m_zipcode"},
	         {"data":"m_date"}
	      ],
	      "searching" : true,
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
   });
   </script>