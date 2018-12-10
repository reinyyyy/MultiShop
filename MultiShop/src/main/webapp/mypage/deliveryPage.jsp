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
table.dataTable thead th {
	background-color: #dddddd;
	text-align: center;
}
a.cursor:hover {
	cursor: pointer;
}

td.details-control {
    background: url('../image/on.png') no-repeat center center;
    cursor: pointer;
    background-size: 30px;
}
tr.shown td.details-control {
    background: url('../image/off.png') no-repeat center center;
    background-size: 30px;
}
/* .dataTable {width:100%; border:1px solid red;}
.dataTables_scrollHeadInner {width:100%;}
 */table.dataTable {margin:0px !important;}
</style>
</head>
<body>
<div class="container">
	<div class="row" style="min-height: 200px; margin: 0 0 30px 0; padding: 0 10px; position: relative;">
			
		<!-- 좌측 사이드 메뉴바 -->
		<div id="jb-sidebar" class="m_jb-sidebar">
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
							<a class="cursor" id="mypage_withdrawalBtn">회원탈퇴</a></br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 센터 내용 영역 -->
		<div id="jb-content" class="border-0 m_jb-content">
			<!-- 컨텐츠 내용 영역 -->
			<div style="text-align:center;">
            	<i class="fas fa-truck fa-3x"></i>
           	 	<h3 style="text-align: center;">나의 주문</h3>
        	</div>
			
			<div id="delivery_table_div">
			   <table id="delivery_table" style="width: 100%;">
			       <thead>
					<tr>
						<th>상세보기</th>
						<th>주문일시</th>
						<th class="order_status">주문상태</th>
						<th>주문번호</th>
						<th>상품번호</th>
						<th>상품명</th>
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
var status = '';
var p_code = '';
var p_amount = '';
var o_status = '';
function format ( data ) {
	p_code = data.p_code;
	p_amount = data.p_amount;
	o_status = data.o_status;
	 if(data.o_status=='배송대기'){
	 	status = '<tr>'+
	            	'<td>주문취소:</td>'+
	           		'<td>'+'<input type="button" class="cancelBtn" value="주문취소"/>'+'</td>'+
	      		 '</tr>';
	 }else if(data.o_status=='배송완료'){
		 status = '<tr>'+
     	'<td>반품:</td>'+
    		'<td>'+'<input type="button" class="cancelBtn" value="반품"/>'+'</td>'+
		 '</tr>';
	 }else{
		 status = '';
	 }
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>주문자:</td>'+
            '<td>'+data.m_name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>주문번호:</td>'+
            '<td>'+data.o_num+'</td>'+
        '</tr>'+
        '<tr>'+
	        '<td>배송번호:</td>'+
	        '<td>'+data.d_code+'</td>'+
	    '</tr>'+
        '<tr>'+
            '<td>배송지주소:</td>'+
            '<td>'+data.o_addr+'</td>'+
        '</tr>'+
        '<tr>'+
	        '<td>배송상태:</td>'+
	        '<td>'+data.o_status+'&emsp;'+status+'</td>'+
		'</tr>'+
    '</table>';
}
</script>

<script type="text/javascript">
$(document).ready( function () {
	
	var delivery = $('#delivery_table').DataTable({
       ajax: {
            'url':'/MultiShop/mypage/delivery.do',
            'type': 'POST'
         },
         columns: [
        	 { "class":          "details-control",
                 "orderable":      false,
                 "data":           null,
                 "defaultContent": ""},
             {"data": "o_date"},
             {"data": "o_status","class":"o_status"},
             {"data": "o_num"}, 
             {"data": "p_code"},
             {"data": "p_name"},
             {"data": "p_amount"},
             {"data": "p_cost"},
             {"data": "p_cost"}
         ],
         "columnDefs": [
             {
                 "render": function ( data, type, row ) {
                     return data *row['p_amount'];
                 },
                 "targets": 7
             },{
            	 "visible":false,
            	 "targets": 3
             },{
            	 "visible":false,
            	 "targets": 4
             }
         ],
         responsive: true,
         "ordering": false,
         "searching": false,
         "pageLength": 5,
         "lengthChange": false,
         "scrollX" : true,
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
	$('#delivery_table').on('click','td.details-control',function(){
	  	var tr = $(this).closest('tr');
        var row = delivery.row(tr);
        
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
	});
	$('#delivery_table').on('click','input.cancelBtn',function(){
		var o_num = $(this).parent().parent().prev().prev().prev().prev().children().last().text();
		$.post('/MultiShop/mypage/orderCancel.do',
				{"o_num":o_num,"m_email":'${session_email}',"p_code":p_code,"p_amount":p_amount,"o_status":o_status},
				function(data){
					if(data=='true'){
						if(o_status=='배송완료'){
							alert('반품이 완료되었습니다.');
							location.reload();
						}else{
							alert('주문이 취소되었습니다.');
							location.reload();
						}
					}else{
						alert(data);
					}
				},'text'
		);
	});
	
	
	
});
</script>
</html>
