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
    <script src = "../js/manage/product.js"></script>
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
<div id="popup_download_excel" style="display:none;">
<form id="excel_form" method="post" action="/adm/order/manage/downExcel">
<ul>
    <li>
        기간 &nbsp;
        <label class="calendar">
            <input type="text" name="excel_start_date" style="width:180px" value="2018-11-15"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar">
        </label> &nbsp; ~ &nbsp;<label class="calendar"><input type="text" name="excel_end_date" style="width:180px" value="2018-11-22"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
    </li>
    <li class="mt-20">
        양식 &nbsp;
        <select style="width:240px" name="select_excel_fields"><option value="">-- 다운로드 양식 선택 --</option></select>&nbsp;
        <a href="#" class="btn-setting btn-setting-excel">설정</a>
    </li>
</ul>
<div class="btn-c">
    <a href="#" class="btn-h52-blue btn-download-excel">다운로드</a>
</div>
</form>
</div>

<!-- template --> 
<div id="tpl_order_list" style="display:none;">
    <table id="tpl_order_row">
        <tbody>
            <tr>
                <td {{rowspan}}=""><label class="single"><input type="checkbox" name="chk_ord[]" value="{{orderId}}"> <span></span></label></td>
                <td {{rowspan}}="">{{insertDate}}</td>
                <td {{rowspan}}="">{{clickDetail}}</td>
                <td>{{thumb}}</td>
                <td class="txt-l">{{useDeli}}{{prdName}}{{optionData}}</td>
                                <td>{{amount}}</td>
                                <td class="fc-blue">{{oprState}}</td>
                <td {{delirowspan}}="">{{delinum}}</td>
                <td {{rowspan}}="">{{sender}}</td>
                <td {{rowspan}}="">{{payStateIcon}}{{payState}}{{refundState}}</td>
                <td {{rowspan}}="">{{payMethod}}</td>
                <td class="fc-red" {{rowspan}}="">{{payPrice}}</td>
            </tr>
        </tbody>
    </table>
    <table id="tpl_product_row">
        <tbody>
            <tr>
				<td>{{thumb}}</td>
                <td class="txt-l">{{prdName}}{{optionData}}</td>
				<td>{{amount}}</td>
				<td class="fc-blue">{{oprState}}{{oprdelinum}}</td>
			</tr>
        </tbody>
    </table>
</div>
<div id="tpl_deli_form" style="display:none;">
    <select name="save_deli_code[]">
        <option value="0">-- 택배 업체 선택 --</option>
                <option value="058">범한핀토스</option>
                <option value="057">드림택배</option>
                <option value="056">위드익스프레스</option>
                <option value="055">iecot</option>
                <option value="054">합동택배</option>
                <option value="053">GTXlogis</option>
                <option value="052">기타택배</option>
                <option value="051">EMS(영문)</option>
                <option value="050">당일배송(기타)</option>
                <option value="049">당일배송(바익스)</option>
                <option value="048">호남택배</option>
                <option value="047">한의사랑택배</option>
                <option value="046">장군택배</option>
                <option value="045">대신택배</option>
                <option value="044">24quick</option>
                <option value="043">CJ택배 뉴욕</option>
                <option value="042">편의점택배</option>
                <option value="041">ACI익스프레스</option>
                <option value="040">CJ GLS(해외)</option>
                <option value="039">AIR BOY</option>
                <option value="038">로젠글로벌</option>
                <option value="037">Dazen(다젠) 국제</option>
                <option value="036">Dazen(다젠) 국내</option>
                <option value="035">대한통운 국제택배</option>
                <option value="034">이노지스</option>
                <option value="033">스피디익스프레스</option>
                <option value="032">카스택배</option>
                <option value="031">EMS(해상특송)</option>
                <option value="030">Korea post(국제등기)</option>
                <option value="029">국제소포</option>
                <option value="028">위즈와</option>
                <option value="027">USPS</option>
                <option value="026">하나로(고려)택배</option>
                <option value="025">경동택배</option>
                <option value="024">벨익스프레스(자동송장)</option>
                <option value="023">대신정기화물</option>
                <option value="022">KGB택배</option>
                <option value="021">퀵퀵닷컴</option>
                <option value="020">한진(기업고객)</option>
                <option value="019">일양택배</option>
                <option value="018">FedEx</option>
                <option value="017">UPS</option>
                <option value="016">등기/소포 우편</option>
                <option value="015">EMS 프리미엄</option>
                <option value="014">EMS</option>
                <option value="013">KG 옐로우캡택배</option>
                <option value="012">동부택배</option>
                <option value="011">건영화물</option>
                <option value="010">천일택배</option>
                <option value="009">직접배달/수령</option>
                <option value="008">로젠택배</option>
                <option value="007">우체국택배</option>
                <option value="006">DHL</option>
                <option value="005">제일제당(CJ택배)</option>
                <option value="004">한진(개인고객)</option>
                <option value="003">CJ대한통운</option>
                <option value="002">CJ GLS</option>
                <option value="001">롯데택배</option>
            </select>&nbsp;
    <input type="text" name="save_deli_num[]" value="{{delinum}}">
    <input type="hidden" name="save_odv_id[]" value="{{odv_id}}">
    <input type="hidden" name="save_ord_id[]" value="{{ord_id}}">
