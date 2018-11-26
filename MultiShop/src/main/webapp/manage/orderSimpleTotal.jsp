<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-body">
        <div class="main-hd">
            <h2>개인 결제 내역</h2>
        </div>
        <div class="sect-cont mt-30">
            <a href="#" class="btn-h52-blue w180 mr-20 orderSimpleAddBtn">개인 결제 등록</a>
            <span class="fc-gray">개인 결제 주문서를 등록할 수 있습니다.</span>
        </div>
        <div class="sect-top mt-15">
            <div class="tbl-setting">
                <form id="search_frm" name="search_frm" method="post">
                <input type="hidden" name="check_ors_ids" value="">
                <input type="hidden" name="page" value="1">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col class="w140">
                        <col>
                    </colgroup>
                    <tbody>
                        <!-- 18.04.06 수정 및 추가 s -->
                        <tr class="type type1">
                            <th class="txt-l">휴대폰</th>
                            <td>
                                <ul class="arr-align">
                                    <li class="w40per">
                                        <input type="text" name="mobile" placeholder="휴대폰 번호 (3자리 이상)" value="">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="txt-l">상태</th>
                            <td>
                                <label class="mr-40"><input type="radio" name="pay_state" value="ALL" checked="checked"> <span>전체</span></label>
                                <label class="mr-40"><input type="radio" name="pay_state" value="S"> <span>결제요청</span></label>
                                <label class="mr-40"><input type="radio" name="pay_state" value="W"> <span>입금대기</span></label>
                                <label class="mr-40"><input type="radio" name="pay_state" value="E"> <span>결제완료</span></label>
                                <label class="mr-40"><input type="radio" name="pay_state" value="C"> <span>환불완료</span></label>
                            </td>
                        </tr>
                        <tr>
                            <th class="txt-l">등록일</th>
                            <td>
                                <ul class="arr-align">
                                    <li class="w40per period-6x">
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-23" edate="2018-11-23">오늘</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-22" edate="2018-11-23">어제</a>
                                        <a href="#" class="btn-toggle btn-dateterm now" sdate="2018-11-16" edate="2018-11-23">1주일</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-10-23" edate="2018-11-23">1개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-08-23" edate="2018-11-23">3개월</a>
                                       <a href="#" class="btn-toggle btn-dateterm" sdate="2018-05-23" edate="2018-11-23">6개월</a>
                                    </li>
                                    <li class="w40per calendar">
                                        </li><li class="w40per calendar">
                                        <label><input type="text" name="start_date" value="2018-11-16" id="dp1542955322060" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                        <span>~</span>
                                        <label><input type="text" name="end_date" value="2018-11-23" id="dp1542955322061" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th class="txt-l">결제금액</th>
                            <td>
                                <input type="text" style="width:140px" name="start_sell_price">
                                &nbsp; 원 이상 &nbsp;
                                <input type="text" style="width:140px" name="end_sell_price">
                                &nbsp; 원 이상 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th class="txt-l">키워드</th>
                            <td>
                                <ul class="arr-align">
                                    <li>
                                       <select style="width:137px" name="search_keyword_type">
                                            <option value="sender">주문자</option>
                                            <option value="ors_id">주문번호</option>
                                        </select>
                                    </li>
                                    <li class="w40per">
                                        <input type="text" name="search_keyword" style="width:340px">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <!-- 18.04.06 수정 및 추가 e -->
                    </tbody>
                </table>
                </form>
            </div><!-- .tbl-setting -->
            <div class="btn-c">
                <a href="javascript:;" class="btn-h52-blue searchBtn">검색</a>
            </div>
        </div><!-- .sect-top -->
        <div class="type type1">
            <div class="sect-hd">
                <h3>검색 결과</h3>
                <span>( 총 : <span class="orderCnt">0</span> 건 / <span class="orderPrice">0</span> 원 )</span>
            </div><!-- .sect-hd -->
            <div class="sect-cont pb-30">
                <!-- 18.04.06 수정 및 추가 s -->
                <div class="tbl-side">
                    <select style="width:200px" name="state">
                        <option value="CD">결제완료</option>
                        <option value="RF">환불완료</option>
                        <option value="DL">삭제</option>
                    </select>&nbsp;
                    <a href="javascript:;" class="btn-black mr-10 listActionBtn">적용</a>
                    <div class="abs-r">
                        <a href="#" class="btn-black btn-select-excel" style="width: 130px;">검색결과 다운로드</a>&nbsp;
                        <select class="mr-5" style="width:120px" name="limit">
                            <option value="10">10개</option>
                            <option value="30">30개</option>
                            <option value="50">50개</option>
                            <option value="100">100개</option>
                        </select>
                    </div>
                </div><!-- .tbl-side -->
                
                <!-- 18.05.09 수정 s -->
                <div class="tbl-list tbl-extend mt-20">
                    <form name="frm_list">
                    <table id="ftb">
                        <caption></caption>
                        <colgroup>
                            <col style="width:55px">
                            <col style="width:95px">
                            <col>
                            <col style="width:141px">
                            <col style="width:106px">
                            <col style="width:106px">
                            <col style="width:106px">
                            <col style="width:171px">
                            <col style="width:95px">
                            <col style="width:95px">
                            <col style="width:82px">
                            <col style="width:82px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th><label class="single"><input type="checkbox" name="all_check"><span></span></label></th>
                                <th>상태</th>
                                <th>판매일시</th>
                                <th>휴대폰</th>
                                <th>주문자</th>
                                <th>결제수단</th>
                                <th>입금계좌</th>
                                <th>판매액</th> 
                                <th>주문메모</th>
                                <th>고객메모</th>
                                <th>처리</th>
                                <th class="fs-15 lh-15">주소복사/<br>상세내역</th>
                            </tr>
                        </thead>
                        <!-- 18.05.09 수정 e -->
                        <tbody class="orderSimpleList"><tr><td colspan="12">검색된 결제 내역이 없습니다.</td></tr></tbody>
                    </table>
                    </form>
                </div><!-- .tbl-list --> 
                <div class="tbl-side mt-20">
                    <select style="width:200px" name="state">
                        <option value="CD">결제완료</option>
                        <option value="RF">환불완료</option>
                        <option value="DL">삭제</option>
                    </select>&nbsp;
                    <a href="javascript:;" class="btn-black listActionBtn">적용</a>
                </div><!-- .tbl-side -->
                <!-- 18.04.06 수정 및 추가 e -->
                <div id="pagination"></div>
            </div><!-- .sect-cont -->
        </div>

