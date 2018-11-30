<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>

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
                                    <a class="btn-toggle btn-dateterm today" style="cursor:pointer">오늘</a>
                                    <a class="btn-toggle btn-dateterm week" style="cursor:pointer">1주일</a>
                                    <a class="btn-toggle btn-dateterm month" style="cursor:pointer">1개월</a>
                                    <a class="btn-toggle btn-dateterm trimester" style="cursor:pointer">3개월</a>
                                    <a class="btn-toggle btn-dateterm halfYear" style="cursor:pointer">6개월</a>
                                </li>
                            </ul>
                            <ul class="arr-align mt-15">
                                <li class="w60per calendar">
                                    <label><input type="text" id="datepicker1" value="" id="dp1542785050780"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    <span>~</span>
                                    <label><input type="text" id="datepicker2" value="" id="dp1542785050781"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
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
                                    <select name="search_keyword_type" id="search_keyword_type">
                                        <option value="" selected="selected">-- 키워드 --</option>
                                        <option value="phone">휴대폰번호</option>
                                        <option value="sender">주문자명</option>
                                    </select>
                                </li>
                                <li class="w60per">
                                    <input type="text" id="search_keyword" value="">
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
<div id="ascrail2000" class="nicescroll-rails nicescroll-rails-vr" style="width: 6px; z-index: 10; cursor: default; position: fixed; top: 0px; left: 214px; height: 942px; display: none; opacity: 0;"><div class="nicescroll-cursors" style="position: relative; top: 0px; float: right; width: 6px; height: 0px; background-color: rgb(153, 153, 153); border: none; background-clip: padding-box; border-radius: 5px;"></div></div>

