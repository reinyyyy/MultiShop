<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="prdSearch" class="page-body">
    <h2>상품 관련</h2>

    <form id="search_prd_order_form" method="post" action="/adm/order/manage/total">
        <input type="hidden" name="search_keyword" value="">
        <input type="hidden" name="search_keyword_type" value="prd_id">
        <input type="hidden" name="search_date" value="6m">
    </form> 

    <div class="sect-top">
        <form id="search_form" action="/adm/product/manage/getList" method="post" onsubmit="return false;">
        <input type="hidden" id="page" name="page" value="1">
        <input type="hidden" id="excel" name="excel" value="N">
        <input type="hidden" name="search_limit_cnt" value="10">
        <input type="hidden" name="search_prd_sort" value="up-dt-desc">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="txt-l">상태</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w20per">
                                    <select name="search_prd_display">
                                        <option value="">전체</option>
                                        <option value="Y">판매중</option>
                                        <option value="N">판매중지</option>
                                        <option value="S">품절</option>
                                    </select>
                                </li>
                                <li>
                                    <label><input type="checkbox" name="search_only_pdi" value="Y"><span>상단고정</span></label>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">키워드</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w20per">
                                    <select name="search_keyword_type">
                                        <option value="prd_name">상품명</option>
                                        <option value="prd_add_name">추가 상품명</option>
                                    </select> 
                                    
                                </li>
                                <li class="w40per">
                                    <input type="text" name="search_keyword">
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">등록일</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w20per period-3x">
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-23" edate="2018-11-23">오늘</a>
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-16" edate="2018-11-23">1주일</a>
                                    <a href="#" class="btn-toggle btn-dateterm" sdate="2018-10-23" edate="2018-11-23">1개월</a>
                                </li>
                                <li class="w40per calendar">
                                    <label><input type="text" name="search_start_date" value="" id="dp1542955095037" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    <span>~</span>
                                    <label><input type="text" name="search_end_date" value="" id="dp1542955095038" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
        <div class="btn-c">
            <a href="#" class="btn-h52-blue" id="btn_search">검색</a>
        </div>
        </form>
    </div><!-- .sect-top -->

    <div class="pc-switch">
        <div class="sect-hd">
            <h3>상품 검색 결과</h3>
            <span>( 총 : <em class="prd-total">0</em> 판매중 : <em class="prd-sell-count">0</em> / 판매중지 : <em class="prd-nosell-count">0</em> )</span>

            <p class="abs-r">
                <select name="search-sort" class="mr-5" style="width:130px">
                    <option value="up-dt-desc">최근 수정순</option>
                    <option value="in-dt-desc">최근 등록순</option>
                    <option value="in-dt-asc">나중 등록순</option>
                    <option value="sell-desc">판매 높은순</option>
                    <option value="sell-asc">판매 낮은순</option>
                    <option value="stock-desc">재고 많은순</option>
                    <option value="stock-asc">재고 적은순</option>
                </select>
                <select class="mr-5 search-limit" style="width:140px">
                    <option value="10">10개씩 보기</option>
                    <option value="30">30개씩 보기</option>
                    <option value="50">50개씩 보기</option>
                    <option value="100">100개씩 보기</option>
                </select>
            </p>
        </div><!-- .sect-hd -->

        <div class="sect-cont">
            <div class="tbl-side exec-bar">
                <span class="txt-count"><em>0</em>개 상품을</span>
                <select style="width:100px" class="js-prd-display">
                    <option value="Y">판매</option>
                    <option value="N">판매중지</option>
                    <option value="S">품절</option>
                    <option value="D">삭제</option>
                </select>&nbsp;
                <a href="#" class="btn-black btn-set-sell" style="width:70px;" pc-type="pc">적용</a>
                &nbsp;|&nbsp;
                <select name="qrcode_size" class="mr-5" style="width:100px">
                    <option value="357">9.2cm</option>
                    <option value="306">8cm</option>
                    <option value="204">5.3cm</option>
                    <option value="153">4cm</option>
                    <option value="77">2cm</option>
                </select>
                <a href="#" class="btn-h36-black js-btn-print-qrcode">코드인쇄</a>
                &nbsp;|&nbsp;
                <a href="#" class="btn-h36-black MSH-btn-cart-share" data-cart-share-id="" data-cart-share-state="">바로구매/보내기</a>
                <p class="abs-r">
                    <a href="#" class="btn-h36-black js-btn-fixed-top-product">상단고정/해지</a>
                </p>
            </div><!-- .tbl-side -->
            <div class="tbl-list mt-20" style="height: 175px;">
                <table id="ftb" style="width:1465px">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th style="width:55px"><label class="single"><input type="checkbox" class="chk-all-prd" pc-type="pc"><span></span></label></th>
                            <th style="width:95px">이미지</th>
                            <th style="width:95px">상품번호</th>
                            <th style="width:200px">상품명</th>
                            <th style="width:100px">판매가</th>
                            <th style="width:100px">판매상태</th>
                            <th style="width:100px">재고</th>
                            <th style="width:100px">판매수</th> 
                            <th style="width:120px">등록일(수정일)</th>
                            <th style="width:185px">주소 복사</th>
                                                        <th style="width:185px">보내기</th>
                            <th style="width:100px">주문하기</th>
                                                    </tr>
                    </thead>
                    <tbody id="pc_prd_row"><tr>
    <td colspan="12" class="text-center">데이터가 존재하지 않습니다.</td>
</tr>
</tbody>
                </table>
            </div><!-- .tbl-list -->
            <div class="tbl-side exec-bar mt-10">
                <span class="txt-count"><em>0</em>개 상품을</span>
                <select style="width:100px" class="js-prd-display">
                    <option value="Y">판매</option>
                    <option value="N">판매중지</option>
                    <option value="S">품절</option>
                    <option value="D">삭제</option>
                </select>&nbsp;
                <a href="#" class="btn-black btn-set-sell" style="width:70px;" pc-type="pc">적용</a>
                &nbsp;|&nbsp;
                <select name="qrcode_size" class="mr-5" style="width:100px">
                    <option value="357">9.2cm</option>
                    <option value="306">8cm</option>
                    <option value="204">5.3cm</option>
                    <option value="153">4cm</option>
                    <option value="77">2cm</option>
                </select>
                <a href="#" class="btn-h36-black js-btn-print-qrcode">코드인쇄</a>
                &nbsp;|&nbsp;
                <a href="#" class="btn-h36-black MSH-btn-cart-share" data-cart-share-id="" data-cart-share-state="">바로구매/보내기</a>
                <p class="abs-r">
                    <a href="#" class="btn-h36-black js-btn-fixed-top-product">상단고정/해지</a>
                </p>
            </div><div id="pagination"></div>
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
</div>