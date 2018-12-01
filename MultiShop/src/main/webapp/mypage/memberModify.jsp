<<<<<<< HEAD
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
			<!-- 컨텐츠 내용 영역 -->
		
			<div id="member_modify_confirm" class="row modify_table mt30">
				<form id="member_modify_confirm_form" method="post" action="/MultShop/">
					<div class="col-md-12">
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="far fa-envelope -o fa-fw"></i></span>
							<input type="text" class="form-control" id="member_modify_email" name="m_email" value='${session_email }' readonly="readonly" >
						</div>
					</div>
					<div class="col-md-12">
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
							<input type="password" class="form-control" id="member_modify_pwd" name="m_pwd" placeholder="비밀번호">
						</div>
					</div>
					<div class="col-md-12">
						<div id="member_modify_statusDiv">
						</div>
					</div>
					<div class="col-md-12">
						<div class="table_btn_area">
							<input type="button" class="btn btn-success" value="확인" id="member_modify_confirm_Btn">
							<input type="reset" class="btn btn-secondary" value="취소">
						</div>
					</div>
				</form>
			</div>	
			
			<!--// 컨텐츠 내용 영역 -->		
		</div>
	</div>
</div>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <div id="member_modify_confirm">
   <form id="member_modify_confirm_form" method="post" action="/MultShop/">
      <div>
         이메일 : <input type="text" id="member_modify_email" name="m_email" value='${session_email }' readonly="readonly">
      </div>
      <div>
         비밀번호 : <input type="password" id="member_modify_pwd" name="m_pwd">
      </div>
      <div id="member_modify_statusDiv">
      </div>
      <div>
         <input type="button" value="확인" id="member_modify_confirm_Btn">
         <input type="reset" value="취소">
      </div>
   </form>
   </div>
>>>>>>> refs/remotes/origin/minu
