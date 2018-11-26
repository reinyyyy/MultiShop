<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="ordSearch" class="page-body">
    <h2>주문내역</h2>
        <div class="sect-top">
            <form id="search_form" method="post">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="excel_field_id" value="0">
            <input type="hidden" name="ord_ids" value="">
			            <input type="hidden" name="auto_search" value="N">
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
                                        <select name="search_state">
                                            <option>-- 주문 상태 전체 --</option>
                                                                                        <option value="OC">주문완료</option>
                                                                                        <option value="DR">배송대기</option>
                                                                                        <option value="DT">배송중</option>
                                                                                        <option value="DC">배송완료</option>
                                                                                        <option value="PC">처리완료</option>
                                                                                        <option value="CC">취소완료</option>
                                                                                        <option value="BP">반품수거중</option>
                                                                                        <option value="BC">반품완료</option>
                                                                                        <option value="XP">교환수거중</option>
                                                                                        <option value="XC">교환완료</option>
                                                                                    </select>
                                    </li>
                                    <li class="w20per pc-switch">
                                        <select name="search_pay_state">
                                            <option>-- 결제 상태 전체 --</option>
                                                                                        <option value="W">미입금</option>
                                                                                        <option value="A">재결제대기</option>
                                                                                        <option value="E">결제완료</option>
                                                                                        <option value="RF1">환불대기</option>
                                                                                        <option value="RF5">환불완료</option>
                                                                                    </select>
                                    </li>
                                    <li class="w20per pc-switch">
                                        <select name="search_pay_method">
                                            <option>-- 결제 수단 전체 --</option>
                                                                                        <option value="MBA">무통장</option>
                                                                                        <option value="PCA">신용카드</option>
                                                                                        <option value="PBR">계좌이체</option>
                                                                                        <option value="PBV">가상계좌</option>
                                                                                        <option value="SSP">삼성페이</option>
                                                                                    </select>
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
                                            <option>-- 검색 키워드 --</option>
                                            <option value="ord_id">주문번호</option>
                                            <option value="prd_ord_id">상품주문번호</option>
                                            <option value="sender">주문자</option>
                                            <option value="phone">휴대폰 번호</option>
                                            <option value="receiver">수령자</option>
                                            <option value="prd_name">상품명</option>
                                            <option value="prd_id">상품번호</option>
                                                                                    </select>
                                    </li>
                                    <li class="w50per">
                                        <input type="text" name="search_keyword" value="">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="last">
                            <th class="txt-l">
                                <select style="width:120px" name="search_end_state" class="pc-switch">
                                    <option value="ord_end">주문완료</option>
                                    <option value="pay_end">결제완료</option>
                                </select>
                            </th>
                            <td>
                                <ul class="arr-align">
                                    <li class="w40per period-4x">
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-23" edate="2018-11-23">오늘</a>
                                        <a href="#" class="btn-toggle btn-dateterm now" sdate="2018-11-16" edate="2018-11-23">1주일</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-10-23" edate="2018-11-23">1개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-08-23" edate="2018-11-23">3개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-05-23" edate="2018-11-23">6개월</a>
                                    </li>
                                    <li class="w30per calendar">
                                        <label><input type="text" name="search_start_date" value="2018-11-16" id="dp1542955200532" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                        <span>~</span>
                                        <label><input type="text" name="search_end_date" value="2018-11-23" id="dp1542955200533" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- .tbl-setting -->
            <div class="btn-c">
                <a href="#" class="btn-h52-blue" id="btn_search">검색</a>
                <a href="#" class="btn-h52-blue" id="btn_search_ing" style="display:none;">검색중</a>
            </div>
            </form>
        </div><!-- .sect-top -->
    <div class="pc-switch">
        <!-- 17.12.15 추가 s -->
        		<!-- 17.12.15 추가 e -->
        <div class="sect-hd">
            <h3>주문 검색 결과</h3>
            <span>( 주문완료 : <em id="txt_ord_count">0건</em> / 결제완료 : <em id="txt_pay_count">0건</em> / 판매금액 : <em id="txt_pay_price">0원</em> )</span>
        </div><!-- .sect-hd -->
        <div class="sect-cont">
            <div class="tbl-side">
                <select name="claim_event" style="width:200px">
                    <option value="">-- 일괄 처리 --</option>
                    <option value="CB">입금완료</option>
                    <option value="DT">배송중</option>
                    <option value="DC">배송완료</option>
                    <option value="NOCB">미입금</option>
                                    </select>&nbsp;
                <a href="javascript:void(0);" class="btn-list-event-pc btn-black" device="pc">적용</a> | 
                <a href="javascript:void(0);" class="MSH-btn-send-delinum btn-black" device="pc">송장 번호 안내</a>
                <div class="abs-r">
                    <select style="width:200px" name="select_excel_fields"><option value="">-- 다운로드 양식 선택 --</option></select>
                    <a href="#" class="btn-black btn-select-excel">다운로드</a>&nbsp;
					                    <a href="#" class="btn-setting btn-setting-excel mr-40">설정</a>
                    <select style="width:120px; display:none;">
                        <option>10개</option>
                    </select>
                </div>
            </div><!-- .tbl-side -->
            <div id="order_list" class="tbl-list tbl-extend tbl-horz mt-20">
            <p id="order_list_sql" style="display:none; padding:20px; font-size: 13px;"></p>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:55px">
                    <col style="width:130px">
                    <col style="width:165px">
                    <col style="width:120px">
                    <col>
                    <col>
                    <col style="width:110px">
                    <col style="width:200px">
                    <col style="width:100px">
                    <col style="width:100px">
                    <col style="width:100px">
                    <col style="width:100px">
                </colgroup>
                <thead>
                    <tr>
                        <th><label class="single"><input name="chk_ord_all" type="checkbox" value="pc"><span></span></label></th>
                        <th>주문일시</th>
                        <th>주문번호</th>
                        <th colspan="2">상품정보</th>
                                                <th>수량</th>
                                                <th>상태</th>
                        <th>송장번호&nbsp;<a href="#orderDeliNumGuide" class="lnk-qmark open-layer">도움말</a></th>
                        <th>주문자</th>
                        <th>결제상태</th>
                        <th>결제수단</th>
                        <th>결제금액</th>
                    </tr>
                </thead>
                <tbody id="pc_ord_row">
					<tr>
                        <td colspan="12">검색 조건을 확인하신 후 검색 버튼을 클릭하세요.</td>
                    </tr>
				</tbody>
            </table>
            </div>
            <div class="paging" id="pagination">
            </div><!-- .paging -->
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
    <div class="sect-cont pc-switch">
        <form id="downGuideCsv" method="post" action="/adm/order/manage/downGuideCsv"></form>
        <form id="delivery_form">
        <h5 class="fw-normal">운송장 일괄등록 <a href="#orderGuide1" class="lnk-qmark open-layer">도움말</a></h5>
        <div class="tbl-list tbl-wide mt-20">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:180px">
                    <col>
                    <col style="width:180px">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="txt-l pl-20">택배 업체 선택</th>
                        <td class="txt-l pl-20">
                            <select style="width:200px" name="select_deli_code">
                                <option value="">-- 택배 업체 선택 --</option>
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
                                                            </select>
                        </td>
                        <td rowspan="4">
                            <a href="#" id="btn_upload_delivery" class="btn-black pd-10">운송장 일괄 등록</a>
                            <a href="#" id="btn_upload_delivery_ing" class="btn-black pd-10" style="display: none;">운송장 등록 중</a>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l pl-20" rowspan="2">일괄 등록 옵션</th>
                        <td class="txt-l pl-20">
                            <label>
                                <input type="checkbox" name="chk_update_status" value="N"> 
                                <span>송장번호만 등록합니다. (처리상태 변경 없음)</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="txt-l pl-20"><label><input type="checkbox" name="chk_delivery_num" value="Y"> <span>송장번호 내 특수 문자는 제거합니다. (하이픈(-), 쉼표(,), 마침표(.) 제거)</span></label></td>
                    </tr>
                    <tr>
                        <th class="txt-l pl-20">파일 업로드 (CSV)</th>
                        <td class="txt-l pl-20">
                            <span class="file-area">
                                <a href="#" class="btn-black">파일 업로드</a>
                                <input type="file" name="delivery_file">
                            </span>&nbsp;
                            <span class="file-name">등록된 파일이 없습니다.</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-list -->
        </form>
    </div><!-- .sect-cont -->
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="ordSearch" class="page-body">
    <h2>주문내역</h2>
        <div class="sect-top">
            <form id="search_form" method="post">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="excel_field_id" value="0">
            <input type="hidden" name="ord_ids" value="">
			            <input type="hidden" name="auto_search" value="N">
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
                                        <select name="search_state">
                                            <option>-- 주문 상태 전체 --</option>
                                                                                        <option value="OC">주문완료</option>
                                                                                        <option value="DR">배송대기</option>
                                                                                        <option value="DT">배송중</option>
                                                                                        <option value="DC">배송완료</option>
                                                                                        <option value="PC">처리완료</option>
                                                                                        <option value="CC">취소완료</option>
                                                                                        <option value="BP">반품수거중</option>
                                                                                        <option value="BC">반품완료</option>
                                                                                        <option value="XP">교환수거중</option>
                                                                                        <option value="XC">교환완료</option>
                                                                                    </select>
                                    </li>
                                    <li class="w20per pc-switch">
                                        <select name="search_pay_state">
                                            <option>-- 결제 상태 전체 --</option>
                                                                                        <option value="W">미입금</option>
                                                                                        <option value="A">재결제대기</option>
                                                                                        <option value="E">결제완료</option>
                                                                                        <option value="RF1">환불대기</option>
                                                                                        <option value="RF5">환불완료</option>
                                                                                    </select>
                                    </li>
                                    <li class="w20per pc-switch">
                                        <select name="search_pay_method">
                                            <option>-- 결제 수단 전체 --</option>
                                                                                        <option value="MBA">무통장</option>
                                                                                        <option value="PCA">신용카드</option>
                                                                                        <option value="PBR">계좌이체</option>
                                                                                        <option value="PBV">가상계좌</option>
                                                                                        <option value="SSP">삼성페이</option>
                                                                                    </select>
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
                                            <option>-- 검색 키워드 --</option>
                                            <option value="ord_id">주문번호</option>
                                            <option value="prd_ord_id">상품주문번호</option>
                                            <option value="sender">주문자</option>
                                            <option value="phone">휴대폰 번호</option>
                                            <option value="receiver">수령자</option>
                                            <option value="prd_name">상품명</option>
                                            <option value="prd_id">상품번호</option>
                                                                                    </select>
                                    </li>
                                    <li class="w50per">
                                        <input type="text" name="search_keyword" value="">
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr class="last">
                            <th class="txt-l">
                                <select style="width:120px" name="search_end_state" class="pc-switch">
                                    <option value="ord_end">주문완료</option>
                                    <option value="pay_end">결제완료</option>
                                </select>
                            </th>
                            <td>
                                <ul class="arr-align">
                                    <li class="w40per period-4x">
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-11-23" edate="2018-11-23">오늘</a>
                                        <a href="#" class="btn-toggle btn-dateterm now" sdate="2018-11-16" edate="2018-11-23">1주일</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-10-23" edate="2018-11-23">1개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-08-23" edate="2018-11-23">3개월</a>
                                        <a href="#" class="btn-toggle btn-dateterm" sdate="2018-05-23" edate="2018-11-23">6개월</a>
                                    </li>
                                    <li class="w30per calendar">
                                        <label><input type="text" name="search_start_date" value="2018-11-16" id="dp1542955200532" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                        <span>~</span>
                                        <label><input type="text" name="search_end_date" value="2018-11-23" id="dp1542955200533" class="hasDatepicker"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h16_calendar.png" alt="calendar"></label>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- .tbl-setting -->
            <div class="btn-c">
                <a href="#" class="btn-h52-blue" id="btn_search">검색</a>
                <a href="#" class="btn-h52-blue" id="btn_search_ing" style="display:none;">검색중</a>
            </div>
            </form>
        </div><!-- .sect-top -->
    <div class="pc-switch">
        <!-- 17.12.15 추가 s -->
        		<!-- 17.12.15 추가 e -->
        <div class="sect-hd">
            <h3>주문 검색 결과</h3>
            <span>( 주문완료 : <em id="txt_ord_count">0건</em> / 결제완료 : <em id="txt_pay_count">0건</em> / 판매금액 : <em id="txt_pay_price">0원</em> )</span>
        </div><!-- .sect-hd -->
        <div class="sect-cont">
            <div class="tbl-side">
                <select name="claim_event" style="width:200px">
                    <option value="">-- 일괄 처리 --</option>
                    <option value="CB">입금완료</option>
                    <option value="DT">배송중</option>
                    <option value="DC">배송완료</option>
                    <option value="NOCB">미입금</option>
                                    </select>&nbsp;
                <a href="javascript:void(0);" class="btn-list-event-pc btn-black" device="pc">적용</a> | 
                <a href="javascript:void(0);" class="MSH-btn-send-delinum btn-black" device="pc">송장 번호 안내</a>
                <div class="abs-r">
                    <select style="width:200px" name="select_excel_fields"><option value="">-- 다운로드 양식 선택 --</option></select>
                    <a href="#" class="btn-black btn-select-excel">다운로드</a>&nbsp;
					                    <a href="#" class="btn-setting btn-setting-excel mr-40">설정</a>
                    <select style="width:120px; display:none;">
                        <option>10개</option>
                    </select>
                </div>
            </div><!-- .tbl-side -->
            <div id="order_list" class="tbl-list tbl-extend tbl-horz mt-20">
            <p id="order_list_sql" style="display:none; padding:20px; font-size: 13px;"></p>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:55px">
                    <col style="width:130px">
                    <col style="width:165px">
                    <col style="width:120px">
                    <col>
                    <col>
                    <col style="width:110px">
                    <col style="width:200px">
                    <col style="width:100px">
                    <col style="width:100px">
                    <col style="width:100px">
                    <col style="width:100px">
                </colgroup>
                <thead>
                    <tr>
                        <th><label class="single"><input name="chk_ord_all" type="checkbox" value="pc"><span></span></label></th>
                        <th>주문일시</th>
                        <th>주문번호</th>
                        <th colspan="2">상품정보</th>
                                                <th>수량</th>
                                                <th>상태</th>
                        <th>송장번호&nbsp;<a href="#orderDeliNumGuide" class="lnk-qmark open-layer">도움말</a></th>
                        <th>주문자</th>
                        <th>결제상태</th>
                        <th>결제수단</th>
                        <th>결제금액</th>
                    </tr>
                </thead>
                <tbody id="pc_ord_row">
					<tr>
                        <td colspan="12">검색 조건을 확인하신 후 검색 버튼을 클릭하세요.</td>
                    </tr>
				</tbody>
            </table>
            </div>
            <div class="paging" id="pagination">
            </div><!-- .paging -->
        </div><!-- .sect-cont -->
    </div><!-- .pc-switch -->
    <div class="sect-cont pc-switch">
        <form id="downGuideCsv" method="post" action="/adm/order/manage/downGuideCsv"></form>
        <form id="delivery_form">
        <h5 class="fw-normal">운송장 일괄등록 <a href="#orderGuide1" class="lnk-qmark open-layer">도움말</a></h5>
        <div class="tbl-list tbl-wide mt-20">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:180px">
                    <col>
                    <col style="width:180px">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="txt-l pl-20">택배 업체 선택</th>
                        <td class="txt-l pl-20">
                            <select style="width:200px" name="select_deli_code">
                                <option value="">-- 택배 업체 선택 --</option>
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
                                                            </select>
                        </td>
                        <td rowspan="4">
                            <a href="#" id="btn_upload_delivery" class="btn-black pd-10">운송장 일괄 등록</a>
                            <a href="#" id="btn_upload_delivery_ing" class="btn-black pd-10" style="display: none;">운송장 등록 중</a>
                        </td>
                    </tr>
                    <tr>
                        <th class="txt-l pl-20" rowspan="2">일괄 등록 옵션</th>
                        <td class="txt-l pl-20">
                            <label>
                                <input type="checkbox" name="chk_update_status" value="N"> 
                                <span>송장번호만 등록합니다. (처리상태 변경 없음)</span>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="txt-l pl-20"><label><input type="checkbox" name="chk_delivery_num" value="Y"> <span>송장번호 내 특수 문자는 제거합니다. (하이픈(-), 쉼표(,), 마침표(.) 제거)</span></label></td>
                    </tr>
                    <tr>
                        <th class="txt-l pl-20">파일 업로드 (CSV)</th>
                        <td class="txt-l pl-20">
                            <span class="file-area">
                                <a href="#" class="btn-black">파일 업로드</a>
                                <input type="file" name="delivery_file">
                            </span>&nbsp;
                            <span class="file-name">등록된 파일이 없습니다.</span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-list -->
        </form>
    </div><!-- .sect-cont -->
>>>>>>> refs/remotes/origin/minu
</div>