<!-- 18.10.18 PC 개인결제 문자발송지원 팝업  -->
<div id="smsDirectSendLayer" class="layer-wrap layer-type2" style="top:420px;">
    <a href="#smsDirectSendLayer" class="btn-close close-layer allday-close">닫기</a>
    <div class="cnt">                       
		<div class="imgArea">
            <img src="//image.makeshop.co.kr/mysoho/assets/admin/images/event/simple_pop_1017.jpg" alt="" usemap="#Map">
			<map name="Map">
			<area shape="rect" coords="260,592,439,644" href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=53" target="_blank"> </map>
        </div>                              
    </div>          
</div>          



<script id="tpl_list" type="text/template">
    <tr>
        <td><label class="single"><input type="checkbox" class="prd-check" name="ors_ids[]" data-state="{{ors_pay_state}}" data-paymethod="{{ors_pay_method}}" value="{{ors_id}}" {{disable}}/><span></span></label></td>
        <td>{{ors_pay_state_text}}</td>
        <td>{{ors_insert_date}}</td>
        <td>{{ors_mobile}}</td>
        <td>{{ors_sender}}</td>
        <td>
            {{ors_pay_method_txt}}
        </td>
        <td>
            <div class="desc">
                {{bank_use}}
                {{bank_info}}
            </div>
        </td>
        <td class="txt-r">\ {{ors_sell_price}}</td>
        <td>
            <div class="desc">
                {{memo_use}}
                {{ors_memo}}
            </div>  
        </td>
        <td>
            <div class="desc">
                {{osm_msg_use}}
                {{osm_msg}}
            </div>  
        </td>
        <td>{{confirm_text}}</td>
        <td>
            <a href="javascript:;" class="{{detail_btn}}" data-mobile="{{ors_mobile}}" data-url="{{ors_pay_url}}" data-ors_id="{{ors_id}}"></a>
        </td>
    </tr>

