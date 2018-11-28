<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="prdRegist" class="page-body rw">
    <form id="product_form" method="post" enctype="multipart/form-data" action="add.do">
    <!-- PARAMETER -->
    <input type="hidden" name="prd_id" value="0">
    <input type="hidden" name="prd_delivery_use" value="Y">
    <input type="hidden" name="prd_opt_use" value="N">
    <input type="hidden" name="prd_custom_opt_use" value="N">
    <input type="hidden" name="prd_img_type" value="IMG">
    <input type="hidden" name="prd_upload_type" value="upload">
    <input type="hidden" name="prd_pay_type" value="ALL">
    <input type="hidden" name="prd_use_delivery" value="Y">
    <input type="hidden" name="prd_saved_img" value="">
    <input type="hidden" name="pdt_pagekin_detail" value="">
    <input type="hidden" name="prd_upload_key" value="0">
    <input type="hidden" name="del_opt_ids" value="">
    <input type="hidden" name="del_sto_ids" value="">

    <!-- ONLY CHECK -->
    <input type="hidden" id="opt_total_count" value="0">

        <div class="main-hd">
        <h2>상품 등록</h2>
        <!-- 18.06.14 수정 및 추가 s -->
        <div class="box-r">
            <span class="txt-necessary">*필수</span>
           <!--  <a href="#" class="js-open-excel-upload-layer btn-h36-black abs-r">상품 일괄 업로드</a> -->
        </div>
        <!-- 18.06.14 수정 및 추가 e -->
    </div>
        <!-- ======================= 판매 상태 시작 ======================= -->
    <div class="sect-hd">
        <h3>판매 상태</h3>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->

    <div class="sect-cont mobile-block" style="display: none;">
        <label class="mr-80"><input type="radio" name="p_status" value="Y" checked=""><span>판매</span></label>
        <label class="mr-80"><input type="radio" name="p_status" value="N"><span>판매 중지</span></label>
    </div><!-- .sect-cont -->
    <!-- ======================= 판매 상태 종료 ======================= -->
    <!-- ======================= 판매 아이템 시작 ======================= -->
    <div class="sect-hd">
        <h3>판매 아이템</h3>
        <a href="#prdGuide10" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th><strong>판매 아이템</strong></th>
                        <td>
                            <div class="base pr-20">
                                <ul class="arr-align p_cate_ul">
                                    <li>
                                        <select name="p_cateNum" data-origin="0" value="0" id = "p_cateNum" style="width:285px">
                                            <option value="0">-- 1차 선택 --</option>
	                                        <option value="1">건강/식품</option>
	                                        <option value="2">디지털/가전</option>
	                                        <option value="3">패션/의류</option>
                                        </select>
                                    </li>
                                    <li>
                                        <select name="p_midCate" data-origin="0" value="0" id = "p_midCate" style="width:285px">
                                            <option value="0">-- 2차 선택 --</option>	<!-- 동적 처리 -->
                                        </select>
                                    </li>
                                    <li>
                                        <select name="p_smallCate" data-origin="0" value="0" id = "p_smallCate" style="width:285px">
                                            <option value="0">-- 3차 선택 --</option>	<!-- 동적 처리 -->
                                        </select>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 판매 아이템 종료 ======================= -->
    <!-- ======================= 상품명 시작 ======================= -->
    <div class="sect-hd">
        <h3>상품명</h3>
        <a href="#" class="btn-arrow">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                <tr>
                    <th><strong>상품명 <span class="fc-red">*</span></strong></th>
                    <td>
                        <input type="text" name="p_name" value="" class="w70per">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/250)</span>
                    </td>
                </tr>
                <tr>
                    <th><strong>제조사 <span class="fc-red">*</span></strong></th>
                    <td>
                        <input type="text" name="p_maker" value="" class="w70per">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/250)</span>
                    </td>
                </tr>
                <tr>
                    <th><strong>원산지 <span cl`ass="fc-red">*</span></strong></th>
                    <td>
                        <input type="text" name="p_origin" value="" class="w70per">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/250)</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div> <!-- .tbl-setting -->
    </div> <!-- .sect-cont -->
    <!-- ======================= 상품명 종료 ======================= -->
    <!-- ======================= 가격 시작 ======================= -->
    <div class="sect-hd">
        <h3>가격</h3>
        <a href="#" class="btn-arrow">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th><strong>판매가격 <span class="fc-red">*</span></strong></th>
                        <td><div class="base pr-20"><span class="fc-red">\</span> <input type="text" name="p_cost" style="width:300px;" value="0" class="w20per"></div></td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 가격 종료 ======================= -->
    <!-- ======================= 해시태그 시작 ======================= -->
    <!-- <div class="sect-hd">
        <h3>해시태그#</h3>
        <span class="txt-select">(선택)</span>
        <span class="sect-hd-side txt-gray mobile-switch">등록안함</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div>.sect-hd
    <div class="sect-cont" style="display: none;">
        <div class="hashtag-setting">
            <div class="base"><span>#</span> <input type="text" class="MSH-input-hashtag" placeholder="태그는 띄어쓰기나 엔터로 구분할 수 있습니다." style="width:80%" maxlength="30"></div>
            <ul class="MSH-hashtag-area">
                            </ul>
        </div>
    </div> -->
    <!-- .sect-cont -->
    <!-- ======================= 해시태그 종료 ======================= -->
    <!-- ======================= 상품 이미지 시작 ======================= -->
    <div class="sect-hd">
        <h3>상품 대표이미지</h3>
        <a href="#prdGuide1" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr class="bg-yellow thumb-box" style="">
                        <th class="th-align">
                            <span id="upload_img_txt">대표이미지</span><br>
                            <span class="fc-gray fs-15">(<span class="MSH-txt-img-cnt">0</span>/10)</span>
                        </th>
                        <td>
								<div id="imgUpload" style="margin-top: 5px;">
									<div class="swiper-container thumbs">
										<ul class="swiper-wrapper">
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img[]">
													</span>
												</p>
											</li>
										</ul>
									</div>
								</div>

								<div id="imgPath" class="mt-15" style="display:none;">
                                <div class="pc-switch mobile-switch">
								
						
									
                                    <textarea class="w60per" name="prd_img_url"></textarea>
                                    <p class="pc-desc mt-15 fc-gray fs-15 img-path-txt">최대 10개 이미지 경로 입력 가능 2개 이상 시, 엔터로 구분하세요.</p>
                                    <p class="mobile-desc mt-10 fc-blue fs-15 img-path-txt">최대 10개 이미지 경로 입력 가능 2개 이상 시, 엔터로 구분하세요.</p>
                                </div><!-- .mobile-switch -->
                            </div><!-- #imgPath -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 상품 이미지 종료 ======================= -->
    <!-- ======================= 재고 시작 ======================= -->
    <!-- <div class="sect-hd">
		<h3>재고</h3>
		<span class="txt-select">(선택)</span>
		<a href="#" class="btn-arrow up">닫기</a>
	</div><!-- .sect-hd -->
	<!-- <div class="sect-cont" style="display: none;">
		<ul id="stock-non" class="mobile-stock stock" style="">
			<li>
				<label><span>수량</span></label>
				<div class="base pr-20"><input type="text" name="p_amount" value="0"> <span>개</span></div>
			</li>
		</ul>
		<p id="stock-use" class="fc-blue stock" style="display:none">선택형 옵션 사용 시, 옵션 재고로 대체됩니다.</p>
	</div> -->
	<!-- ======================= 재고 종료 ======================= -->
	<!-- ======================= 옵션 시작 ======================= -->
	<div class="sect-hd" style="">
        <h3>옵션</h3>
        <a href="#prdGuide2" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->
    <!--div class="sect-hd" style="">
        <h3>옵션</h3>
        <a href="#prdGuide2" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow">닫기</a>
    </div--><!-- .sect-hd -->
    <div class="sect-cont pd-none" style="display: none;">
        <div class="">
            <div class="tbl-setting">
	<table>
	<caption></caption>
	<colgroup>
	<col class="w140">
	<col>
	</colgroup>
	<tbody>
                        <!-- 2017.08.18 추가 -->
                                                <tr class="opt-select js-optResetFalse is-pc-row" is-opt="true" style="display:none;">
                            <th>옵션명</th>
                            <td>
                                <ul class="mobile-option">
                                    <li>
                                        <select id="add_option_id" prd-id="0">
                                                                                    </select>
                                    </li>
                                    <li>
                                                                                <span>옵션값</span> <input type="text" name="add_option_value"> <a href="#" class="btn-black" id="btn_add_opt">추가</a>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                                                <tr class="opt-select js-optResetTrue bg-yellow is-pc-row" is-opt="false" style="display: table-row;">
                            <td colspan="2">
                                <div class="tbl-list" id="mix_option">
                                    <table id="add_mix_option">
                                        <caption></caption>
                                        <colgroup>
                                            <col>
                                            <col>
                                            <col style="width:100px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>옵션명</th>
                                                <th>옵션값</th>
                                                <th>재고</th>
                                                <th style = "width : 10%"><a href="javascript:void(0)" class="btn-add-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_plus.png" alt="추가" style="width:30px"></a></th>
                                            </tr>
                                        </thead>
                                        <tbody id = "p_option_tbody">
                                            <tr>
                                                <td>
                                                    <input type="text" name="p_option1[]" placeholder="옵션명을 입력하세요. (예시: 색상/사이즈)" value="">	<!-- 옵션1 , 를 기준으로 나눌거임 -->
                                                </td>
                                                <td>
                                                	<input type="text" name="p_option2[]" placeholder="옵션값을 입력하세요. (예시: red/m)" value="">
                                               	</td>
                                                <td>
                                                	<input type = "text" name = "p_amount[]" placeholder = "재고 " value = "">
                                               	</td>
                                                <td style = "width : 10%">
                                                	<a href="javascript:void(0)" class="btn-del-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px"></a>
                                               	</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <input type = "button" value = "확인" id = "check_btn">
                                    <script  src = "https://code.jquery.com/jquery-3.3.1.min.js"></script>
                                    <script>
                                    	$(document).ready(function(){
                                     		$('#add_mix_option').on('click', '.btn-add-opt', function(){
                                    			var appendTo_option = 
                                    			'<tr>' +
                                    			'<td><input type = "text" name = "p_option1[]" placeholder = "옵션명을 입력하세요. (예시: 색상/사이즈)"></td>' +
                                    			'<td><input type = "text" name = "p_option2[]" placeholder = "옵션값을 입력하세요. (예시: red/m)"></td>' +
                                    			'<td><input type = "text" name = "p_amount[]" placeholder = "재고 " value = ""></td>' + 
                                    			'<td style = "width : 10%"><a href="javascript:void(0)" class="btn-del-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px"></a></td>' +
                                    			'</tr>'
                                    			;
                                    			var appendTo_html = $('#p_option_tbody').html() + appendTo_option;
                                    			$('#p_option_tbody').html(appendTo_html);
                                    		})//기존 정보 사라짐
                                    		
                                    		$('#check_btn').click(function(){
                                     			alert("");
                                     		});
                                    		$('#add_mix_option').on('click', '.btn-del-opt', function(){
                                    			$(this).parent().parent().remove();
                                    		});
                                    	});
                                    </script>
                                </div><!-- .tbl-list -->
                            </td>
                        </tr>
                                            <!--     <tr class="opt-select opt-list bg-yellow is-pc-row" style="display: table-row;">
                            <td colspan="2" id="mix_option_result">
                                옵션 목록
                                <span>(
                                    <label><input type="checkbox" id="js-optStoUseView" checked="checked"><span style="padding-left:24px">사용 옵션만 보기</span></label>
                                </span>)
                                <span class="btnOptReset" style="display:none;"><a href="javascript:;" class="btn-black" id="js-optReset">옵션 재설정</a></span>
								<div class="tbl-list mt-10">
									<table class="MSH-opt-head">
										<caption></caption>
										<colgroup>
											<col style="width:55px">
											<col style="width:140px">
																						<col style="width:100px">
																						<col style="width:130px">
											<col style="width:160px">
											<col style="width:145px">
											<col>
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2"><label class="single"><input type="checkbox" id="all_chk_sto" value="Y"><span></span></label></th>
												<th rowspan="2">옵션 코드</th>
												<th id="cols_count" colspan="0">옵션 목록 값</th>
												<th rowspan="2">옵션 가격</th>
												<th rowspan="2">재고<br><span class="fc-gray fw-normal">( <label><input type="checkbox" id="chk_all_opt_unlimit"><span style="padding-left:24px">전체 무제한</span></label> )</span></th>
												<th rowspan="2">사용</th>
												<th rowspan="2">특이사항</th>
											</tr>
											<tr>
                                                                                            </tr>
                                        </thead>
                                    </table>
                                </div>.tbl-list
                                <div class="tbl-list tbl-body" style="max-height:300px">
									<table class="MSH-opt-body">
										<caption></caption>
										<colgroup>
											<col style="width:55px">
											<col style="width:140px">
																						<col style="width:100px">
																						<col style="width:130px">
											<col style="width:160px">
											<col style="width:145px">
											<col>
										</colgroup>
										<tbody>
											                                        </tbody>
                                    </table>
                                </div>.tbl-list
                                <div class="tbl-side mt-20 is-pc">
                                    <label class="mr-10 pb-10"><strong>선택한 옵션 정보를 아래와 같이 수정합니다.(옵션 금액과 재고는 입력한 경우에만 적용합니다.)</strong></label><br>
                                    <label class="mr-10"><p class="fc-blue" style="display:inline-block;">옵션 가격 :</p> &nbsp; 
                                        <select style="width:105px" name="opt_update_price_type">
                                            <option value="reg">재입력</option>
                                            <option value="plus">금액추가</option>
                                            <option value="minus">금액차감</option>
                                        </select>
                                        <input type="text" name="all_sto_price" placeholder="옵션 금액" style="width:130px">
                                    </label>
                                    <label class="mr-10"><p class="fc-blue" style="display:inline-block;">재고 :</p> &nbsp; 
                                        <select style="width:105px" name="opt_update_stock_type">
                                            <option value="reg">재입력</option>
                                            <option value="plus">재고추가</option>
                                            <option value="minus">재고차감</option>
                                            <option value="unlimit">무제한</option>
                                        </select>
                                        <input type="text" name="all_sto_stock" style="width:130px" placeholder="재고 수량">
                                    </label>
                                    <label class="mr-10"><p class="fc-blue" style="display:inline-block;">사용 :</p> &nbsp;
                                        <select name="all_sto_use" style="width:130px">
                                            <option>선택안함</option>
                                            <option value="Y">사용</option>
                                            <option value="N">미사용(=삭제)</option>
                                        </select>
                                    </label>
                                    <a href="#" class="btn-black" id="btn_all_sto_set">일괄수정</a>
                                    18.07.26 일괄삭제 버튼 제거
                                    span class="pd-10 fc-blur">|</span><a href="#" class="btn-black" id="btn_del_sto">일괄삭제</a>
                                </div>.tbl-side
                                <ul class="m-align mt-10 is-mobile">
                                    <li class="m30per">
                                        <select id="set_sto_type">
                                            <option value="price">옵션 가격</option>
                                            <option value="stock">옵션 재고</option>
                                            <option value="use">옵션 사용</option>
                                        </select>
                                    </li>
                                    <li class="m50per">
                                        <select id="set_sto_type_use" style="width:130px; display:none;">
                                            <option>선택안함</option>
                                            <option>Y</option>
                                            <option>N</option>
                                        </select>
                                        <input type="text" id="set_sto_type_price" value="">
                                    </li>
                                    <li class="m20per">
                                        <a href="#" class="btn-black" id="btn_set_sto">적용</a>
                                    </li>
                                </ul>
                            </td>
                        </tr> -->
                    </tbody>
	</table>
</div>
<!-- .tbl-setting -->
        </div><!-- .pc-switch -->
    </div><!-- .sect-cont -->
    <!-- ======================= 옵션 종료 ======================= -->
    <!-- ======================= 배송 시작 ======================= -->
    <div class="sect-hd">
        <h3>배송</h3>
        <a href="#prdGuide4" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none" style="display: none;">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <!-- 18.08.27 추가 s -->
                    <tr>
                        <th>배송 여부</th>
                        <td>
                            <label class="mr-40"><input type="radio" name="prd_use_delivery" value="Y" checked="checked"><span>배송함</span></label>
                            <label class="mr-40"><input type="radio" name="prd_use_delivery" value="N"><span>배송 안함</span></label>
                        </td>
                    </tr>
                    <!-- 18.08.27 추가 e -->
                    <tr class="delivery">
                        <th>기본 배송비</th>
                        <td>
                            <select name="prd_delivery_type" class="w20per">
                                <option value="Y" selected="">무료</option>
                                <option value="N">조건부 무료</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="delivery bg-yellow condition1" style="display:none;">
                        <th>배송비 <span class="fc-red">*</span></th>
                        <td>
                            <div class="base pr-20"><input type="text" name="prd_delivery" class="w20per" value="0"> <span class="fs-15">원</span></div>
                        </td>
                    </tr>
                    <tr class="delivery bg-yellow condition1" style="display:none;">
                        <th>결제 조건 <span class="fc-red">*</span></th>
                        <td>
                            <span class="base pr-20"><input type="text" class="w20per" name="prd_delivery_min" value="0"> <span class="fs-15">원</span></span> <span class="mt-5 fs-15">이상 결제 시 배송비 무료</span>
                        </td>
                    </tr>
                    <tr class="delivery">
                        <th>지역 배송비</th>
                        <td>
                            <label><input type="radio" name="prd_use_delivery_area" value="Y"><span>사용함</span></label>
                            <a href="/adm/order/policy/delivery" class="btn-h32-black-o mr-20">배송비 등록</a>
                            <label class="mr-40"><input type="radio" name="prd_use_delivery_area" value="N" checked=""><span>사용 안함</span></label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 배송 종료 ======================= -->
    <!-- 						 상세 이미지 시작                       -->
    <div class="sect-hd">
        <h3>상품 상세이미지</h3>
        <a href="#prdGuide1" class="lnk-qmark open-layer">도움말</a>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr class="bg-yellow thumb-box" style="">
                        <th class="th-align">
                            <span id="upload_img_txt">상세이미지</span><br>
                            <span class="fc-gray fs-15">(<span class="MSH-txt-img-cnt">0</span>/10)</span>
                        </th>
                        <td>
								<div id="imgUpload" style="margin-top: 5px;">
									<div class="swiper-container thumbs">
										<ul class="swiper-wrapper">
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img_detail[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img_detail[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img_detail[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img_detail[]">
													</span>
												</p>
											</li>
											<li class="add swiper-slide prd-img-resizing">
												<p>
													<span class="btn-prd-upload">
														<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
														<input type="file" name="img_detail[]">
													</span>
												</p>
											</li>
										</ul>
									</div>
								</div>

								<div id="imgPath" class="mt-15" style="display:none;">
                                <div class="pc-switch mobile-switch">
                                    <textarea class="w60per" name="prd_img_url"></textarea>
                                    <p class="pc-desc mt-15 fc-gray fs-15 img-path-txt">최대 10개 이미지 경로 입력 가능 2개 이상 시, 엔터로 구분하세요.</p>
                                    <p class="mobile-desc mt-10 fc-blue fs-15 img-path-txt">최대 10개 이미지 경로 입력 가능 2개 이상 시, 엔터로 구분하세요.</p>
                                </div><!-- .mobile-switch -->
                            </div><!-- #imgPath -->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 상세설명 시작 ======================= -->
    <div class="sect-hd">
        <h3 id="detail-top">상세설명
        </h3>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont" style="display: none;">
        <!-- 18.11.16 s -->
        <div class="mb-10">
           <!--  <label class="mr-40">
                <input type="radio" name="pdt_detail_type" data-area="pagekinArea" value="P" checked=""><span>간단 에디터(페이지킨)로 작성</span>
            </label>
            <label class="mr-10">
                <input type="radio" name="pdt_detail_type" data-area="defaultArea" value="D"><span>일반 상품상세 작성</span>
            </label> -->
           <img src="https://cafe.pstatic.net/editor/btn_n_aligncenter.gif" alt="중간 정렬" width="21" height="21" title="중간 정렬" nhn:command="justifycenter" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
        </div>
        
        가운데정렬 테스트할때 사용하면됨
        
        <div id="pagekinArea" class="prdDtail-pagekin prd-write">
        
           <!--  페이지킨 최초 등록 영역-->
           <!-- <div id="pagekinCreateArea" style="width: 100%; height: 400px;"> -->
           <div id="pagekinCreateArea" style="width: 100%; height: 400px;">
           			<!-- 상세내용 미리보기 느낌임 -->
					<iframe src="editor/default.jsp" id = "default_iframe" title="글쓰기영역" frameborder="0" style="width: 100%; height: 100%; display: block;">
					
					 </iframe>
					<!--   <p class="txt1">사진, 버튼, 동영상, 지도, 옵션 등을 <br><span class="fc-blue">간단 에디터를 이용하여 손쉽게</span> 만들 수 있습니다</p>
                
                <p class="btnWrap">
                    <a href="javascript:void(0);" class="btn-h52-blue w230 mr-10 js-createPagekin">상품상세 만들기</a>
                    <a href="javascript:void(0);" class="btn-h52-black w230 js-pagekinList">상품상세 추가하기</a>
                </p> -->
                <p id="status">이미지 선택안됨</p>
            </div>
            <div>
            <br>
            	<input type = "button" value = "확인" id = "check">
            	<input type = "button" value = "태그거르기 확인" id = "check_img">
            	<input type = "hidden" value = "" name = "p_contents" id = "p_contents">
            </div>
            <div id = "holder">
            
            </div>
            <script>
            	$(document).ready(function(){
            		//p_contents 에서는 img 위치 알아하고 DB에 저장되어있던 상세이미지 풀어서 뿌려줘야함
            		
            		
            		$('#check_img').click(function(){
            			var data = 	$('#default_iframe').contents().find('#contents_div').html();
            			var result = data.replace(/<div>/gi, '').replace(/<\/div>/gi, '\n');
            			var result2 = result.replace(/<(\/img|img)([^>]*)>/gi, '<img>');
            			alert(result2);
            		});
            		
            		$('#check').click(function(){
    	        		var data = $('#default_iframe').contents().find('#contents_div').html();
    	        		var result = data.replace(/<div>/gi, '').replace(/<\/div>/gi, '\n');
    	        		alert (result);
    	        		
    	        		//var upload = document.getElementsByTagName('input')[0],
    	        		var upload = $('input[name="img[]"]');
    	        		var holder = $('#holder'); 
    	        	    //holder = document.getElementById('holder'),
    	        	    state = document.getElementById('status');
    	        	    
    	        	    
    	        	    
    	        	    $.each(upload, function(index, items){
    	        	    	var file = items.files;
    	        	    	var reader = new FileReader();
    	        	    	reader.onload = function(event){
    	        	    		var img = new Image();
    	        	    		img.src = event.target.result;
    	        	    		if(img.width > 560){
    	        	    			img.width = 560;	
    	        	    		}
    	        	    		holder.html(img);
    	        	    	}
    	        	    	
    	        	    	alert(items.files);
    	        	    	if (typeof window.FileReader === 'undefined') {
    	      	        	  state.className = 'fail';
    	      	        	} else {
    	      	        	  state.className = 'success';
    	      	        	  state.innerHTML = '이미지 선택됨';
    	      	        	}
    	        	    });
            		});
    	        	   
            		$('input[name="img[]"]').change(function(){
            			
  	        			//'<img src = '++'/>';
  	        	    });
            	});
            </script>
            <!-- 페이지킨 적용 영역
            <dl id="pagekinListArea" style="display:none;">
                <dt>
                    <span>적용된 상품상세</span>
                </dt>
                <dd>
                    <div id="pagekinUpdateArea" class="is"></div>
                    <div id="pagekinInputArea" class="is" style="display:none;"></div>
                </dd>
            </dl>
             -->
        </div>
        <div id="defaultArea" class="mt-15 prd-write" style="display: none;">
            <textarea name="pdt_detail" placeholder="상품에 대한 소개를 입력하세요. (페이지킨 경로나 HTML 태그도 사용 가능합니다.)" style="height:480px"></textarea>
        </div>
        <!-- 18.11.16 e -->
    </div><!-- .sect-cont -->
    <!-- ======================= 상세설명 종료 ======================= -->
    <!-- ======================= 사용 결제수단 시작 ======================= -->
    <!-- <div class="sect-hd">
        <h3>사용 결제수단</h3>
                <a href="/adm/bank/manage" class="btn-h32-black-o">계좌 등록</a>
                        <a href="/adm/card/manage" class="btn-h32-black-o">카드 결제 신청</a>
                <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div>.sect-hd
    <div class="sect-cont pd-none" style="display: none;">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <td class="mobile-block">
                                                        <label class="mr-40">
                               <input type="checkbox" name="chk_prd_pay_type[]" value="MBA,PBV" checked=""><span>현금 (무통장)</span>
                            </label>
                                                    </td>
                    </tr>
                </tbody>
            </table>
        </div>.tbl-setting
    </div>.sect-cont -->
    <!-- ======================= 사용 결제수단 종료 ======================= -->
    <!-- ======================= 기타 시작 ======================= -->
    <div class="sect-hd">
        <h3>기타</h3>
        <span class="txt-select">(선택)</span>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->
    <div class="sect-cont pd-none" style="display: none;">
        <div class="tbl-setting">
            <table>
                <caption></caption>
                <colgroup>
                    <col class="w180">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th>상품 정보 제공 고시
                            <a href="#prdGuide3" class="lnk-qmark open-layer">도움말</a>
                        </th>
                        <td>
                            <ul class="arr-align">
                                <li>
                                    <select name="pdt_pci_id" style="width:285px">
                                        <option value="">-- 상품군을 선택하세요 --</option>
                                        <option value="1">의류</option><option value="2">구두/신발</option><option value="3">가방</option><option value="4">패션잡화 (모자/벨트/액세서리)</option><option value="5">침구류/커튼</option><option value="6">가구 (침대/소파/싱크대/DIY제품)</option><option value="7">영상가전 (TV류)</option><option value="8">가정용 전기제품 (냉장고/세탁기/식기세척기/전자레인지)</option><option value="9">계절가전 (에어컨/온풍기)</option><option value="10">사무용기기 (컴퓨터/노트북/프린터)</option><option value="11">광학기기 (디지털카메라/캠코더)</option><option value="12">소형전자 (MP3/전자사전 등)</option><option value="13">휴대폰</option><option value="14">내비게이션</option><option value="15">자동차용품 (자동자부품/기타 자동차용품)</option><option value="16">의료기기</option><option value="17">주방용품</option><option value="18">화장품</option><option value="19">귀금속/보석/시계류</option><option value="20">식품 (농수산물)</option><option value="21">가공식품</option><option value="22">건강기능식품</option><option value="23">영유아용품</option><option value="24">악기</option><option value="25">스포츠용품</option><option value="26">서적</option><option value="27">호텔/펜션 예약</option><option value="28">여행패키지</option><option value="29">항공권</option><option value="30">자동차 대여 서비스 (렌터카)</option><option value="31">물품대여 서비스 (정수기, 비데, 공기청정기 등)</option><option value="32">물품대여 서비스 (서적, 유아용품, 행사용품 등)</option><option value="33">디지털 콘텐츠 (음원, 게임, 인터넷강의 등)</option><option value="34">상품권/쿠폰</option><option value="35">모바일 쿠폰</option><option value="36">영화/공연</option><option value="37">기타 용역</option><option value="39">기타 재화</option>                                    </select>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr class="sub-category bg-yellow bb-none MSH-chk-pci-common-area" style="display:none">
                        <td colspan="2" class="pd-none bb-none">
                            <label style="padding:10px 0 0 210px;"><input type="checkbox" name="chk_pci_common" value="Y"><span>상품 상세 참조로 일괄 입력</span></label>
                        </td>
                    </tr>
                    <tr class="sub-category bg-yellow bb-none">
                        <td colspan="2" class="pd-none">
                            <div id="pci_info_box" class="sub-category tbl-setting bg-yellow">
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col class="w180">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                                                            </tbody>
                                </table>
                            </div><!-- .tbl-setting -->
                        </td>
                    </tr>
                    <tr>
                        <th>상품 청약 철회
                            <a href="#prdGuide7" class="lnk-qmark open-layer">도움말</a>
                        </th>
                        <td>
                            <label class="mr-80"><input type="radio" name="prd_use_recall" value="Y"><span>사용함</span></label>
                            <label class="mr-80"><input type="radio" name="prd_use_recall" value="N" checked="checked"><span>사용안함</span></label>
                        </td>
                    </tr>
                    <tr>
                        <th>면세설정
                            <a href="#prdGuide6" class="lnk-qmark open-layer">도움말</a>
                        </th>
                        <td>
                            <label class="mr-80"><input name="prd_vat_type" value="TAX" type="radio" checked="checked"><span>과세</span></label>
                            <label class="mr-80"><input name="prd_vat_type" value="TXF" type="radio"><span>면세</span></label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 기타 종료 ======================= -->
    <div class="btn-c">
        <a href="javascript:void(0);" id="btn_save" class="btn-h52-blue m100per">등록</a>
    </div>
    </form>
</div>
<form id="form">
    <!-- <input type='file' id="imgInput" /> -->
    <img id="image_section" src="#" alt="your image" />
</form>
<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

$('input[name="img_detail[]"]').change(function(){
	readURL(this);
});

function readURL(input) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            //$('#image_section').attr('src', e.target.result);
            //$('#default_iframe').contents().find('#contents_div').html().append($('#image_section'));
            var img = "<img src = \""+e.target.result+"\" /><br>";
            $('#default_iframe').contents().find('#contents_div').append(img);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}
 
$("#imgInput").change(function(){
    readURL(this);
});

var menuHash = '#left-menu';
var requestUrl = "/adm/product/manage/add";



function make_smallCate(cateNum){
	if(cateNum == 1){
		small_json_1 = {
				'key1' : '쌀',
				'key2' : '면',
				'key3' : '제과'
		};
		return small_json_1;
	}else if(cateNum == 2){
		
	}else if(cateNum == 3){
		
	}
}
	
$(document).ready(function(){
	/* $(document).click(function(){
		console.log($(this).prop('tagName'));
	}); */
		//대분류 카테고리 변경 이벤트
		$('#p_cateNum').on('change', function(){
			var select = "<option value='0'>-- 2차 선택 --</option>";
			if($(this).val() == 1){
				select += "<option>Carbohydrate</option>"
						 +"<option>Protein</option>"
						 +"<option>Fat</option>"
						 +"<option>Vitamin</option>"
						 +"<option>Spice</option>";
				$('#p_midCate').html(select);
			}else if($(this).val() == 2){
				select += "<option>Audio/Video</option>"
						 +"<option>Game</option>"
						 +"<option>Smart Watch</option>"
						 +"<option>Drone</option>"
						 +"<option>TV</option>"
						 +"<option>Laptop/Computer HardWare</option>";
				 $('#p_midCate').html(select);
			}else if($(this).val() == 3){
				select += "<option>Outer</option>"
						 +"<option>TOP</option>"
						 +"<option>Bottom</option>"
						 +"<option>Shoes</option>"
						 +"<option>Innerwear</option>";
				 $('#p_midCate').html(select);
			}
		});
	
		//중분류 카테고리 변경 이벤트
		$('.p_cate_ul').on('change', '#p_midCate', function(){
			var select = "<option value = '0'>-- 3차 선택 --</option>";
			if($(this).val() == '탄수화물'){
				select += "<option>쌀</option>"
						  +"<option>면</option>"
						  +"<option>제과</option>";
				$('#p_smallCate').html(select);
			}else if ($(this).val() == 2){
				
			}else if ($(this).val() == 3){
				
			}
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
        	/* alert($(this).prop('class')); */
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
    
    $('#btn_save').click(function(){
    	
    	//컨텐츠 hidden값에 넣어줘야함
    	var data = 	$('#default_iframe').contents().find('#contents_div').html();
		var result = data.replace(/<div>/gi, '').replace(/<\/div>/gi, '\n').replace(/<br>/gi, '\n');
		var result2 = result.replace(/<(\/img|img)([^>]*)>/gi, '<img>');
		alert(result2); //이미지태그 개수 및 위치 표시가능
		
		$('#p_contents').val(result2);
		
		alert($('#p_contents').val());
		//여기서 유효성검사 해줘야함
    	$('#product_form').submit();
    });


})


function openLeftMenu(data) {

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


</script>