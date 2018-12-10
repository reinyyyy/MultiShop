<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>리스트</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> -->
<!-- 위에 src는 bootstrap.min.js:6 Uncaught Error: Bootstrap dropdown require Popper.js 에러잡아줌  -->

<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href = "../css/categoryItemList.css" rel = "stylesheet">
<!-- 	<link href="../css/contents.css" rel="stylesheet">
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
.card-header {
	background-color: #f3f3f3;
}
.card-body {
	background-color: #ffffff;
}
.card-body p{
	cursor : pointer;
}

.card-body p:hover{
	color : red;
}

.mb-0 a:hover{
	color : fuchsia;
}

.card-body h4{
	overflow: hidden;
	width : 100%;
	text-overflow: ellipsis;
	white-space: nowrap;
}

</style>
</head>
<body style="width: 100%">
<!-- 팝업 -->
<input type = hidden id = "cateNum" value = "${cateNum}"/>
<input type = hidden id = "pg" value = "${pg}"/>



	<!-- The Modal -->
	<div class="modal fade" id="quick_view" data-backdrop="false">
		<div class="modal-dialog"  style="max-width: 80%; width: auto;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Quick View</h4>
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body quickViewBody" style = "margin-left : 50px; overflow : hidden;">	<!--  ajax 호출  -->
					
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<div id="jb-container">
		
		<!-- 좌측 사이드 메뉴바 -->
		<div id="jb-sidebar" class = "jb-absolute">
			<div id="accordion" role="tablist">
				<div class="card_ 3">
					<div class="card-header" role="tab" id="headingOne"
						data-toggle="collapse" href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne">
						<h5 class="mb-0">
							<a style = "cursor: pointer"> Clothes </a>
						</h5>
					</div>

					<div id="collapseOne" class="collapse show" role="tabpanel"
						aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							<p>All</p>
							<p>Outer</p>
							<p>Top</p>
							<p>Bottom</p>
							<p>Shoes</p>
							<p>Inner</p>
						</div>
					</div>
				</div>
				<div class="card_ 2">
					<div class="card-header collapsed" role="tab" id="headingTwo"
						data-toggle="collapse" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">
						<h5 class="mb-0">
							<a style = "cursor: pointer"> Tech++ </a>
						</h5>
					</div>
					<div id="collapseTwo" class="collapse" role="tabpanel"
						aria-labelledby="headingTwo" data-parent="#accordion">
						<div class="card-body">
							<p>All</p>
							<p>Audio/Video</p>
							<p>Game</p>
							<p>Smart Watch</p>
							<p>Drone</p>
							<p>TV</p>
							<p>Laptop/Computer HardWare</p>
						</div>
					</div>
				</div>
				<div class="card_ 1">
					<div class="card-header collapsed" role="tab" id="headingThree"
						data-toggle="collapse" href="#collapseThree" aria-expanded="false"
						aria-controls="collapseThree">
						<h5 class="mb-0">
							<a style = "cursor: pointer"> Food </a>
							
						</h5>
					</div>
					<div id="collapseThree" class="collapse" role="tabpanel"
						aria-labelledby="headingThree" data-parent="#accordion">
						<div class="card-body">
							<p>All</p>
							<p>Carbohydrate</p>
							<p>Protein</p>
							<p>Fat</p>
							<p>Fruit</p>
							<p>Spice</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 센터 내용 영역 -->
		<div id="jb-content">
		<!-- 상단 히스토리 바 -->
		<div id="carouselExampleIndicators" class="carousel slide"
            data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#carouselExampleIndicators" data-slide-to="0"
                  class="active"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
               <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <img class="d-block w-100" src="../image/timberland.jpg" alt="First slide">
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100" src="../image/techcategory.jpg" alt="Second slide">
               </div>
               <div class="carousel-item">
                  <img class="d-block w-100" src="../image/foodcategory.png" alt="Third slide">
               </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators"
               role="button" data-slide="prev"> <span
               class="carousel-control-prev-icon" aria-hidden="true"></span> <span
               class="sr-only">Previous</span>
            </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
               role="button" data-slide="next"> <span
               class="carousel-control-next-icon" aria-hidden="true"></span> <span
               class="sr-only">Next</span>
            </a>
         </div>
		<%-- 	<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<!-- 사용자 클릭히스토리로 동적 처리필요 -->
					<li class="breadcrumb-item"><a href="../main/index.do">HOME</a></li>
					<li class="breadcrumb-item"><a onclick="goPage('${cateNum}')" href = "javascript:void(0)">${pageName }</a></li>
					<li class="breadcrumb-item active" aria-current="page">데이터</li>
				</ol>
			</nav> --%>
		
			<div class="array" style="width: 100%;">
				<div class="arrayList">
					<ul>
						<li class="active" onclick="fn_sort(2);"><a href="#link"><i class="fas fa-star">&emsp;</i>인기순</a></li>
						<li><a href="#link" onclick="fn_sort(1);"><i class="fas fa-plus-square"></i>&emsp;신상품순</a></li>
						<li><a href="#link" onclick="fn_sort(3);"><i class="fas fa-arrow-down"></i>&emsp;낮은가격순</a></li>
						<li><a href="#link" onclick="fn_sort(4);"><i class="fas fa-arrow-up"></i>&emsp;높은가격순</a></li>
					</ul>
				</div>
				<!--  몇개씩 보여줄 것인지 -->
				<div class="select">
					<span>DISPLAY</span> <span class="selectRecordCount"> 
						<a href = "#" onclick = "$('#pageSize').val(8)">8</a> 
						<a href = "#" onclick = "$('#pageSize').val(12)">12</a> 
						<a href = "#" onclick = "$('#pageSize').val(16)">16</a>
					</span>
				</div>
			</div>


			<div id="card_contents" style="width: 100%;">
				<!-- ajax로 json 여기로 부르면됨 -->
				<!-- 카드 하나당 하나의 제품이 들어옴 -->
				
			</div>
			
			<!-- 페이징 처리 영역 -->
			<div id="jb-footer">
				<div align="center" id = "categoryPaging">
					<!-- <button type="button" class="btn btn-secondary" onclick="alert();">1</button>
					<button type="button" class="btn btn-secondary">2</button>
					<button type="button" class="btn btn-secondary">3</button>
					<button type="button" class="btn btn-secondary">다음</button> -->
					<nav aria-label="...">
						<ul class="pagination justify-content-center">
							
						</ul>
					</nav>
				</div>

				<!-- <div class="input-group">	여기에서 검색만들꺼면 이거쓰면됨
						<span class="input-group-addon" id="btnGroupAddon2">@</span> 
						<input type="text" class="form-control" placeholder="넣을 수도 뺄수도 있습니다"
						aria-label="입력그룹 예제" aria-describedby="btnGroupAddon2">
					</div> -->
					<div>
				</div>
			</div>
		</div>
	</div>
	<!-- jb-contents 끝 -->
