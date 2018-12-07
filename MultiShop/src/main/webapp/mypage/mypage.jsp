<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<title>리스트</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> -->
<!-- 위에 src는 bootstrap.min.js:6 Uncaught Error: Bootstrap dropdown require Popper.js 에러잡아줌  -->

<meta name="viewport" content="width=device-width, initial-scale=1">
   <link href = "../css/categoryItemList.css" rel = "stylesheet">
<!--    <link href="../css/contents.css" rel="stylesheet">
   <link href="../css/common.css" rel="stylesheet"> -->
<style>
.quick_view_popup {
   position: relative;
   width: 972px;
   height: 690px;
   padding: 0 80px;
   z-index: 9998;
}

.modal-backdrop {
   z-index: 1;
}

.card:hover .quick_menu {
   display: inline;
}

.quick_menu {
   position: absolute;
   width: 100%;
   background-color: rgba(0, 0, 0, 0.4);
   z-index: 2;
   bottom: 0px;
   left: 0px;
   display: none;
}

.quick {
   float: left;
   width: 65%;
   width: calc(100% - 98px);
   border-left: 1px solid rgb(99, 99, 99);
   border-right: 1px solid rgb(99, 99, 99);
   border-left: 1px solid rgba(255, 255, 255, 0.2);
   border-right: 1px solid rgba(255, 255, 255, 0.2);
   font-size: 18px;
   color: white;
   font-weight: bold;
   font-family: 'HelveticaNeueLTStd-Hv';
   letter-spacing: 0.1em;
   line-height: 50px;
   text-align: center;
   color: rgb(255, 255, 255);
   box-sizing: border-box;
}

.btnl {
   float: left;
   width: 17.5%;
   width: calc(49px);
   height: 50px;
   text-indent: -9999px;
}

.link {
   background: url(../image/btn_goods_link.png) no-repeat 50% 50%;
}

.wish {
   background: url(../image/btn_goods_wish.png) no-repeat 50% 50%;
}

.name_box {
	height: 40px;
	font-size: 14px;
    line-height: 40px;
    color: #ffffff;
    background-color: #000000;
    padding: 0 15px 0 15px;
    margin: 0px 0px 20px 0px;
}
a.cursor:hover {
	cursor: pointer;
}
</style>
</head>
<body>
<div class="container">
	<div class="row" style="min-height: 200px; margin: 0 0 30px 0; padding: 0 10px; position: relative;">
			
		<!-- 좌측 사이드 메뉴바 -->
		<div id="jb-sidebar">
			<div id="accordion" role="tablist">
				<div class="card_">
					<div class="card-header" role="tab" id="headingOne" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						<h5 class="mb-0">
							<a style = "cursor: pointer"> Mypage </a>
						</h5>
					</div>
					<div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							<a class="cursor" id="mypage_member_modifyBtn">회원정보수정</a></br>
							<a class="cursor" id="mypage_deleveryBtn">주문배송조회</a></br>
							<a class="cursor" id="mypage_inquiryBtn">나의 1:1 문의</a></br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 센터 내용 영역 -->
		<div id="jb-content" class="border-0">
			<!-- 컨텐츠 내용 영역 -->
			<div class="name_box">
				${session_name}님을 환영합니다.
			</div>
			<div>
				<h3 style="text-align: center;">최근 주문 내역</h3>
			</div>
			
			<div id="recently_order_div">
			   <table id="recently_order_table">
			       <thead>
			      <tr>
			         <th>주문일시</th>
			         <th>주문상태</th>
			         <th>상품코드</th>
			         <th>수량</th>
			         <th>가격</th>
			         <th>총액</th>
			      </tr>
			   </thead>
			   </table>
			</div>
			
			<!--// 컨텐츠 내용 영역 -->		
		</div>
	</div>
</div>
</body>
<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready( function () {
   
   $('#recently_order_table').DataTable({
       ajax: {
            'url':'/MultiShop/mypage/recentlyOrder.do',
            'type': 'POST'
         },
         columns: [
             {"data": "o_date"},
             {"data": "o_status","class":"o_status"},
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
                 "targets": 5
             }
         ],
         responsive: true,
         "ordering": false,
         "searching": false,
         "pageLength": 5,
         "info" : false,
         "paging" : false,
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
</html>