</div>
<!-- template -->
<script type="text/javascript">
var MESSAGE = { 
    INVALID_DELI_PROCESS 	: '처리 가능한 주문이 없습니다.\n다시 확인하세요.',
    UNSELECT_BATCH_STATE    : '일괄처리를 선택하세요.',
    UNSELECT_EXCEL_FIELD    : '엑셀 다운로드 양식을 선택하세요.',
    UNSELECT_DELI_CODE 		: '택배 업체를 선택해주세요.',
    UNSELECT_DELI_ORD_IDS   : '주문을 1개 이상 선택하세요.',
    INVALID_SEARCH_MONTH    : '최대 6개월까지 조회 가능합니다.',
    INVALID_SEARCH_EDATE    : '종료일자는 시작일자보다 작을 수 없습니다.',
    INVALID_SEARCH_SDATE    : '시작일자는 종료일자보다 작을 수 없습니다.',
    SEND_DELINUM_PROGRESS   : '송장번호 발송중입니다.',
    SELECT_SEARCH_DATE      : '검색 일자를 선택하세요.',
    SELECT_SEARCH_START     : '검색 시작 일자를 선택하세요.',
    SELECT_SEARCH_END       : '검색 종료 일자를 선택하세요.',
    ERR_SET_AUTO_SEND       : '자동 발송 메세지 설정이 필요합니다.',
    MOVE_SETTING_MENU       : '설정 메뉴로 이동하시겠습니까?'
};
$m(function() {
    $m(document).ready(function($) {
        orderList.setOption({
        });
        orderList.init();
    });
});
</script>
<script type="text/javascript" src="/assets/admin/js/jquery.form.js"></script>
<script type="text/javascript" src="/assets/admin/js/jquery.number.js"></script>
<script type="text/javascript" src="/assets/admin/js/order.list.common.js?v=1542888459"></script>
<script type="text/javascript" src="/assets/admin/js/order.list.pc.js?v=1542888459"></script>

        <p class="page-body copyright rw">Copyright(C) FUCK All Rights Reserved.</p>
    </div><!-- #container -->
<div id="sns_iframe"></div>
<!-- ======================= Layer popup start ================================ -->
<span class="overlay"></span>
<div id="orderGuide1" class="guide-wrap layer-wrap">
    <div class="lhd">
        <h2>운송장 일괄등록</h2>
        <a class="btn-close close-layer" href="#orderGuide1">닫기</a>
    </div>
    <div class="lcont">
        엑셀 파일을 통해 다량의 주문서에 대한 배송 정보(택배사, 송장번호)등록 및 배송 처리를 할 수 있습니다.<br>
        엑셀 파일은 정해진 양식으로 작성된 CSV 파일로만 가능하며, 엑셀 양식은 A열: 주문번호, B열 상품별주문번호, C열 운송장번호로 작성해야합니다.
        <p><a href="#" class="btn-h28-dnld guideCsvDown"><span>파일양식다운로드</span></a></p>
        <ul class="mt-10">
            <li>
                - 일괄 등록 옵션 안내<br>
                : '송장번호만 등록합니다.' 선택 시, 배송 정보만 업로드 되며 배송 처리는 되지 않습니다.<br>
                : '송장번호 내 특수 문자는 제거합니다.' 선택 시 송장정보에서 하이픈(-), 쉼표(,), 마침표(.)는 제거후 업로드됩니다.
            </li>
            <li>- 한 주문서 내 2개 이상의 상품별 주문번호가 있는 경우 첫번째 상품 주문번호를 기준으로 배송정보가 업로드됩니다.</li>
        </ul>
    </div>
