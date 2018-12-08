<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<html class="no-js" lang="ko"><!--<![endif]--><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="format-detection" content="telephone=no">
	<title>마이소호 판매자센터</title>
	<link rel="stylesheet" href="../css/admin.css">
    <link rel="shortcut icon" href="/mysoho_icon.png" type="image/x-icon">
    <link rel="icon" href="/mysoho_icon.png" type="image/x-icon">
    <meta name="description" content="">
    <meta name="apple-mobile-web-app-capable" content="no">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="../css/admin.css">
        <link rel="stylesheet" href="/assets/admin/css/default/pc.css?v=1.0.2">
        <link rel="stylesheet" href="/assets/admin/css/default/important.css?1542888459">
    <link rel="stylesheet" href="/assets/admin/css/default/jquery-ui.css">
    <link rel="stylesheet" href="/assets/admin/css/jquery-ui-sortable.css">
    <link rel="stylesheet" href="/assets/admin/css/extend.css?5"> <!-- /default 폴더 내 css 확장 : 최종 수정 시 time 뺄 것-->
	<link rel="stylesheet" type="text/css" href="/assets/admin/css/default/idangerous.swiper.css">
	
    <!--jQuery-->
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery-migrate-1.4.1.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery-ui.js"></script>
    <!--common-->
    <!-- <script src = "../js/manage/product.js"></script> -->
<!--     <script type="text/javascript" src="/assets/common/js/vendor/jquery.popupoverlay.js"></script>
    <script type="text/javascript" src="/assets/common/js/vendor/clipboard.min.js"></script>
    <script type="text/javascript" src="/assets/common/js/mysoho.js?ver=1.0.0"></script>
    <script type="text/javascript" src="/assets/common/js/utility.js?ver=1.0.0"></script>
    <script type="text/javascript" src="/assets/common/js/global.js?ver=1.0.0"></script>
    <script type="text/javascript" src="/assets/common/js/layer.js?ver=1.0.0"></script>
    <script type="text/javascript" src="/assets/common/js/clipboard.action.js?ver=1.0.0"></script>
    <script type="text/javascript" src="/assets/admin/js/jquery-ui.dialog.custom.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery-ui-sortable.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery-ui.touch.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/idangerous.swiper.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/vendor/jquery.sticky.js"></script>
    <script type="text/javascript" src="/assets/admin/js/js.cookie.js"></script>
    <script type="text/javascript" src="/assets/admin/js/plugins.js?1542888459"></script>
    <script type="text/javascript" src="/assets/admin/js/kakao.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/jquery.slides.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/jquery.tablednd.js"></script>
    <script type="text/javascript" src="/assets/admin/js/jquery.nicescroll.min.js"></script>
    <script type="text/javascript" src="/assets/admin/js/jquery.fixedheadertable.js"></script> -->
    <!--[if lt IE 9]>
        <script type="text/javascript" src="/assets/admin/js/vendor/html5shiv.js"></script>
    <![endif]-->
    <!--[if (gte IE 6)&(lte IE 8)]>
        <script type="text/javascript" src="/assets/admin/js/vendor/selectivizr-min.js"></script>
    <![endif]-->
</head>
<style>
	
</style>
<body style="">
<script type="text/javascript">
var isMobile    = false;
var admDir      = "/adm";
var imgPath     = "//image.makeshop.co.kr/mysoho";
</script>
<div id="aside" tabindex="1" style="overflow: hidden; outline: none;">
    <div class="menu-wrapper">
        <div class="hd ani">
            <div class="hd-profile">
                <div class="inner">
                    <div class="info">
                        <p class="photo">
                            <!--a href="/adm/mypage/profile"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/common/tmp_profile.png" alt=""></a-->
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
                <a href="#" menu_id="2">상품관리</a>
	            <ul style="display:block;">
		            <li class=" ">
		                <a href="../manage/productAdd.do">상품 등록</a>
		            </li>
		            <li class="now ">
		                <a href="../manage/productLists.do">상품 리스트</a>
		            </li>
	            </ul>
            </li>
            <li class="order ">
                <a href="#" menu_id="3">주문관리</a>
                <ul style="display:block;">
                	<li class=" ">
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
			<p class="title">마이소호 고객센터</p>
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

<script>
// 선택된 하위메뉴 상위메뉴가 안열렸을경우 실행
if ($m('#snb li ul .now').length != 0 && $m('#snb li ul .now').parent().parent('.now').length == 0) {
    $m('#snb li ul .now').parent().parent().addClass('now');
    $m('#snb li ul .now').parent().show();
}
</script>



<div id="header">
    <h2>주문내역</h2>
        <a href="/adm/" class="btn-home"><span>홈</span></a>
            <a href="#" class="btn-back"><span>뒤로가기</span></a>
    </div>

<div id="container" class="">
    <div class="page-hd">
        <h1>
            <a href="/adm/main">
            <img src="//image.makeshop.co.kr/mysoho/assets/admin/images/common/logo_h30.gif" alt="mysoho" style="margin-right:10px;">
            판매자 센터</a>
        </h1>
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
<script>
	// 17.12.15 주문 현황/검색 sms 배너 랜덤노출 추가
	var banner = new Array();
	banner[0] = '<a href="/adm/service/sms"><img src="' + imgPath + '/assets/admin/images/event/sms_banner1.jpg" alt="주문 고객에게 자동으로 sms 발송"></a>';
	banner[1] = '<a href="/adm/service/sms"><img src="' + imgPath + '/assets/admin/images/event/sms_banner2.jpg" alt="주문 고객에게 자동으로 sms 발송"></a>';

	var random_banner = Math.floor(Math.random()*(banner.length));
</script>
<input type="hidden" name="autoSms[delinum]" value="">
<input type="hidden" name="autoSms[prod_deli]" value="">
	<jsp:include page="${display }"/>

</body>
</html>
