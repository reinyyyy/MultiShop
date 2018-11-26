<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-body">
    <h2 class="blind">메인</h2>
    <!-- notice -->
    <div class="sect-both">
        <div class="f-l">
            <div class="sect-hd mt-none">
                <h3>공지사항</h3>
                <a href="https://www.mysoho.com/customer_service.html?page_type=notice" target="_blank" class="right lnk">전체보기</a>
            </div><!-- .sect-hd -->
            <div class="sect-cont">
                <ul class="notice">
                                    <li>
                    <a href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=56" target="_blank">[업그레이드] 상품 상세 페이지킨 에디터 추가</a>
                    <span class="date">[11/15]</span>
                </li>                <li>
                    <a href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=55" target="_blank">[공지] 마이소호 11월 서비스 교육 안내 (11/22)</a>
                    <span class="date">[11/14]</span>
                </li>                <li>
                    <a href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=54" target="_blank">[이벤트] 창업 스토리 이벤트 &lt;홍보지원금 30만원 + 무료 홍보영상 제작(200만원 상당)&gt;</a>
                    <span class="date">[10/24]</span>
                </li>                <li>
                    <a href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=53" target="_blank">[업그레이드] 개인결제 주문서 등록 시 SMS 발송 옵션 추가(PC)</a>
                    <span class="date">[10/17]</span>
                </li>                <li>
                    <a href="https://www.mysoho.com/customer_service.html?page_type=notice&amp;nid=52" target="_blank">[공지] 마이소호 10월 서비스 교육 안내 (10/30)</a>
                </li>                </ul>
            </div><!-- .sect-cont -->
        </div><!-- .f-l -->
        <div class="f-r">
            <div class="sect-hd mt-none">
                <h3>운영현황</h3>
            </div><!-- .sect-hd -->
            <div class="sect-cont">
                <ul class="notice">
                    <li>
                        <span class="tit">사업자 인증</span>
                        <span>
                            미인증&nbsp;&nbsp;&nbsp;&nbsp;<a href="/adm/card/business" style="display:inline"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/btn_confirm.png"></a>                        </span>
                    </li>
                    <li>
                        <span class="tit">도메인</span>
                        <span>
                                                        미사용&nbsp;&nbsp;&nbsp;&nbsp;<a href="/adm/mypage/domain" style="display:inline"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/btn_regist.png"></a>
                                                    </span>
                    </li>
                    <li>
                        <span class="tit">통합결제 (PG)</span>
                        <span>
                                                        미사용&nbsp;&nbsp;&nbsp;&nbsp;<a href="/adm/card/manage" style="display:inline"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/btn_join.png"></a>
                                                    </span>
                    </li>
                    <li>
                        <span class="tit">SMS</span>
                        <span class="fc-blue">
                            0건&nbsp;&nbsp;&nbsp;&nbsp;<a href="/adm/mypage/manage/service" style="display:inline"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/btn_charge.png"></a>
                        </span>
                    </li>
                    <li style="padding-right:0px">
                                        &nbsp;
                    </li>
                </ul>
            </div><!-- .sect-cont -->
        </div><!-- .f-r -->
    </div><!-- .sect-both -->

    
    <div class="sect-hd">
        <h3>오늘현황</h3>
        <a href="#guide1" class="lnk-qmark open-layer">도움말</a><!-- 2017.07.26 수정 -->
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <ul class="today-status">
            <li class="order">
                            <dl>
                    <dt>주문 완료</dt>
                    <dd class="btn-order-move" data-type="today" data-end-state="ord_end">0건</dd>
                </dl>
            </li>
            <li class="pay">
                <dl>
                    <dt>결제 완료</dt>
                    <dd class="btn-order-move" data-type="today" data-end-state="pay_end">0건</dd>
                </dl>
            </li>
            <li class="price last">
                <dl>
                    <dt>결제 금액</dt>
                    <dd class="btn-order-move" data-type="today" data-end-state="pay_end">0원</dd>
                </dl>
            </li>
        </ul>
    </div><!-- .sect-cont -->
    <div class="sect-hd">
        <h3>주문현황</h3>
        <a href="#guide2" class="lnk-qmark open-layer">도움말</a><!-- 2017.07.26 수정 -->
            </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <ul class="order-status">
                        <li>
                <dl>
                    <dt>미입금</dt>
                    <dd class="btn-order-move" data-end-state="" data-type="order" data-state="" data-pay-state="W">0건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>배송대기</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DR" data-pay-state="">0건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>배송중</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DT" data-pay-state="">0건</dd>
                </dl>
            </li>
            <li class="last">
                <dl>
                    <dt>배송완료</dt>
                    <dd class="btn-order-move" data-end-state="pay_end" data-type="order" data-state="DC" data-pay-state="">0건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>취소완료</dt>
                    <dd class="btn-order-move" data-end-state="" data-type="order" data-state="CC" data-pay-state="">0건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>환불대기</dt>
                    <dd class="btn-order-move" data-end-state="" data-type="order" data-state="" data-pay-state="RF1">0건</dd>
                </dl>
            </li>
            <li>
                <dl>
                    <dt>환불완료</dt>
                    <dd class="btn-order-move" data-type="order" data-state="" data-pay-state="RF5">0건</dd>
                </dl>
            </li>
            <li>&nbsp;</li>
                    </ul>
    </div><!-- .sect-cont -->
</div>