</div><!-- #orderGuide1 -->
<div id="orderDeliNumGuide" class="guide-wrap layer-wrap">
    <div class="lhd">
        <h2>송장번호</h2>
        <a class="btn-close close-layer" href="#orderDeliNumGuide">닫기</a>
    </div>
    <div class="lcont">
        송장번호 입력과 수정이 가능합니다.<br>
        입력된 송장번호 정보는 즉시 저장 및 수정되므로 송장 번호 안내 <br>
        자동 발송 메세지는 발송되지 않습니다.
    </div>
</div><!-- #orderDeliNumGuide -->
<script type="text/javascript">
$m('.guideCsvDown').click(function() {
    $m('#downGuideCsv').submit();
    return false;
});
</script>
<!-- ======================= Layer popup end   ================================= -->
<div id="dialog-confirm" title="레이어 팝업창 입니다." style="display:none;">
   <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span><span>jquery ui 에서 제공하는 기본 디자인 입니다.These items will be permanently deleted and cannot be recovered. Are you sure?</span></p>
</div>
<script type="text/javascript">

var menuHash = '#left-menu';
var requestUrl = "/adm/order/manage/total";

(function($) {
    $('#pop-account').on('click',function() {
        window.open('https://www.makeshop.co.kr/newmakeshop/front/notice.pop.html?type=L&date=20171215170624','메이크샵_고객의 성공만 생각합니다!','width=300, height=400');
    });

        $(function(e) {
        //ajax loading start//
        $(document).ajaxStart(function(e){
            mysoho.global.loadingOn();
        });

        $(document).ajaxStop(function(e){
            mysoho.global.loadingOff();
            setTimeout(function(){
                if (mysoho.global.isElement('#js-mysohoLoading') > 0){
                    mysoho.global.loadingOff();
                }
            },10000);
        });
        //ajax loading end//

        // 레이어 팝업 열기
        $('.open-layer').on('click', function(e) {
            e.preventDefault();
            open_layer_popup(this.hash);
        });

        $('.open-layer2').on('click', function(e) {
            e.preventDefault();
            open_layer_popup(this.hash, 'type2');
        });

        // 레이어 팝업 닫기 
        $('.close-layer').on('click', function(e) {
            e.preventDefault();
            close_layer_popup(this.hash);
        });
        // 왼쪽 메뉴 열기
        $('#header .btn-bar').on('click', function(e) {
            e.preventDefault();
            var hashData = {};
            if (isMobile) {
                hashData = { menuId : 'none' };
                history.pushState(hashData, 'leftMenu', menuHash);
                //openLeftMenu(hashData); 
                // 메뉴 페이지로 변경.
                window.location.href = admDir+"/main/menu";
            }
        });
        // 왼쪽 메뉴 닫기
        $('#aside .btn-close').on('click', function(e) {
            e.preventDefault();
            //closeLeftMenu(); 
            // 메뉴 페이지로 변경
            if (location.hash && location.hash.substr(0, 10) == '#left-menu') { 
                location.href = admDir  + '/main/dashboard';
            } else {
                window.history.back();
            }
        });
        // 왼쪽 메뉴 슬라이드
        $('#snb > li:not(.direct) > a').on('click', function(e) {
            e.preventDefault();

            if (isMobile) {
                var hashData = {}
                //var hash = menuHash + '-' + menuId;
                // todo 비교문을 바꿔야 한다. slide가 다시 접힌다 ;;
                // now 면 none을 넣어준다.
                if ($(this).parent('li').hasClass('now')) { 
                    hashData = { menuId : 'none' };
                } else {
                    var menuId = $(this).attr('menu_id');
                    hashData = { menuId : menuId };
                }
                if (history.state === null || menuId != history.state.menuId) {
                    history.pushState(hashData, 'leftMenu', menuHash);
                }
            }
            slideLeftMenu(this);
        });
        
        if (!isMobile && $('#aside').length > 0) {
            $('#aside').niceScroll({
                cursorborder:'none',
                cursorcolor : '#999999'
            });
        }
        // 오른쪽 메뉴 열기
        $('#header .btn-sns').on('click', function(e) {
            e.preventDefault();
            $('.overlay').show();
            $('#sidebar').animate({'right': 0}, 500);
            $('html, body').css({'overflow': 'hidden', 'height': '100%'});
        });
        // 오른쪽 메뉴 닫기
        $('#sidebar .btn-close').on('click', function(e) {
            e.preventDefault();
            $('.overlay').hide();
            $('#sidebar').animate({'right': '-240px'}, 500);
            $('html, body').css({'overflow': '', 'height': ''});
        });
        // 팝업 열기
        $('.btn-layer-open').on('click', function(e) {
            e.preventDefault();
            $('.overlay').show();
            $(this.hash).show();
        });
        // 팝업 닫기
        $('.btn-layer-close').on('click', function(e) {
            e.preventDefault();
            $('.overlay').hide();
            $(this.hash).hide();
        });
        // 컨텐츠 토글
        $('.btn-arrow').on('click', function(e) {
            e.preventDefault();
            if ($(this).hasClass('up')) {
                $(this).removeClass('up');
                $(this).parent().find('.txt-blur-span').hide();
                $(this).parent('.sect-hd').next('.sect-cont').show();
            } else {
                $(this).addClass('up');
                $(this).parent().find('.txt-blur-span').show();
                $(this).parent('.sect-hd').next('.sect-cont').hide();
            }
        });
        // 옵션 토글
        $('.btn-toggle').on('click', function(e) {
            e.preventDefault();
            $(this).addClass('now').parent('li').siblings('li').find('.btn-toggle').removeClass('now');
            $(this).addClass('now').siblings('.btn-toggle').removeClass('now');
        });

        $('.MSH-toggle').on('click', function() {
            var name = $(this).data('name'),
                value = $(this).data('value');

            $('input[name="'+name+'"]').val(value);
        });

        $('.MSH-toggle').each(function () {
            var name = $(this).data('name'),
                value = $(this).data('value'),
                hidden_value = $('input[name="'+name+'"]').val();
            if (value == hidden_value) {
                $(this).trigger('click');
            }
        });

        // my sns 롤링 
        var mysns_roll = new Swiper('.mysns .swiper-container', {
            slidesPerView: 5.5,
            spaceBetween: 22
            });
        //.page-hd lnk 클릭 시
        $('.page-hd .side dt').on('click', function() {
            if( $(this).siblings('dd').css('display') == 'none' ) {
                $(this).siblings('dd').show();
            }else {
                $(this).siblings('dd').hide();
            }
        });
        $(document).ready(function() { 
            $(document).mouseup(function (e) {
                var container = $('.dd-box');
                if (container.has(e.target).length === 0) {
                    container.hide();
                }
            });
        });
        $('.dd-box li a').on('click', function() {
            $(this).parents('.dd-box').hide();
        })
        // 컨텐츠 토글. up클래스 외엔 접어두기
        $('.btn-arrow').each(function(e) {
            if ($(this).hasClass('up')) {
                $(this).removeClass('up');
                $(this).parent('.sect-hd').next('.sect-cont').show();
            } else {
                $(this).addClass('up');
                $(this).parent('.sect-hd').next('.sect-cont').hide();
            }
        });
        //이전페이지 돌아가기 17.11.07
        $('.btn-back').on('click', function(e) {
            e.preventDefault();
            if (window.opener) {
                self.close();
            } else {
                if (document.referrer && document.referrer.indexOf(admDir + '/auth/') != -1) {
                    location.href = admDir  + '/main/dashboard';
                } else {
                    if (isMobile) {
                        // 모바일에서  마이페이지 , 무통장 입금 관리 , 플러그인 페이지 뒤로가기 시 무조건 메인으로 가도록 처리
                        // URL 에서 앞에 대문자로 표기 된 부분이 있어서 경로를 전체 소문자로 작성 함 ( 비교도 소문자로 함 )
                        var exceptUrl = [
                                '/adm/mypage/admin',                //마이페이지
                                '/adm/mypage/mysns/mysns',
                                '/adm/order/beebank',               //무통장 입금 관리
                                '/adm/order/beebank/match',       
                                '/adm/order/beebank/accountlist',
                                '/adm/plugin/manage',               //플러그인
                                '/adm/plugin/manage/myplugin'
                        ];
           
                        if ($.inArray(requestUrl.toLowerCase() , exceptUrl) != -1 ) {
                            var beebankExceptUrl = [
                                '/adm/order/beebank',               //무통장 입금 관리
                                '/adm/order/beebank/match',       
                                '/adm/order/beebank/accountlist'
                            ];
                            var menuUrl = '/main/menu';
                            if ($.inArray(requestUrl.toLowerCase() , beebankExceptUrl) != -1 && typeof(Storage) !== 'undefined') { 
                                sessionStorage.setItem('menuId' , 3);
                                menuUrl += '#left-menu';
                            }
                            location.href = admDir + menuUrl;
                            
                        } else {
                            window.history.back();
                        }
                    } else {
                        window.history.back();
                    }
                }
            }
        });
        //스크롤 시 top 버튼
        $(window).on('scroll', function() {
            var scrollTop = $(window).scrollTop();
            if ( scrollTop > 0 ) {
                $('.btn-top').fadeIn();
            } else {
                $('.btn-top').fadeOut();
            }
        });
        // 위로 up up
        $('.btn-top').on('click', function(e) {
            e.preventDefault();
            $('html, body, .subWrap').stop().animate({scrollTop: 0}, 500);
        });
        //메뉴 스크롤 시 17.11.10
        /* 18.04.05 애니메이션 제거
        var throttle = function(func, wait, options) {
            var _ = {
                now: Date.now || function() {
                    return new Date().getTime();
                }
            };
            var context, args, result;
            var timeout = null;
            var previous = 0;
            if (!options) {
                options = {};
            }
            var later = function() {
                previous = options.leading === false ? 0 : _.now();
                timeout = null;
                result = func.apply(context, args);
                if (!timeout) {
                    context = args = null;
                }
            };
            return function() {
                var now = _.now();
                if (!previous && options.leading === false) {
                    previous = now;
                }
                var remaining = wait - (now - previous);
                context = this;
                args = arguments;
                if (remaining <= 0 || remaining > wait) {
                    if (timeout) {
                        clearTimeout(timeout);
                        timeout = null;
                    }
                    previous = now;
                    result = func.apply(context, args);
                    if (!timeout) {
                        context = args = null;
                    }
                } else if (!timeout && options.trailing !== false) {
                    timeout = setTimeout(later, remaining);
                }
                return result;
            };
        };
        */
        /*
           2017.11.13 하단 스크립트 수정
         */

        var lastScrollTop = -1,
            currentScrollTop = 0,
            is_down = false,
            animating = false,
            $sideMenu = $('#aside');

        $.fn.hasScrollBar = function() {
            return this.get(0).scrollHeight > this.height();
        };

        $(window).on('load resize', function(e) {
            if ($sideMenu.length > 0 && $sideMenu.hasScrollBar()) {
                $('.mobile-switch.bt', $sideMenu).css('padding-bottom', 228 - parseInt($sideMenu.get(0).scrollHeight - $sideMenu.height(), 10));
            } else {
                $('.mobile-switch.bt', $sideMenu).css('padding-bottom', parseInt(window.innerHeight - $('.menu-wrapper', $sideMenu).height(), 10) + 228);
            }
        });
        /* 18.04.05 애니메이션 제거
        $('#aside').on('scroll', throttle(function(e) {
            var $self = $(this);
            currentScrollTop = $(this).scrollTop();

            if (currentScrollTop >= lastScrollTop) {
                if (!is_down && !animating) {
                    animating = true;
                    $self.css('overflow-y', 'hidden').stop(true, true).animate({ scrollTop: 228 }, 250, function() {
                        $self.css('overflow-y', 'scroll');
                        is_down = true;
                        animating = false;
                    });
                }
            } else {
                if (currentScrollTop < 228 && !animating) {
                    animating = true;
                    $self.css('overflow-y', 'hidden').stop(true, true).animate({ scrollTop: 0 }, 250, function() {
                        $self.css('overflow-y', 'scroll');
                        is_down = false;
                        animating = false;
                    });                
                }
            }

            lastScrollTop = currentScrollTop;
        }, 10));
        */

    });

    openLeftMenu({});
    $(document).ready(function() {
        $(document).bind('touchmove mouseup',function (e) {
            var container = $('.guide-wrap');
            // pc에서 제외
            if (! isMobile) {return false;}
            if( container.has(e.target).length === 0)
            container.hide();
        });
    });

    //18.06.12 상품리스트 추가
    $(document).on('click', '.prd_manage', function() {
        var date = new Date();                                                              
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);                           
        document.cookie = 'prd_manage_option' + '=' + 'on' + ';expires=' + date.toUTCString() + ';path=/';
    });
    //18.08.24 상품등록 추가
    $(document).on('click', '.prd_form', function() {
        var date = new Date();                                                              
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);                           
        document.cookie = 'prdExcelUpload' + '=' + 'on' + ';expires=' + date.toUTCString() + ';path=/';
    });
    //18.09.05 주문내역 리뉴얼
    $(document).on('click', '.order-list', function() {
        var date = new Date();                                                              
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);                           
        document.cookie = 'renewOrderList' + '=' + 'on' + ';expires=' + date.toUTCString() + ';path=/';
    });
    //18.10.04 간편결제관리 추가
    $(document).on('click', '.card-simple-menu', function() {
        var date = new Date();                                                              
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);                           
        document.cookie = 'cardSimpleMenu' + '=' + 'on' + ';expires=' + date.toUTCString() + ';path=/';
    });
    //18.10.18 개인결제내역 추가
    $(document).on('click', '.sms-direct-send', function() {
        var date = new Date();                                                              
        date.setTime(date.getTime() + 365 * 24 * 60 * 60 * 1000);                           
        document.cookie = 'smsDirectSend' + '=' + 'on' + ';expires=' + date.toUTCString() + ';path=/';
    });

    //dormant 팝업이 on 이라면 다른 팝업은 노출 안되도록 처리 (PC , 모바일 공통)
    $(window).load(function(){
        if (Cookies.get('dormant_popup') == 'on') {
            $('.layer-wrap').each (function(){
                var layerId = $(this).attr('id');
                if (layerId == 'inactivememberPop' || layerId == 'inactivememberPopM'){
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }//end if (Cookies.get('dormant_popup') == 'on')
    });

})(jQuery);


function openLeftMenu(data) {
    if (! isMobile) {
        return false;
    }
    if (! isMenuOpened()) {
        return false;
    }

    /* 메뉴 페이지로 변경 2018.02.06
    (function ($) {
        $('#aside').animate({'left': 0}, 500);
        $('html, body').css({'overflow': 'hidden', 'height': '100%'});
    })($m);
    */

    // left-menu인건 이미 검사함
    if (data !== null) {
        var menuId = '';
        if (history.state === null && sessionStorage.getItem('menuId') !== null) {
            menuId = sessionStorage.getItem('menuId');    
            sessionStorage.removeItem('menuId');
            history.pushState({'menuId':menuId}, 'leftMenu', menuHash);
        } else {
            if (history.state === null) {
                menuId = data.menuId;
            } else {
                menuId = data.menuId || history.state.menuId;
            }
        }
        if (menuId != 'none') {
            slideLeftMenu($m('#snb > li:not(.direct) > a[menu_id="'+menuId+'"]'));
        }
    }
}

// 메뉴 열어도 되는지
function isMenuOpened() {
    // 특정 메뉴 hash태그로 검사
    if (location.hash.substr(0, 10) != '#left-menu') { 
        return false; 
    }
    return true;
}

function closeLeftMenu() {
    (function ($) {
        location.hash = '';
        $('#aside').animate({'left': '-2000px'}, 500);
        $('html, body').css({'overflow': '', 'height': ''});
    })($m);
}

function slideLeftMenu(el) {
    (function ($) {
        if ($(el).parent('li').hasClass('now')) {
            $(el).parent('li').removeClass('now');
            $(el).siblings('ul').slideUp();
        } else {
            $('#snb > li').removeClass('now');
            $('#snb > li ul').slideUp();
            $(el).parent('li').addClass('now');
            $(el).siblings('ul').slideDown();
        }
    })($m);
}

window.onpopstate = function (e) {
    //openLeftMenu(e.state);
    mysoho.global.historyBack(e);
}
</script>


<div tabindex="-1" role="dialog" class="ui-dialog layer-wrap ui-widget ui-widget-content ui-front ui-resizable" aria-describedby="popup_saved_deli_result" aria-labelledby="ui-id-1" style="display: none; position: fixed;"><div class="ui-dialog-titlebar lhd ui-widget-header ui-helper-clearfix"><h2 id="ui-id-1" class="ui-dialog-title">운송장 일괄 등록 결과</h2><a href="#" class="ui-button ui-corner-all ui-widget ui-button-icon-only btn-close close-layer" role="button" title="Close"><span class="ui-button-icon ui-icon ui-icon-closethick"></span><span class="ui-button-icon-space"> </span>Close</a></div><div id="popup_saved_deli_result" class="ui-dialog-content lcont ui-widget-content">
	<div id="saved_result_summary" style="height:50px; line-height:50px;">
	</div>
    <div class="tbl-list">
        <table id="saved_deli_list">
            <colgroup>
                <col style="width:50px;">
                <col style="width:160px;">
                <col style="width:180px;">
                <col style="">
            </colgroup>
            <thead>
                <tr>
                    <th>No</th>
                    <th>주문번호</th>
                    <th>상품별주문번호</th>
                    <th>결과</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