</script>

<script id="tpl_payment_detail" type="text/template">

    <!-- 레이어 -->
    <div id="paymentDetail" class="layer-wrap">
        <div class="lhd">
            <h2>결제상세</h2>
            <a class="btn-close close-layer" href="#paymentDetail">닫기</a>
        </div>
        <input type="hidden" name="ors_pay_method" value="{{ors_pay_method}}">
        <div class="cnt-box mt-10">
            <h3>결제정보</h3>
            <div class="tbl-list">
                <table class="txt-c">
                    <caption></caption>
                    <colgroup>
                        <col style="width:100px" />
                        <col />
                        <col style="width:100px" />
                        <col />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="txt-l">주문번호</th>
                            <td colspan="3" class="txt-l">
                                <span>{{ors_id}}</span>
                            </td>
                        </tr>
                        <tr style="display:none" class="txt_ors_memo">
                            <th class="txt-l">주문메모</th>
                            <td colspan="3" class="txt-l">
                                <span>{{ors_memo}}</span>
                            </td>
                        </tr>
                        <tr>
                            <th class="txt-l">주문자</th>
                            <td class="txt-l">{{ors_sender}}</td>
                            <th class="txt-l">휴대폰</th>
                            <td class="txt-l">{{ors_mobile}}</td>
                        </tr>
                        <tr>
                            <th class="txt-l">결제방법</th>
                            <td class="txt-l">{{ors_pay_method_text}}</td>
                            <th class="txt-l">결제완료</th>
                            <td class="txt-l">{{ors_payment_date}}</td>
                        </tr>
                        <tr>
                            <th class="txt-l">결제정보</th>
                            <td colspan="3" class="txt-l">
                                <span class="pay_bank_info" style="display:none">{{ors_bank_text}}</span>
                                <span class="pay_pg_info" style="display:none">승인 번호 : {{ors_pay_approval}}</span>
                            </td>
                        </tr>
                        <tr style="display:none" class="txt_osm_msg">
                            <th class="txt-l">고객메모</th>
                            <td colspan="3" class="txt-l">
                                <span>{{osm_msg}}</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 상태 완료일때 -->
            <p class="pay-price state_end" style="display:none">
                결제금액
                <span>\ {{ors_pay_price}}</span>
            </p>
            <!-- 상태 환불일때 -->
            <p class="pay-price state_refund" style="display:none">
                결제금액
                <span>\ {{ors_refund_real_price}}  <em>(환불)</em></span>
            </p>
        </div>
        
        <!-- 상태 완료일때 -->
        <div class="cnt-box pb-20 state_end" style="display:none">
            <form name="ors_frm" method="post" action="/adm/order/simple/detailAction/">
            <input type="hidden" name="ors_id" value="{{ors_id}}">
            <h3>환불</h3>
            <ul class="refund-area bank_refund">
                <li class="array-2">
                    <span class="sel">
                        <select style="width:192px" name="ors_refund_bank_name">
                            {{ors_refund_bank_name}}
                        </select>
                    </span>
                    <span class="inp">
                        <input type="text" placeholder="예금주" name="ors_refund_banker" value=""/>
                    </span>
                </li>
                <li class="mt-10">
                    <input type="text" placeholder="계좌번호" style="width:100%;" name="ors_refund_bank_account" value=""/>
                </li>
            </ul>
            <p class="fl-r bank_refund"><a href="javascript:;" class="btn-h82-black refundBankBtn">환불완료</a></p>
            <p class="fl-r pg_refund" style="display:none"><a href="javascript:;" class="btn-h82-black refundBankBtn">환불요청</a></p>
            </form>
        </div>
        <!-- 상태 환불일때 -->
        <div class="cnt-box pb-20 state_refund" style="display:none">
            <h3>환불정보</h3>
            <div class="tbl-list">
                <table class="txt-c">
                    <caption></caption>
                    <colgroup>
                        <col style="width:100px" />
                        <col />
                        <col style="width:100px" />
                        <col />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="txt-l">환불방법</th>
                            <td class="txt-l">{{ors_refund_method_text}}</td>
                            <th class="txt-l">환불완료</th>
                            <td class="txt-l">{{ors_refund_complete_date}}</td>
                        </tr>
                        <tr class="pay_bank_info" style="display:none">
                            <th class="txt-l">환불정보</th>
                            <td colspan="3" class="txt-l">{{ors_refund_bank_name}} {{ors_refund_bank_account}} ( 예금주  :  {{ors_refund_banker}} )</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="cnt-box">
            <h3>메모</h3>
            <form name="osm_frm" method="post" action="/adm/order/simple/osmDetailAction/" onsubmit="return false;">
            <input type="hidden" name="osm_ors_id" value="{{ors_id}}">
            <input type="hidden" name="osm_id" value="">
            <input type="hidden" name="osm_state" value="save">
            <p class="array-2">
                <span class="inp2"><input type="text" name="osm_msg" placeholder="최대 50자" maxlength="50" value=""/></span>
                <a href="javascript:;" class="btn-black abs-r osmSubmitBtn">등록</a>
            </p>
            </form>
            <ul class="memo-list">
                
            </ul>
        </div>
    </div><!-- #paymentDetail -->
