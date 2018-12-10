<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="prdRegist" class="page-body rw">
    <form id="product_form" method="post" enctype="multipart/form-data" action="add.do">
        <div class="main-hd">
        <h2>상품 등록</h2>
        <div class="box-r">
        </div>
    </div>
    
    
    
       <!-- ======================= 판매 상태 시작 ======================= -->
    <div class="sect-hd">
        <h3>판매 상태</h3>
        <a href="#" class="btn-arrow up">닫기</a>
    </div>

    <div class="sect-cont mobile-block" style="display: block;">
        <label class="mr-80"><input type="radio" name="p_status" value="Y" checked=""><span>판매</span></label>
        <label class="mr-80"><input type="radio" name="p_status" value="N"><span>판매 중지</span></label>
    </div><!-- .sect-cont -->
    <!-- ======================= 판매 상태 종료 ======================= -->
    
    
    
    <!-- ======================= 판매 아이템 시작 ======================= -->
    <div class="sect-hd">
        <h3>카테고리</h3>
        <a href="#prdGuide10" class="lnk-qmark open-layer">도움말</a>
        <a href="#" class="btn-arrow">닫기</a>
    </div>
    
    
    
    <div class="sect-cont pd-none">
        <div class="tbl-setting">
            <table>
                <colgroup>
                    <col class="w140">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th><strong>카테고리</strong><span class="fc-red">*</span></th>
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
        </div>
    </div>
    <!-- ======================= 판매 아이템 종료 ======================= -->
    
    
    
    <!-- ======================= 상품명 시작 ======================= -->
    <div class="sect-hd">
        <h3>상품명/제조사/원산지</h3>
        <a href="#" class="btn-arrow">닫기</a>
    </div>
    
    
    
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
                    <th><strong>원산지 <span class="fc-red">*</span></strong></th>
                    <td>
                        <input type="text" name="p_origin" value="" class="w70per">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/250)</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
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
                        <td><div class="base pr-20"><span class="fc-red">\</span> <input type="text" name="p_cost" style="width:300px;" value="0" class="w20per" placeholder = ",제외 숫자만 입력"></div></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
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
        <a href="#" class="btn-arrow">닫기</a>
    </div>
    
    
    
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
                            <span id="upload_img_txt">대표이미지</span><span class="fc-red">*</span><br>
                            <span class="fc-gray fs-15">(<span class="MSH-txt-img-cnt">0</span>/10)</span>
                        </th>
                        <td>			<!--  td 시작 -->
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
                        </td>	<!-- td 종료 -->
                        
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
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
        <a href="#" class="btn-arrow up">닫기</a>
    </div>
    
    
    
    <div class="sect-cont pd-none" style="display: display;">
        <div class="">
            <div class="tbl-setting">
				<table>
					<colgroup>
						<col class="w140">
					</colgroup>
				<tbody>
					<tr class="opt-select js-optResetFalse is-pc-row" is-opt="true" style="display:none;">
						<th>옵션명</th>
						<td>
                           	<ul class="mobile-option">
                               	<li>
									<select id="add_option_id" prd-id="0"></select>
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
								<!-- 옵션 설정 테이블 시작 -->
								<table id="add_mix_option">
								<colgroup>
									<col><!-- 없으면 테이블 레이아웃깨짐 -->
									<col><!-- 없으면 테이블 레이아웃깨짐 -->
									<col style="width: 100px"><!-- 없으면 테이블 레이아웃깨짐 -->
								</colgroup>
								<thead>
								<tr>
									<th>
										옵션명
									</th>
									<th>
										옵션값
									</th>
									<th>
										재고
									</th>
									<th style="width: 10%">
										<a href="javascript:void(0)" class="btn-add-opt">
										<img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_plus.png" alt="추가" style="width: 30px">
										</a>
									</th>
								</tr>
								</thead>
								<tbody id="p_option_tbody">
								<tr>
									<td>
										<input type="text" name="p_option1[]" placeholder="옵션명을 입력하세요. (예시: 색상/사이즈)" value="">
										<!-- 옵션1 , 를 기준으로 나눌거임 -->
									</td>
									<td>
										<input type="text" name="p_option2[]" placeholder="옵션값을 입력하세요. (예시: red/m)" value="">
									</td>
									<td>
										<input type="text" name="p_amount[]" placeholder="재고 " value="">
									</td>
									<td style="width : 10%">
										<a href="javascript:void(0)" class="btn-del-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px"></a>
									</td>
								</tr>
								</tbody>
								</table>
								<!--  옵션 설정 테이블 종료 -->
								
								<input type="button" value="확인" id="check_btn">
								<!-- 테스트용 -->
								
								<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><!-- .pc-switch -->
	</div><!-- .sect-cont -->

    <!-- ======================= 옵션 종료 ======================= -->
    <!-- ======================= 배송 시작 ======================= -->
    <div class="sect-hd">
        <h3>배송</h3>
        <a href="#prdGuide4" class="lnk-qmark open-layer">도움말</a>
        <!-- <span class="txt-select">(선택)</span> -->
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
        <a href="#" class="btn-arrow">닫기</a>
    </div>
    
    
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
                            <span id="upload_img_txt">상세이미지</span><span class="fc-red">*</span><br>
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
                        </td>
                    </tr>
                </tbody>
            </table>
        </div><!-- .tbl-setting -->
    </div><!-- .sect-cont -->
    <!-- ======================= 상세이미지 종료 ======================= -->
    
    
    
    <!-- ======================= 상세설명 시작 ======================= -->
    <div class="sect-hd">
        <h3 id="detail-top">상세설명
        </h3>
        <a href="#" class="btn-arrow up">닫기</a>
    </div><!-- .sect-hd -->
    
    
    
    <div class="sect-cont" style="display: block;">
        <!-- <div class="mb-10">
           <img src="https://cafe.pstatic.net/editor/btn_n_aligncenter.gif" alt="중간 정렬" width="21" height="21" title="중간 정렬" nhn:command="justifycenter" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
        </div> -->
        
        <div id="pagekinArea" class="prdDtail-pagekin prd-write">sss
        
           <div id="pagekinCreateArea" style="width: 100%; height: 400px;">
           			<!-- 상세내용 미리보기 -->sss
					<iframe src="editor/contents.jsp" id = "default_iframe" title="글쓰기영역" frameborder="0" style="width: 100%; height: 100%; display: block;">
						<!-- 상세 이미지 & 글내용 include 영역 -->
					 </iframe>
                <p id="status">이미지 선택안됨</p>
            </div>
            <div>
            <br>
            	<input type = "button" value = "확인" id = "check">
            	<input type = "button" value = "태그거르기 확인" id = "check_img">
            	<input type = "hidden" value = "" name = "p_contents" id = "p_contents">
            </div>
            
            <!-- 테스트용 holder -->
            <div id = "holder">
            
            </div>
            
            <!-- 테스트용 script -->
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
            	});
            </script>
        </div>
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
    
    
    
    <div class="btn-c">
        <a href="javascript:void(0);" id="btn_save" class="btn-h52-blue m100per">등록</a>
    </div>
    </form>	<!-- 전체 폼 종료 -->
