<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko"><!--<![endif]--><head>
    <meta charset="utf-8">
	<title>판매자센터</title>
	<link rel="stylesheet" href="../css/admin.css">
    <!-- <link rel="shortcut icon" href="/mysoho_icon.png" type="image/x-icon"> -->
    <link rel="stylesheet" href="../css/calendar.css">
    <!-- <link rel="icon" href="/mysoho_icon.png" type="image/x-icon"> -->
    <link rel="stylesheet" href="../css/admin.css">
    <!-- 달력 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <style type="text/css">
    	#memberTotalTable td{
    		text-align: center;
    	}
    </style>
    	
    <!--jQuery-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 달력 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <!--common-->
    <script src = "../js/manage/product.js"></script>
    <script src="../js/manage/member.js"></script>
    <script src="../js/manage/calendar.js"></script>
    <script>
	$(document).ready(function(){
		
		$('#snb').on('click','li',function(){
			$('#snb li').removeClass('now');
			$('#snb li ul').css('display','none');
			$(this).addClass('now');
			$('#snb .now ul').css('display','block');
		});

	});
	</script>
</head>
<style type="text/css">
#snb:hover {
	color : #00affe;
}
</style>
<body style="">

<script type="text/javascript">
var isMobile    = false;
var admDir      = "/adm";
var imgPath     = "//image.makeshop.co.kr/mysoho";
</script>
<input type="text" id="datepicker3">
<div id="aside" tabindex="1" style="overflow: hidden; outline: none;">
    <div class="menu-wrapper">
        <div class="hd ani">
            <div class="hd-profile">
                <div class="inner">
                    <div class="info">
                        <p class="photo">
                            <a href="../manage/main.do"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/common/tmp_profile.png" alt=""></a>
                            <a href="/adm/mypage/profile" class="btn-pf-setting"></a>
                        </p>
                        <dl>
                            <dt>
                                <p><strong></strong></p>
                            </dt>
                            <dd class="h24">
                                <p>y70ead@naver.com</p>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div><!-- // .hd .ani -->
        <ul id="snb">
        	<li class="product">
                <a href="#"  id="productManageBtn" menu_id="2">상품관리</a>
	            <ul id="productManageUl" style="display:none">
		            <li class="" value="0">
		                <a href="../manage/productAdd.do">상품 등록</a>
		            </li>
		            <li class="productList ">
		                <a href="../manage/productLists.do">상품 리스트</a>
		            </li>
	            </ul>
            </li>
            <li class="order ">
                <a href="#" id="orderManageBtn" menu_id="3">주문관리</a>
                <ul id="orderManageUl" style="display:none">
                	<li class=" " value="0">
                        <a href="../manage/orderManageTotal.do">주문내역</a>
                    </li>
                    <li class=" ">
                        <a href="../manage/orderSimpleTotal.do">개인 결제 내역</a>
                    </li>
                </ul>
            </li>
            <li class="direct member ">
                <a href="../manage/memberTotal.do">고객관리</a>
            </li>
        </ul>
		<!-- 18.02.23 hsh 추가 s -->
		<div class="customer-wrap">
			<p class="title">고객센터</p>
			<p class="number">02.1234.1234</p>
			<ul>
				<li><a href="https://www.naver.com" class="kakao" target="_blank"><span>실시간 상담</span></a></li><!-- 18.02.23 hsh -->
				<li><a href="https://www.google.com" class="question" target="_blank"><span>1:1 문의</span></a></li><!-- 18.02.23 hsh -->
			</ul>
			<p class="bot-txt">
				평일 9:30~18:30<br>
				주말, 공휴일 휴무
			</p>
		</div>
    </div><!-- .menu-wrapper -->
</div>

<div id="container" class="">
    <div class="page-hd">
        <h1><a href="/adm/main">판매자 센터</a></h1>
        <div class="side">
			<dl class="copy">
                <dt>주소복사</dt>
                <dd class="dd-box" style="display: none;">
                    <ul id="top_copy_url">
                        <li><a href="https://mk644.mysoho.com/" onclick="mysoho.clipboardAction.copyToAlertMessage('https://mk644.mysoho.com/');return false;" target="_blank">쇼핑몰 주소</a></li>
                        <li><a href="https://mk644.mysoho.com/myorder" onclick="mysoho.clipboardAction.copyToAlertMessage('https://mk644.mysoho.com/myorder');return false;" target="_blank">배송조회 페이지</a></li>
                    </ul>
                </dd>
            </dl>
            <dl class="mysns">
                <dt>나의 SNS</dt>
                <dd class="dd-box" style="display: none;">
                    <ul id="top_open_sns">
                                                <li><a href="//www.facebook.com" target="_blank" class="fb">페이스북</a></li>
                                                <li><a href="//www.instagram.com" target="_blank" class="insta">인스타그램</a></li>
                                                <li><a href="//story.kakao.com" target="_blank" class="kas">카카오스토리</a></li>
                                                <li><a href="//blog.naver.com" target="_blank" class="blog">네이버블로그</a></li>
                                                <li><a href="//twitter.com" target="_blank" class="twitter">트위터</a></li>
                                                <li><a href="//plus.google.com" target="_blank" class="google">구글+</a></li>
                                                                        <li><a href="/adm/mypage/mysns/mysns" class="btn-add"></a></li>
                    </ul>
                </dd>
            </dl>
            <div class="btn-wrap">
                <a href="/adm/mypage/admin" class="btn-mypage">마이페이지</a>
                <a href="//www.mysoho.com/customer_service.html?page_type=qa" target="_blank" class="btn-question">문의</a>
                <a href="/adm/auth/logout/" class="btn-logout">로그아웃</a>
            </div>
        </div>
    </div><!-- .page-hd -->
<style type="text/css">
/*.layer-wrap .lhd .btn-close { background-repeat: no-repeat; background-color: #3f464f; background-position: 50% 50%; }*/
.period-4x .btn-toggle {
    width:20%;
}
.hide {display:none;}
.tbl-list.tbl-extend table {min-width:1400px;}
</style>
<input type="hidden" name="autoSms[delinum]" value="">
<input type="hidden" name="autoSms[prod_deli]" value="">
	<jsp:include page="${display }"/>
</body>
</html>
