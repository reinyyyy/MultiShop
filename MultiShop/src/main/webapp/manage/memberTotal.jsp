<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
</head>
<body>
	<div id="prdSearch" class="page-body">
    <div class="main-hd">
        <h2>고객관리</h2>
    </div>
    <div class="sect-top">
        <div class="tbl-setting">
            <form name="search_frm" method="post">
            <input type="hidden" name="search_prd_ids" value="">
            <input type="hidden" name="page" value="1">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="txt-l">기간</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w40per period-5x">
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-21" edate="2018-11-21">오늘</a>
                                    <a href="#" class="btn-toggle btn-dateterm now" sdate="2018-11-14" edate="2018-11-21">1주일</a>
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-10-21" edate="2018-11-21">1개월</a>
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-08-21" edate="2018-11-21">3개월</a>
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-05-21" edate="2018-11-21">6개월</a>
                                </li>
                            </ul>
                            <ul class="arr-align mt-15">
                                <li class="w60per calendar">
                                    <label><input type="text" name="search_start_date" value="2018-11-14" id="dp1542785050780" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    <span>~</span>
                                    <label><input type="text" name="search_end_date" value="2018-11-21" id="dp1542785050781" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                </li>
                                <li class="w30per">
                                    <p class="refer-txt">검색기간은 최대 1년까지 검색 가능</p>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">고객 정보</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w20per">
                                    <select name="search_keyword_type">
                                        <option value="">-- 키워드 --</option>
                                        <option value="phone">휴대폰번호</option>
                                        <option value="sender">주문자명</option>
                                    </select>
                                </li>
                                <li class="w60per">
                                    <input type="text" name="search_keyword" value="">
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">상세 조건</th>
                        <td style="padding:0;">
                            <ul class="section">
                                <li class="condition">
                                    <label class="mr-40"><input type="radio" name="search_ord_state" id="section1" value="" checked=""><span>주문고객</span></label>
                                    <label class="mr-40"><input type="radio" name="search_ord_state" id="section2" value="W"><span>미입금 고객</span></label>
                                    <label><input type="radio" name="search_ord_state" id="section3" value="C"><span>클레임(취소, 반품, 교환) 고객</span></label>
                                </li>
                                <li>
                                    <label>
                                        <span style="padding-left:0px"><a href="#self" id="btn_prd" class="btn-black wauto">상품선택</a></span>
                                    </label>
                                    <span>
                                        <span class="select-prd">전체 상품</span>을
                                        <!-- 상품 선택시에만 선택상품 문구 노출 -->
                                        <!-- <span class="red select-prd">선택 상품</span>을 -->
                                    </span>
                                    <span class="section1">
                                        <input type="text" name="search_prd_amount" style="width:86px;" value="1">
                                        <span>건 이상 주문한 고객 <em>(상품을 선택하지 않을 경우 전체 상품 검색)</em></span>
                                    </span>
                                    <span class="section2" style="display:none;">
                                        미입금 고객 <em>
                                        (상품을 선택하지 않을 경우 전체 상품 검색)</em>
                                    </span>
                                    <span class="section3" style="display:none;">
                                        <select style="width:170px;" name="search_ord_claime">
                                            <option value="">클레임 전체</option>
                                            <option value="C">취소</option>
                                            <option value="X">교환</option>
                                            <option value="B">반품</option>
                                        </select>
                                        <span>고객 <em>(상품을 선택하지 않을 경우 전체 상품 검색)</em></span>
                                    </span>
                                </li>
                                <li class="section1">
                                    <!-- 주문 고객 -->
                                    <!--<span class="ml-0">고객 <span class="gray">결제금액</span>이</span>-->
                                    <!-- 주문 고객 클레임 -->
                                    <span style="padding-left:18px">누적 주문금액</span>
                                    <input type="text" style="width:128px;" name="search_start_pay" value="">
                                    <span>원 ~</span>
                                    <input type="text" style="width:128px;" name="search_end_pay" value="">
                                    <span>원</span>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l" style="border-bottom:1px solid #ebebeb; line-height:20px;">쇼핑/할인 소식<br>SMS 수신 여부 </th>
                        <td style="border-bottom:1px solid #ebebeb;">
                            <label class="mr-40"><input type="radio" name="search_receive_state" value="Y" checked=""><span>동의</span></label>
                            <label><input type="radio" name="search_receive_state" value="N"><span>동의안함</span></label>
                        </td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div><!-- .tbl-setting -->
        <div class="btn-c">
            <a href="javascript:;" class="btn-h52-blue searchMemberBtn">검색</a>
        </div>
    </div><!-- .sect-top -->
    <div class="pc-switch">
        <div class="sect-hd">
            <h3>고객 검색 결과</h3>
            <span>( 검색고객 : <span class="memberCnt">0</span>명 )</span>
        </div><!-- .sect-hd -->
        <div class="sect-cont">
            <div class="tbl-side">
                <div class="f-r">
                    <select style="width:120px" name="limit">
                        <option value="10">10개</option>
                        <option value="30">30개</option>
                        <option value="50">50개</option>
                        <option value="100">100개</option>
                    </select>
                    <a href="#sms-send" class="btn-black ml-10 btn-all-sms-send" style="width:140px;">전체고객 SMS발송</a>
                    <a href="#sms-send" class="btn-black ml-10 btn-sms-send" style="width:140px;">선택고객 SMS발송</a>
                </div>
            </div><!-- .tbl-side -->
            <div class="tbl-list tbl-extend mt-20">
                <form name="mem_frm" method="post" action="/adm/member/manage/listAction">
                <input type="hidden" name="state" value="">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:40px">
                        <col style="width:51px">
                        <col style="width:149px">
                        <col style="width:89px">
                        <col style="width:82px">
                        <col style="width:78px">
                        <col style="width:72px">
                        <col style="width:68px">
                        <col style="width:68px">
                        <col style="width:115px">
                        <col style="width:87px">
                        <col style="width:191px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th rowspan="2"><label class="single"><input type="checkbox" name="chk_all_member"><span></span></label></th>
                            <th rowspan="2">No</th>
                            <th rowspan="2">휴대폰번호</th>
                            <th rowspan="2">주문자</th>
                            <th colspan="2">주문</th>
                            <th colspan="3">클레임</th>
                            <th rowspan="2">누적 주문금액</th>
                            <th rowspan="2">SMS 수신</th>
                            <th rowspan="2">최근 주문일</th>
                        </tr>
                        <tr>
                            <th>주문완료</th>
                            <th>미입금</th>
                            <th>취소</th>
                            <th>교환</th>
                            <th>반품</th>
                        </tr>
                    </thead>
                    <tbody class="memberList"><tr><td colspan="12">검색된 내역이 없습니다.</td></tr></tbody>
                </table>
                </form>
            </div><!-- .tbl-list -->
            <div class="paging" id="pagination"></div>
            <div class="tbl-side mt-20">
                <a href="javascript:;" class="btn-black delMemBtn">삭제</a>
            </div><!-- .tbl-side -->
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
</div>
<script type="text/javascript">
var menuHash = '#left-menu';
var requestUrl = "/adm/member/manage/total";

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
<div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr" style="width: 6px; z-index: 10; cursor: default; position: fixed; top: 0px; left: 214px; height: 942px; display: none; opacity: 0;"><div class="nicescroll-cursors" style="position: relative; top: 0px; float: right; width: 6px; height: 0px; background-color: rgb(153, 153, 153); border: none; background-clip: padding-box; border-radius: 5px;"></div></div>
/div id="ascrail2000-hr" class="nicescroll-rails nicescroll-rails-hr" style="height: 6px; z-index: 10; top: 936px; left: 0px; position: fixed; cursor: default; display: none; opacity: 0;"><div class="nicescroll-cursors" style="position: absolute; top: 0px; height: 6px; width: 0px; background-color: rgb(153, 153, 153); border: none; background-clip: padding-box; border-radius: 5px; left: 0px;"></div></div>
v