</script>

<script id="tpl_memo_list" type="text/template">
    <li>
        <p class="txt-memo">{{osm_msg}}</p>
        <p class="txt-info">
            <span class="date">{{osm_insert_date}}</span>
            <span class="bar"></span>
            <span class="fc-blue">{{osm_adm_id}}</span>
        </p>
        <p class="btn">
            <!--a href="#">수정</a>
            <span class="bar"></span-->
            <a href="javascript:;" class="osmDelBtn" data-osm_ors_id="{{osm_ors_id}}" data-osm_id="{{osm_id}}">삭제</a>
        </p>
    </li>
</script>

<script type="text/javascript" src="/assets/admin/js/jquery.pager.js"></script>
<script type="text/javascript" src="/assets/admin/js/order_simple.js?v=7"></script>
<script type="text/javascript">

(function($) {
    $(function(e) {

         OST_MESSAGE = {
            CONFIRM_ORDER_DELETE : '건의 결제 내역을 삭제하시겠습니까?',
            CONFIRM_ORDER_COMPLETE : '대기 상태만 결제 상태로 변경됩니다.',
            CONFIRM_ORDER_REFUND : '결제 상태만 환불 상태로 변경됩니다.',
            CONFIRM_ORDER_LIST_COMPLETE : '해당 주문의 결제 내역을 완료하시겠습니까?',
            CONFIRM_ORDER_LIST_DELETE : '해당 주문의 결제 내역을 삭제하시겠습니까?',
            CONFIRM_ORDER_LIST_REFUND : '해당 주문의 결제 내역을 환불 처리하시겠습니까?',
            LIST_LAST_PAGE : '마지막 결제 내역입니다.',
            LIST_SEARCH : '검색된 결제 내역이 없습니다.',
            ALERT_COPY_URL : '주소가 복사되었습니다.',
            ALERT_ORDER_CHECK : '처리할 주문을 선택하세요.',
        }

        // 페이지 세팅
        //$('#aside #snb li.order').addClass('now');
        //$('#aside #snb li.order ul').show().find('li:eq(3)').addClass('now');

        orderSimpleList.getOrderSimpleList();

        //=====================================================
        // datepicker 
        //=====================================================
        $('.btn-dateterm').click(function(){
            var sdate = $(this).attr('sdate');
            var edate = $(this).attr('edate');
            if (isMobile !== true) {
                $('input[name="start_date"]').datepicker("setDate", sdate);
                $('input[name="end_date"]').datepicker("setDate", edate);
            } else {
                $('input[name="start_date"]').val(sdate);
                $('input[name="end_date"]').val(edate);
            }
            $(this).siblings().removeClass('now');
        });

        //모바일이 아닐 경우 datepicker 사용
        if (isMobile !== true) {
            $('input[name="start_date"]').datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                onClose: function (selectedDate, instance) {
                    if (selectedDate != '') {
                        $('input[name="end_date"]').datepicker("option", "minDate", selectedDate);
                        var date = $.datepicker.parseDate(instance.settings.dateFormat, selectedDate, instance.settings);
                        date.setMonth(date.getMonth() + 1);
                        $('input[name="end_date"]').datepicker("option", "minDate", selectedDate);
                        $('input[name="end_date"]').datepicker("option", "maxDate", date);
                    }
                }
            });
            $('input[name="end_date"]').datepicker({
                changeMonth: true,
                dateFormat: 'yy-mm-dd',
                onClose: function (selectedDate) {
                    $('input[name="start_date"]').datepicker("option", "maxDate", selectedDate);
                }
            });
        }

        // 검색
        $('.searchBtn').click(function() {
            $('.orderSimpleList').html('');

            var mobile = $m('[name=mobile]').val().replace(/ /gi, '');
            if (mobile.length < 3 && mobile.length > 0) {
                alert('휴대폰 번호는 3자리 이상 입력하세요.');
                return false;
            }

            $('[name=page]').val('1');
            orderSimpleList.getOrderSimpleList();
        });

        // 개인 결제 등록 팝업창
        $('.orderSimpleAddBtn').click(function() {
            window.open('/adm/order/simple/add/', 'orderSimpleAdd', 'width=820px,height=860px');
        });

        // 전체 선택 / 해제
        $('[name=all_check]').click(function() {
            if ($(this).prop('checked') === true) {
                $('[name="ors_ids[]"]').prop('checked', true);
            } else {
                $('[name="ors_ids[]"]').prop('checked', false);
            }
        });

        // 주소 복사
        $(document).on('click', '.urlCopyBtn', function() {
            //copyToClipBoard($(this).attr('data-url'));
            mysoho.clipboardAction.copyToNotMessage($(this).attr('data-url'));
            alert(OST_MESSAGE.ALERT_COPY_URL);
        });

        // 페이지 이동
        $(document).on('click', '#pagination > .paging > a', function(e){
            var href = $(this).attr('href');
            if (href.substring(0, 1) == '?') {
                href = href.substr(1, href.length);
            }
            var params = href.split('&');
            var page = 1;
            for (var i in params) {
                if (params[i].indexOf('page=') !== -1) {
                    tmppage = params[i].split("=");
                    page = tmppage[1];
                }
            }
            $('[name=page]').val(page);
            orderSimpleList.getOrderSimpleList();
            $m('.orderSimpleList tr:last').find('.desc span').css({'top':'-20px'});
            e.preventDefault();
        });

        // 리스트 개수
        $('[name=limit]').change(function() {
            orderSimpleList.getOrderSimpleList();
        });

        // 일괄 상태 변경
        $('.listActionBtn').click(function() {
            switch ($('[name=state] :selected').val()) {
                case 'CD':
                    orderSimpleList.confirmDepositSubmit();
                    break;
                case 'RF':
                    orderSimpleList.refundSubmit();
                    break;
                case 'DL' :
                    orderSimpleList.delSubmit();
                    break;
            }
        });

        // 상태변경 셀렉트 박스 통일
        $('[name=state]').change(function() {
            $('[name=state]').val($(this).val());
        });

        // 결제 확인
        $(document).on('click', '.confirmBankBtn', function() {
            orderSimpleList.confirmDepositSubmit($(this).data('ors_id'));
        });

        // 환불
        $(document).on('click', '.refundBtn', function() {
            orderSimpleList.refundSubmit($(this).data('ors_id'));
        });

        // 주문서 상세
        $(document).on('click', '.detailBtn', function() {
            $.ajax({
                async: false,
                type: "GET",
                url: "/adm/order/simple/detail",
                dataType: 'json',
                data : {
                    ors_id : $(this).attr('data-ors_id'),
                    dataType : 'json'
                },
                success: function(response){
                    if (response.result === true) {
                        orderSimpleList.setTplDetail(response);
                        $('.overlay').show();
                        $('#paymentDetail').show();
                    }
                }
            });
        });

        // 메모 등록
        $(document).on('click', '.osmSubmitBtn', function() {
            if (!$('[name=osm_msg]').val()) {
                alert('메모를 입력해 주세요.');
                return false;
            }
            var params = $('[name=osm_frm]').serialize();

            $.ajax({
                async: false,
                type: "POST",
                url: "/adm/order/simple/osmDetailAction/",
                dataType: 'json',
                data : params,
                success: function(response){
                    if (response.result === true) {
                        var tpl_message_arr = orderSimpleList.setTplMessageList(response.data);
                        $('#paymentDetail .memo-list').prepend(tpl_message_arr.join(''));
                        $('[name=osm_msg]').val('');
                        alert('저장되었습니다.');
                    }
                }
            });
        });

        // 메모 삭제
        $(document).on('click', '.osmDelBtn', function() {
            if (confirm('메모를 삭제하시겠습니까?')) {
                var obj = $(this);
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "/adm/order/simple/osmDetailAction/",
                    dataType: 'json',
                    data : {
                        osm_state : 'delete',
                        osm_id : $(this).attr('data-osm_id'),
                        osm_ors_id : $(this).attr('data-osm_ors_id'),
                    },
                    success: function(response){
                        if (response.result === true) {
                            $(obj).parent().parent().remove();
                            alert('삭제되었습니다.');
                        }
                    }
                });
            }
        });

        // 환불 완료
        $(document).on('click', '.refundBankBtn', function() {

            var confirm_msg = "PG사에 환불을 요청하시겠습니까?";
            if ($('[name=ors_pay_method]').val() === 'MBA') {
                if (!$('[name=ors_refund_bank_name] :selected').val()) {
                    alert('은행을 선택하세요.');
                    return false;
                }
                if (!$('[name=ors_refund_banker]').val()) {
                    alert('예금주를 입력하세요.');
                    return false;
                }
                if (!$('[name=ors_refund_bank_account]').val()) {
                    alert('계좌번호를 입력하세요.');
                    return false;
                }
                confirm_msg = "환불 처리하시겠습니까?";
            }
            var params = $('[name=ors_frm]').serialize();
            if (confirm(confirm_msg)) {
                $.ajax({
                    async: false,
                    type: "POST",
                    url: "/adm/order/simple/detailAction/",
                    dataType: 'json',
                    data : params,
                    success: function(response){
                        if (response.result === true) {
                            alert('처리되었습니다.');
                            $('.overlay').hide();
                            $('#paymentDetail').remove();

                            orderSimpleList.getOrderSimpleList();
                        }
                    }
                });
            }
        });

        // 상세창 닫기
        $(document).on('click', '.btn-close', function() {
            $('.overlay').hide();
            $('#paymentDetail').remove();
        });

        // 마지막 tr 메모 위치 조절
        $('.orderSimpleList tr:last').find('.desc span').css({'top':'-20px'});

        // 18.10.18 PC판매자센터_개인결제문자발송지원 팝업열기
        if (!isMobile && Cookies.get('smsDirectSendLayer') != 'NO') {
            open_layer_popup('#smsDirectSendLayer');
        }
        // 18.10.18 PC판매자센터_개인결제문자발송지원 팝업 닫기 클릭 시 다시는 열지 않기 처리 [pc]
        $('#smsDirectSendLayer .allday-close').on('click', function (e) {
            e.preventDefault();
            Cookies.set('smsDirectSendLayer', 'NO', { expires: 365, path: '/' });
            close_layer_popup('#smsDirectSendLayer');
        });

        // 개인결제 엑셀 다운로드
        $('.btn-select-excel').click(function() {
            let contData = orderSimpleList.getNowListCnount();
            if (contData != false && contData.order_count < 1) {
                alert('현재 조건으로 결제 내역이 존재하지 않습니다.\n검색 조건을 확인하신 후 검색결과 다운버튼을 클릭하세요.');
                return false;
            }
            $('[name=search_frm]').attr('action', admDir + '/order/simple/downExcel'); 

            //주문 번호를 선택했을 경우.
            $('input[name="check_ors_ids"]').val("");
            if ($('input[name="ors_ids[]"]:checked').length > 0) {
                var ors_ids = $('input[name="ors_ids[]"]:checked').map(function() {
                    return $(this).val();
                }).get().join();
                $('input[name="check_ors_ids"]').val(ors_ids);
            }
            $('[name=search_frm]').submit(); 
            return false;
        });
    });
})(jQuery);
</script>

        <p class="page-body copyright rw">Copyright(C) mysoho All Rights Reserved.</p>
    </div>