</div>

<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

//상세 내용에 이미지 미리보기
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
 
//상세 내용에 이미지 미리보기
$("#imgInput").change(function(){
    readURL(this);
});

//컨텐츠 토글
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
	
$(document).ready(function(){
	/* $(document).click(function(){
		console.log($(this).prop('tagName'));
	}); */
	
		//매개변수로 옵션태그 찍어내줌
		function optionMaker(values){
			var option_tag = "";
			for(i = 0; i < values.length; i++){
				option_tag += "<option>"+values[i]+"</option>";
			}
			return option_tag;
		}
	
		//대분류 카테고리 변경 이벤트
		$('#p_cateNum').on('change', function(){
			var select = "<option value='0'>-- 2차 선택 --</option>";
			if($(this).val() == 1){
				select += optionMaker(['Carbohydrate', 'Protein', 'Fat', 'Fruit', 'Spice']);
				$('#p_midCate').html(select);
			}else if($(this).val() == 2){
				select += optionMaker(['Auido/Video', 'Game', 'Smart Watch', 'Drone', 'TV', 'Laptop/Computer HardWare']);
				 $('#p_midCate').html(select);
			}else if($(this).val() == 3){
				select += optionMaker(['Outer', 'TOP', 'Bottom', 'Shoes', 'Innerwear']);
				 $('#p_midCate').html(select);
			}
		});
	
	
		//중분류 카테고리 변경 이벤트
		$('.p_cate_ul').on('change', '#p_midCate', function(){
			var select = "<option value = '0'>-- 3차 선택 --</option>";
			
			$('#p_smallCate').show();
			var cateNum = $('#p_cateNum').val();
			
			if(cateNum == 1){
				if($(this).val() == 'Carbohydrate'){
					select += optionMaker(['쌀', '면', '제과']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Protein'){
					select += optionMaker(['소고기', '닭고기', '돼지고기', '유제품']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Fat'){
					select += optionMaker(['유류', '견과류', '인스턴트']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Fruit'){
					select += optionMaker(['과일']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Spice'){
					select += optionMaker(['화학 조미료', '천연 조미료', '기타 향신료']);
					$('#p_smallCate').html(select);
				}
			}
			
			if(cateNum == 2){
				if($(this).val() == 'Auido/Video'){
					select += optionMaker(['speaker', 'headphone,earphone', 'camera', 'beam projector']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Game'){
					select += optionMaker(['console', 'game package']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Smart Watch'){
					$('#p_smallCate').hide();
				}else if ($(this).val() == 'Drone'){
					$('#p_smallCate').hide();
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'TV'){
					select += optionMaker(['TV', 'home audio', 'home speaker', 'VR sets']);
					$('#p_smallCate').html(select);
				}else if($(this).val() == 'Laptop/Computer HardWare'){
					select += optionMaker(['laptop', 'mouse', 'tablet']);
					$('#p_smallCate').html(select);
				}
			}
			
			if(cateNum == 3){
				if ($(this).val() == 'Outer'){
					select += optionMaker(['코트 ', '자켓', '점퍼']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'TOP'){
					select += optionMaker(['니트/가디건', '셔츠', '티셔츠']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Bottom'){
					select += optionMaker(['청바지', '슬랙스', '면바지']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Shoes'){
					select += optionMaker(['구두', '단화', '런닝화']);
					$('#p_smallCate').html(select);
				}else if ($(this).val() == 'Innerwear'){
					select += optionMaker(['속옷', '내복']);
					$('#p_smallCate').html(select);
				}
			}
		});

    //	상품 등록 버튼
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



</script>