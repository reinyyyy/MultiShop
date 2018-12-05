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
							<a class="cursor" id="mypage_inquiryBtn">나의 1:1 문의</a></br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 센터 내용 영역 -->
		<div id="jb-content" class="border-0">
			<!-- 컨텐츠 내용 영역 -->
		
			<div class="row modify_table mt30">
		         <form id="member_modify_form" role="form">
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="far fa-envelope -o fa-fw"></i></span>
		                  <input type="text" class="form-control" id="member_modify_email" name="m_email" value="${memberDTO.m_email}" aria-required="true" readonly>
		                  <input type="hidden" id="" value="0">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
		                  <input type="password" class="form-control" id="member_modify_pwd" name="m_pwd" placeholder="비밀번호" required="required">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
		                  <input type="password" class="form-control" id="member_modify_repwd" placeholder="비밀번호 재입력" required="required">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="far fa-user -o fa-fw"></i></span>
		                  <input type="text" class="form-control" id="member_modify_name" name="m_name" value="${memberDTO.m_name}" placeholder="이름" required="required">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="fas fa-mobile-alt -o fa-fw"></i></span>
		                  <input type="text" class="form-control" id="member_modify_phone" name="m_tel_phone" value="${memberDTO.m_tel_phone}" placeholder="- 빼고 입력" required="required">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <span class="input-group-addon"><i class="fas fa-map-marked-alt -o fa-fw"></i></span>
		                  <input type="text" class="form-control" id="member_modify_postcode" name="m_zipcode" value="${memberDTO.m_zipcode}" placeholder="우편번호" required="required">
		                  <input type="button" class="btn btn-dark" id="member_modify_postcodeBtn" value="우편번호찾기" onclick="execDaumPostcode2()">
		               </div>
		            </div>
		            <div class="col-md-12">
		               <div class="input-group" style="margin-bottom: 10px">
		                  <input type="text" class="form-control" id="member_modify_roadAddress" name="m_roadAddress" value="${memberDTO.m_roadAddress}" placeholder="도로명주소" readonly="">
		                  <input type="text" class="form-control" id="member_modify_jibunAddress" name="m_jibunAddress" value="${memberDTO.m_jibunAddress}" placeholder="상세 주소">
		               </div>
		            </div>
		            <div id="member_modify_statusDiv">
		            </div>
		            <div class="float_center">         
		               <button type="button" class="btn btn-success" id="member_modifyBtn">확인</button>
		            </div>
		         </form>
		      </div>
			<!--// 컨텐츠 내용 영역 -->		
		</div>
	</div>
</div>
</body>
</html>