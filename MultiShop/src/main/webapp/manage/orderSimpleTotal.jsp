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
                                        <a href="#" class="btn-toggle btn-dateterm today">오늘</a>
                                        <a href="#" class="btn-toggle btn-dateterm yesterday">어제</a>
                                        <a href="#" class="btn-toggle btn-dateterm week">1주일</a>
                                        <a href="#" class="btn-toggle btn-dateterm month">1개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm trimester">3개월</a>
                                       <a href="#" class="btn-toggle btn-dateterm halfYear">6개월</a>
                                    </li>
                                    <li class="w40per calendar">
                                        </li><li class="w40per calendar">
                                        <label><input type="text" id="datepicker1" value="" id="dp1542955322060"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                        <span>~</span>
                                        <label><input type="text" id="datepicker2" value="" id="dp1542955322061"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
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

        <p class="page-body copyright rw">Copyright(C) Hello All Rights Reserved.</p>
    </div>