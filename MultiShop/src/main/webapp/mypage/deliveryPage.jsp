<<<<<<< HEAD
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
							<a class="cursor" id="mypage_coupon_pointBtn">쿠폰/포인트</a></br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 센터 내용 영역 -->
		<div id="jb-content" class="border-0">
			<div id="delivery_table">
			
				<table id="myTable" class="table table-hover table_layout_fixed" style="width:100%;"> 
				    <thead class="table-dark">
				        <tr>
				            <th>주문번호</th>
				            <th>상품명</th>
				            <th>수량</th>
				            <th>금액</th>
				            <th>주문상태</th>
				            <th>기타</th>
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
	$('#myTable').dataTable({
    	ajax: {
            'url':'/MultiShop/mypage/delivery.do',
            'type': 'POST'
         },
         columns: [
             {"data": "o_num"},
             {"data": "p_code"},
             {"data": "p_cost"}, 
             {"data": "p_amount"}, 
             {"data": "o_status"},
             {"data": "o_tel"}
         ],
         "searching":false,//검색기능
         responsive: true,//반응형기능
         "ordering": false,//컬럼눌러서정렬기능
         "pageLength": 5,
         "lengthChange": false
    }); 
});
</script>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="delivery_div">
	<table class="table table-striped" id="delivery_table">
	  <thead>
	    <tr>
	      <th scope="col">주문번호</th>
	      <th scope="col">상품명</th>
	      <th scope="col">금액(수량)</th>
	      <th scope="col">총금액</th>
	      <th scope="col">주문상태</th>
	      <th scope="col">기타</th>
	    </tr>
	  </thead>
	  <tbody>
	  	  <c:forEach items="${orderList }" var="list">
		    <tr>
		      <th scope="row">${list.o_num }</th>
		      <td>${list.p_code }</td>
		      <td>${list.p_cost} (${list.p_amount }개)</td>
		      <td>${list.p_cost*list.p_amount }</td>
		      <td>${list.o_status }</td>
		      <td>기타</td>
		    </tr>
	  	 </c:forEach> 
	  </tbody>
	</table>
	<input type="hidden" id="pg" value=${pg }>
	<div id="delivery_paging">
		<ul class="pagination">
			${orderPaging}
		</ul>
	</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(window).on('load',function(){
	$('#delivery_div').load('/MultiShop/mypage/deliveryList.do',
			{"pg":$('#pg').val()},
			function(data){
				if(data=='true'){
					alert(data);
				}
			});
});


$(document).ready(function(){
	
	$('#paging').on('click',function(){
		event.preventDefault();
        event.stopPropagation();
        var pg = $(this).prop('name');
	});
	
	
});
</script>
</body>
>>>>>>> refs/remotes/origin/minu
</html>