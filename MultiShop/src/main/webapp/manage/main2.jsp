<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="page-body">
    <h2 class="blind">메인</h2>
    
    <div class="sect-hd">
        <h3>주문현황</h3>
        <a href="../manage/orderManagePage.do" class="right lnk">주문관리</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <ul class="order-status">
            <li>
                <dl>
                    <dt>배송대기</dt>
                    <dd class="btn-order-move" data-end-state="" data-type="order" data-state="" data-pay-state="W">${delivery_wait }건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>배송중</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DR" data-pay-state="">${delivery_ing }건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>배송완료</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DC" data-pay-state="">${delivery_complete }건</dd>
                </dl>
            </li>
            <li class="last">
           		<dl>
                    <dt>총금액</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DC" data-pay-state="">${totalSales }원</dd>
                </dl>
            </li>
                    </ul>
    </div><!-- .sect-cont -->
    
    <!-- notice -->
      <div class="sect-hd">
        <h3>공지사항</h3>
        <a href="../manage/noticePage.do" class="right lnk">공지관리</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont">
        <div id="notice_list" class="tbl-list tbl-extend tbl-horz mt-20">
        	<table id="notice_list_table" style="width: 100%;">
				<thead>
					<tr>
						<th>공지번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>등록일</th>
					</tr>
				</thead>
			</table>
        </div>
    </div><!-- .sect-cont -->

    
</div>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- <script src = "../js/manage/product.js"></script> -->
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	
   var table = $('#notice_list_table').DataTable({
       ajax: {
            'url':'/MultiShop/manage/noticeList.do',
            'type': 'POST'
         },
         columns: [
             {"data": "n_number"},
             {"data": "n_subject"},
             {"data": "n_content"},
             {"data": "n_date"}
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