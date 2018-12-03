
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>����Ʈ</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> -->
<!-- ���� src�� bootstrap.min.js:6 Uncaught Error: Bootstrap dropdown require Popper.js ���������  -->

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
</style>
</head>
<body style="width: 100%">
<!-- �˾� -->
<input type = hidden id = "cateNum" value = "${cateNum}"/>
<input type = hidden id = "pg" value = "${pg}"/>



	<!-- The Modal -->
	<div class="modal fade" id="myModal" data-backdrop="false">
		<div class="modal-dialog"  style="max-width: 80%; width: auto;">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">��</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body quickViewBody" style = "margin-left : 50px; overflow : hidden;">	<!--  ajax ȣ��  -->
					
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<div id="jb-container">
		
		<!-- ���� ���̵� �޴��� -->
		<div id="jb-sidebar">
			<div id="accordion" role="tablist">
				<div class="card_">
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
							<a>All</a>
							<a>Outer</a>
							<a>Top</p>
							<a>Bottom</p>
							<a>Shoes</p>
							<a>Inner</p>
						</div>
					</div>
				</div>
				<div class="card_">
					<div class="card-header collapsed" role="tab" id="headingTwo"
						data-toggle="collapse" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo">
						<h5 class="mb-0">
							<a> Tech++ </a>
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
				<div class="card_">
					<div class="card-header collapsed" role="tab" id="headingThree"
						data-toggle="collapse" href="#collapseThree" aria-expanded="false"
						aria-controls="collapseThree">
						<h5 class="mb-0">
							<a> Food </a>
							
						</h5>
					</div>
					<div id="collapseThree" class="collapse" role="tabpanel"
						aria-labelledby="headingThree" data-parent="#accordion">
						<div class="card-body">
							<p>All</p>
							<p>Carbohydrate</p>
							<p>Protein</p>
							<p>Fat</p>
							<p>Vitamin</p>
							<p>Spice</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ���� ���� ���� -->
		<div id="jb-content">
		<!-- ��� �����丮 �� -->
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<!-- ����� Ŭ�������丮�� ���� ó���ʿ� -->
					<li class="breadcrumb-item"><a href="../main/index.do">HOME</a></li>
					<li class="breadcrumb-item"><a onclick="goPage('${cateNum}')" href = "javascript:void(0)">${pageName }</a></li>
					<li class="breadcrumb-item active" aria-current="page">������</li>
				</ol>
			</nav>
		
			<div class="array" style="width: 100%;">
				<div class="arrayList">
					<ul>
						<li class="active" onclick="fn_sort('6');"><a href="#link">�α��</a></li>
						<li><a href="#link" onclick="fn_sort('1');">�Ż�ǰ��</a></li>
						<li><a href="#link" onclick="javascript:fn_sort('3');">�������ݼ�</a></li>
						<li><a href="#link" onclick="javascript:fn_sort('4');">�������ݼ�</a></li>
						<li><a href="../detail_page/detailPage.do" onclick="">������</a></li>
					</ul>
				</div>
				<!--  ��� ������ ������ -->
				<div class="select">
					<span>DISPLAY</span> <span class="selectRecordCount"> <a
						href="#link" val="10">10</a> <a href="#link" val="20">20</a> <a
						href="#link" val="100">ALL</a>
					</span>
				</div>
			</div>


			<div id="card_contents" style="width: 100%;">
				<!-- ajax�� json ����� �θ���� -->
				<!-- ī�� �ϳ��� �ϳ��� ��ǰ�� ���� -->
				
			</div>
			
			<!-- ����¡ ó�� ���� -->
			<div id="jb-footer">
				<div align="center" id = "categoryPaging">
					<!-- <button type="button" class="btn btn-secondary" onclick="alert();">1</button>
					<button type="button" class="btn btn-secondary">2</button>
					<button type="button" class="btn btn-secondary">3</button>
					<button type="button" class="btn btn-secondary">����</button> -->
				</div>

				<!-- <div class="input-group">	���⿡�� �˻����鲨�� �̰ž����
						<span class="input-group-addon" id="btnGroupAddon2">@</span> 
						<input type="text" class="form-control" placeholder="���� ���� ������ �ֽ��ϴ�"
						aria-label="�Է±׷� ����" aria-describedby="btnGroupAddon2">
					</div> -->
			</div>
		</div>
	</div>
	<!-- jb-contents �� -->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="../js/categoryItemList.js"></script>
	<script type="text/javascript" src="../js/detailPage.js"></script>
	<script>
	//ī�װ� ������ �޾ƿ�	
		$(document).ready(function(){
			var p_code;
			
			$(document).on('click', '.quick', function(){
				p_code = $(this).prev().val();
				$('#myModal').modal();
			});
			
			

			//��� Ŭ���̺�Ʈ QUICK VIEW Ŭ�� �̺�Ʈ
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
			
			//QUICK VIEW ��� �ε��Ϸ� �̺�Ʈ
			$('#myModal').on('shown.bs.modal', function(){
				$.ajax({
					type : "POST",
					url : "quickView.do",
					data : {'p_code' : p_code, 'cateNum' : $("#cateNum").val()},												//DB����� data�� ��ǰ ��ǥ�ϴ� �� ����־������ $('#p_code').val()
					dataType : 'html',
					success : function(data){
						
						$('.quickViewBody').html(data);						
					},
					error : function(){
						alert("����");	
					}
				});
			});

			var jbOffset = $('#jb-sidebar').offset();

			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('#jb-sidebar').attr('id', 'jb-fixed');
				} else {
					$('#jb-fixed').attr('id', 'jb-sidebar');
				}
			});

			//1 : food , 2 : tech, 3 : clothes
			//��� Ŭ��Ʈ����
			if ('${cateNum}' == 2) {
				$('#headingTwo').trigger('click');
			} else if ('${cateNum}' == 1) {
				$('#headingThree').trigger('click');
			}
			
			//��� �����̺�Ʈ
			$('#myModal').on('hide.bs.modal', function(e){
				$('.quickViewBody').empty();
			});
			

			//�۸�� �ҷ���
			$.ajax({
				type : 'POST',
				url : '../category/getList.do',
				data : {
					'cateNum' :  $("#cateNum").val(),
					'pg' : $("#pg").val()
				}, //����ǥġ�� ���ڿ�, ��ġ�� ���� 
				dataType : 'json',
				success : function(data) { //data���� ����Ʈ��
					//alert(JSON.stringify(data));
					var card_contents = '';
					$.each(data.list, function(index, items) {
						card_contents += card(items);
					});
					$('#card_contents').html(card_contents);
					$('#categoryPaging').html(data.categoryPaging.pagingHTML);

				}
			});
			/* $.postJSON('../category/getList.do', '${cateNum}', function(data){
				alert(data);
			}); */
		});
	
		
		//��ǰ ���빰 ����
		function card(items) { //DB�÷����� ������ ����� banana.jpg			//�޾ƿ��°� DTO ���� boardLIST �� �����ؾߴ�
			var result = items.p_main_img.replace('/', '');
			var src = '../upload/' + result;
			console.log(result);
			var name = items.p_name;
			var content = items.p_contents;
			var price = items.p_COST;		//��ǰ���̺��� �޾ƿ���.
			var p_code = items.p_code;
			
			var card_html = 
					'<div class="card" align="center">'
					+ '<div style="position : relative;">'
					+ '<img class="card-img-top" src="' + src + '" alt="Card image cap" style = "cursor : pointer;">'
					+ '<div class="quick_menu" style="background : rgba(0,0,0,0.8)">'
					+ '<a href="/product/view.asp?productNo=42046" class="btnl link" target="_blank" float="left"/>'
					+ '<input type = "hidden" name = "p_code" value = ' + p_code + '>'
					+ '<a href="#;" class="quick" style="color : white;">QUICK VIEW</a>'
					+ '<a href="javascript:loginChk();void(0);" class="btnl wish" float="right"/>'
					+ '</div>' + '</div>' + '<div class="card-event">'
					+ '<li class="list-group-item">' + addComma(price) + ' �� </li>'
					+ '</div>' + '<div class="card-body">'
					+ '<h4 class="card-title">' + name + '</h4>'
					+ '<p class="card-text">' + content + '</p>' + '</div>'
					+ '</div>';
			return card_html;
		}
		
		//�� ������ �̵� �̺�Ʈ
		$(document).on('click','.card-img-top', function(){
			var p_code = $(this).next().find('input').val();
			location.href = "../detail_page/detailPage.do?p_code="+p_code;
		});
		
		//3�ڸ��� �޸� ���� �Լ�
		function addComma(num) {
			  var regexp = /\B(?=(\d{3})+(?!\d))/g;
			  return num.toString().replace(regexp, ',');
		}
	</script>
</body>
</html>
