<jsp:include page="../detail_Modal/detail_Modal.jsp"/>
   <jsp:include page="../detail_Modal/detail_nonLogin.jsp"/>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	<script type="text/javascript" src="../js/detailPage.js"></script>
	<script>
	//카테고리 값으로 받아옴	
		$(document).ready(function(){
			var p_code;
			
			$(document).on('click', '.quick', function(){
				p_code = $(this).prev().val();
				$('#quick_view').modal();
			});
			
			

			//모달 클릭이벤트 QUICK VIEW 클릭 이벤트
			$("#myBtn").click(function() {
				$("#quick_view").modal();
			});
			
			//QUICK VIEW 모달 로딩완료 이벤트
			$('#quick_view').on('shown.bs.modal', function(){
				$.ajax({
					type : "POST",
					url : "quickView.do",
					data : {'p_code' : p_code, 'cateNum' : $("#cateNum").val()},												//DB만들면 data에 상품 대표하는 값 집어넣어줘야함 $('#p_code').val()
					dataType : 'html',
					success : function(data){
						
						$('.quickViewBody').html(data);						
					},
					error : function(){
						alert("에러");	
					}
				});
			});
//195 
			var sidebar_top = $('#jb-sidebar').offset().top;
			
			$(window).scroll(function() {
				test = $('#jb-sidebar').height() + $('#jb-sidebar').offset().top;
				
				if($(document).scrollTop() > sidebar_top){
					if($('#jb-sidebar').offset().top - $(document).scrollTop() >= 195){
						$('#jb-sidebar').removeClass('jb-bottom').addClass('jb-fixed');
						return;
					}
					if(test >= $('#jb-content').height()){
						$('#jb-sidebar').removeClass('jb-fixed').addClass('jb-bottom');
						return;
					}
					$('#jb-sidebar').addClass('jb-fixed').removeClass('jb-absolute');
				}else{
					$('#jb-sidebar').addClass('jb-absolute').removeClass('jb-fixed');
				}
				
				
				
				
				
				/* 
				if ($(document).scrollTop() > jbOffset.top) {
					test = $('#jb-sidebar').height() + $('#jb-sidebar').offset().top;
					
					alert($('#jb-sidebar').attr('class'));
					
					if($('#jb-sidebar').attr('class') == 'jb-bottom'){
						$('#jb-sidebar').addClass('jb-fixed').removeClass('jb-bottom');
					}
					
					if(test >= $('#jb-content').height()){
						$('#jb-sidebar').removeClass('jb-fixed').addClass('jb-bottom');
					}
					//$('#jb-sidebar').attr('id', 'jb-fixed');
				}  else {
					//$('#jb-fixed').attr('id', 'jb-sidebar');
					alert("요기들어옴");
					$('#jb-sidebar').addClass('jb-absolute').removeClass('jb-fixed');
				} */
				
				
			});

			//1 : food , 2 : tech, 3 : clothes
			//목록 클릭트리거
			if ('${cateNum}' == 2) {
				$('#headingTwo').trigger('click');
			} else if ('${cateNum}' == 1) {
				$('#headingThree').trigger('click');
			}
			
			//모달 닫힘이벤트
			$('#quick_view').on('hide.bs.modal', function(e){
				$('.quickViewBody').empty();
			});
			
			//네비바 손가락 마킹
			if("${p_midCate}" == '' ){
				$('#accordion').find($('.'+"${cateNum}")).find('a').parent().parent().next().find($('p:contains("All")')).before('<i class="fas fa-hand-point-down"></i>').css('font-weight', 'bold');
			}else{
				$('#accordion').find($('.'+"${cateNum}")).find('a').parent().parent().next().find($('p:contains("${p_midCate}")')).before('<i class="fas fa-hand-point-down"></i>').css('font-weight', 'bold');
			}
			
			
		});
	
		//제품 내용물 생성
		function card(items) { //DB컬럼명을 가져다 써야함 banana.jpg			//받아오는거 DTO 에서 boardLIST 로 변경해야댐
			var result = items.p_main_img.split('/');
			var src = '../upload/' + result[1];
			console.log(result[1]);
			var name = items.p_name;
			/* var content = items.p_contents; */
			var price = items.p_COST;		//제품테이블에서 받아와함.
			var p_code = items.p_code;
			
			var card_html = 
					'<div class="card" align="center">'
					+ '<div style="position : relative;">'
					+ '<img class="card-img-top" src="' + src + '" alt="Card image cap" style = "cursor : pointer;">'
					+ '<div class="quick_menu" style="background : rgba(0,0,0,0.8)">'
					/* + '<a  class="btnl link" target="_blank" float="left"/>' */
					+ '<input type = "hidden" name = "p_code" value = ' + p_code + '>'
					+ '<a href="#;" class="quick" style="color : white;">QUICK VIEW</a>'
					+ '<span id = "product_email" style="color:white; cursor:pointer;"><i style="padding: 8px" class="fas fa-envelope fa-2x"  data-backdrop="static" data-toggle="modal" data-target="#send_email" aria-label="Left Align"></i></span>'
					/* + '<a href="javascript:loginChk();void(0);" class="btnl wish" float="right"/>' */
					+ '</div>' + '</div>' + '<div class="card-event">'
					+ '<li class="list-group-item">'+ '￦ '+ addComma(price)+'</li>'
					+ '</div>' + '<div class="card-body">'
					+ '<h4 class="card-title">' + name + '</h4>'
					+ '<p class="card-text">' +''+ '</p>' + '</div>' /* + content + */ 
					+ '</div>';
			return card_html;
		}
		//상품 문의 모달창 
		$(document).on('click', '#product_email', function(){
			var product_name = $(this).parents().next().next().find('.card-title').html();
			$('#inputTitle').val(product_name);
		});
		
		//상세 페이지 이동 이벤트
		$(document).on('click','.card-img-top', function(){
			var p_code = $(this).next().find('input').val();
			var cateNum = $('#cateNum').val();
			location.href = "../detail_page/detailPage.do?p_code="+p_code+"&cateNum="+cateNum+'&p_name='+$('#p_name').val();
		});
		
		//3자리수 콤마 제작 함수
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
		
		
		
		
	</script>
	<script src="../js/categoryItemList.js"></script>
</body>
</html>
























