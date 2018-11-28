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
                                    <select class="search_prd_display">
                                        <option value="A">전체</option>
                                        <option value="Y">판매중</option>
                                        <option value="N">판매중지</option>
                                        <option value="S">품절</option>
                                    </select>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">상품명</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w40per">
                                    <input type="text" class="search_keyword">
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l">등록일</th>
                        <td>
                            <ul class="arr-align">
                                <li class="w20per period-3x">
                                    <a href="#" class="btn-toggle btn-dateterm today">오늘</a>
                                    <a href="#" class="btn-toggle btn-dateterm week">1주일</a>
                                    <a href="#" class="btn-toggle btn-dateterm month">1개월</a>
                                </li>
                                <li class="w40per calendar">
                                    <label><input type="text" id="datepicker1" value="">
                                    	<img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    <span>~</span>
                                    <label><input type="text" id="datepicker2" value=""><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
        <div class="btn-c">
            <a href = "#" class="btn-h52-blue" id="btn_search">검색</a>
        </div>
        </form>
    </div><!-- .sect-top -->

    <div class="pc-switch">
        <div class="sect-hd">
            <h3>상품 검색 결과</h3>
            <span>( 총 : <em class="prd-total">0</em> 판매중 : <em class="prd-sell-count">0</em> / 판매중지 : <em class="prd-nosell-count">0</em> )</span>

            <p class="abs-r">
                <select name="search-sort" class="mr-5" style="width:130px">
                    <option value="sell_desc">판매 높은순</option>
                    <option value="sell_asc">판매 낮은순</option>
                    <option value="stock_desc">재고 많은순</option>
                    <option value="stock_asc">재고 적은순</option>
                </select>
                <select class="mr-5 search-limit" style="width:140px">
                    <option value="10">10개씩 보기</option>
                    <option value="30">30개씩 보기</option>
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
                </select>
            </div><!-- .tbl-side -->
            <div class="tbl-list mt-20" style="height: 175px;">
                <table id="ftb" style="width:1465px">
                    <caption></caption>
                    <thead>
                        <tr>
                            <th style="width:55px"><label class="single"><input type="checkbox" class="chk-all-prd" pc-type="pc"><span></span></label></th>
                            <th style="width:95px">상품번호</th>
                            <th style="width:300px">상품명</th>
                            <th style="width:200px">판매가</th>
                            <th style="width:100px">판매상태</th>
                            <th style="width:100px">재고</th>
                            <th style="width:100px">판매수</th> 
                            <th style="width:220px">등록일(수정일)</th>
                        </tr>
                    </thead>
                    <tbody id="pc_prd_row">
                    	<tr>
    						<td colspan="8" class="text-center non-data">데이터가 존재하지 않습니다.</td>
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
                </select>
            </div><div id="pagination"></div>
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
</div>

