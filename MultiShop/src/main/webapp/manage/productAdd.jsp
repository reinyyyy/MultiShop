
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<style>
#new_product {
	position : fixed;
	width : 200px; 
	height : 100px; 
	background-color : black; 
	z-index : 9999; 
	left : 50%; 
	top : 30%
}
</style>
<script>
	$(document).ready(function(){
		$('#new_product').hide();
		<c:if test = "${new_product_ok == 1}">
			$('#new_product').show();	
			setTimeout(function(){
				$('#new_product').hide();
			}, 1000);
		</c:if>
		
	});
</script>
<div id = "new_product" >
	<h1> 상품이 등록되었습니다 </h1>
</div>
    
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
        <div id = "p_status_div"></div>
    </div><!-- .sect-cont -->
    <!-- ======================= 판매 상태 종료 ======================= -->
    
    
    
    <!-- ======================= 판매 아이템 시작 ======================= -->
    <div class="sect-hd">
        <h3>카테고리</h3>
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
                                        <div id = "p_cateNum_div"></div>
                                    </li>
                                    <li>
                                        <select name="p_midCate" data-origin="0" value="0" id = "p_midCate" style="width:285px">
                                            <option value="0">-- 2차 선택 --</option>	<!-- 동적 처리 -->
                                        </select>
                                        <div id = "p_midCate_div"></div>
                                    </li>
                                    <li>
                                        <select name="p_smallCate" data-origin="0" value="0" id = "p_smallCate" style="width:285px">
                                            <option value="0">-- 3차 선택 --</option>	<!-- 동적 처리 -->
                                        </select>
                                        <div id = "p_smallCate_div"></div>
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
                        <input class = "need_check_input" type="text" id = "p_name"name="p_name" value="" class="w70per" maxlength = "40">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/40)</span>
                        <div id = "p_name_div"></div>
                    </td>
                </tr>
                <tr>
                    <th><strong>제조사 <span class="fc-red">*</span></strong></th>
                    <td>
                        <input class = "need_check_input"  type="text" id = "p_maker" name="p_maker" value="" class="w70per" maxlength = "40">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/40)</span>
                        <div id = "p_maker_div"></div>
                    </td>
                </tr>
                <tr>
                    <th><strong>원산지 <span class="fc-red">*</span></strong></th>
                    <td>
                        <input class = "need_check_input"  type="text" id = "p_origin" name="p_origin" value="" class="w70per" maxlength = "40">
                        <span class="mt-5 fc-gray fs-15">(<span id="prd_byte">0</span>/40)</span>
                        <div id = "p_origin_div"></div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- ======================= 상품명 종료 ======================= -->
    
    
    
    <!-- ======================= 가격 시작 ======================= -->
    <%-- <div class="sect-hd">
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
                        <td><div class="base pr-20"><span class="fc-red">\</span> 
                        <input type="text"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" style="width:300px; IME-MODE : disabled;" id = "p_cost" name="p_cost" value="0" class="w20per num_only" placeholder = ",제외 숫자만 입력"></div>
	                        <div id = "p_cost_div"></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div> --%>
    <!-- ======================= 가격 종료 ======================= -->
    
    
    
    <!-- ======================= 상품 이미지 시작 ======================= -->
    <div class="sect-hd">
        <h3>상품 대표이미지</h3>
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
                            <span class="fc-gray fs-15">(<span class="main_img_cnt">0</span>/5)</span>
                            <div id = "img_div"></div>
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
    
    
    
	<!-- ======================= 옵션 시작 ======================= -->
	<div class="sect-hd" style="">
        <h3>옵션/재고</h3>
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
					<tr>
						<th>옵션 선택</th>
						<td>
							<label><input type="radio"  class = "option_check" name = "option_check"value="Y" checked="checked" ><span>사용함</span></label>
							<label><input type="radio" class = "option_check" name = "option_check"value="N"><span>사용안함</span></label>
						</td>
					</tr>
					<tr id = "option_no_tr">
					 	<!-- <th>재고<span class="fc-red">*</span></th>
					 	<td>
							<input class = "need_check_input only_number" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "no_p_amount" name="p_amount[]" placeholder="재고 " value="" maxlength = "7">
							<div id = "no_p_amount_div"></div>
						</td>
						<th>가격<span class="fc-red">*</span></th>
						<td>	가격
							<input class = "need_check_input num_only" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "p_cost_list" name="p_cost[]_list" placeholder="가격 " value="" maxlength = "7">
							<div id = "ok_p_cost_div"></div>
						</td> -->
						<th>
							재고<span class="fc-red">*</span>
						</th>
						<td>
							<input class = "need_check_input only_number" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "no_p_amount" name="p_amount[]" placeholder="재고 " value="" maxlength = "7">
							<div id = "no_p_amount_div"></div>
						</td>
						<th>
							가격<span class="fc-red">*</span>
						</th>
						<td>	<!-- 가격 -->
							<input class = "need_check_input num_only" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "no_p_cost_list" name="p_cost" placeholder="가격 " value="" maxlength = "7">
							<div id = "no_p_cost_div"></div>
						</td>
									
                   </tr>
					<tr id = "option_ok_tr" class="opt-select js-optResetTrue bg-yellow is-pc-row" is-opt="false" style="display: table-row;">
						<td colspan="2">
							<div class="tbl-list" id="mix_option">
								<!-- 옵션 설정 테이블 시작 -->
								<table id="add_mix_option">
								<colgroup>
									<col style = "width : 35%">
									<col style = "width : 35%">
									<col><!-- 없으면 테이블 레이아웃깨짐 -->
									<col><!-- 없으면 테이블 레이아웃깨짐 -->
								</colgroup>
								<thead>
								<tr>
									<th>
										옵션명<span class="fc-red">*</span>
									</th>
									<th>
										옵션값<span class="fc-red">*</span>
									</th>
									<th>
										재고<span class="fc-red">*</span>
									</th>
									<th>
										가격<span class="fc-red">*</span>
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
										<input class = "need_check_input"  type="text" id = "p_option1" name="p_option1[]" placeholder="옵션명을 입력하세요. (예시: 색상/사이즈)" value="" >
										<div id = "p_option1_div"></div>
										<!-- 옵션1 , 를 기준으로 나눌거임 -->
									</td>
									<td>
										<input class = "need_check_input"  type="text" id = "p_option2" name="p_option2[]" placeholder="옵션값을 입력하세요. (예시: red/m)" value="">
										<div id = "p_option2_div"></div>
									</td>
									<td>
										<input class = "need_check_input num_only" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "p_amount" name="p_amount[]_list" placeholder="재고 " value="" maxlength = "7">
										<div id = "ok_p_amount_div"></div>
									</td>
									<td>	<!-- 가격 -->
										<input class = "need_check_input num_only" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1').replace(/(^0+)/, '');" type="text" id = "p_cost_list" name="p_cost[]_list" placeholder="가격 " value="" maxlength = "7">
										<div id = "ok_p_cost_div"></div>
									</td>
									<td style="width : 10%">
										<a href="javascript:void(0)" class="btn-del-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px"></a>
									</td>
								</tr>
								 
							</tbody>
							
						</table>
								<!--  옵션 설정 테이블 종료 -->
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div><!-- .pc-switch -->
	</div><!-- .sect-cont -->

    <!-- ======================= 옵션 종료 ======================= -->
    
    
    
    <!-- 						 상세 이미지 시작                       -->
    <div class="sect-hd">
        <h3>상품 상세이미지</h3>
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
                            <span class="fc-gray fs-15">(<span class="detail_img_cnt">0</span>/5)</span>
                            <div id = "img_detail_div"></div>
                        </th>
                        <td>
							<div id="imgUpload" style="margin-top: 5px;">
								<div class="swiper-container thumbs">
									<ul class="swiper-wrapper">
										<li class="add swiper-slide prd-img-resizing">
											<p>
												<span class="btn-prd-upload">
													<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
													<input type="file" class = "img_detail" name="img_detail[]" id = "1">
												</span>
											</p>
										</li>
										<li class="add swiper-slide prd-img-resizing">
											<p>
												<span class="btn-prd-upload">
													<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
													<input type="file" class = "img_detail" name="img_detail[]" id = "2">
												</span>
											</p>
										</li>
										<li class="add swiper-slide prd-img-resizing">
											<p>
												<span class="btn-prd-upload">
													<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
													<input type="file" class = "img_detail" name="img_detail[]" id = "3">
												</span>
											</p>
										</li>
										<li class="add swiper-slide prd-img-resizing">
											<p>
												<span class="btn-prd-upload">
													<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
													<input type="file" class = "img_detail" name="img_detail[]" id = "4">
												</span>
											</p>
										</li>
										<li class="add swiper-slide prd-img-resizing">
											<p>
												<span class="btn-prd-upload">
													<img src="https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif" alt="image"> 
													<input type="file" class = "img_detail" name="img_detail[]" id = "5">
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
        
        <div id="pagekinArea" class="prdDtail-pagekin prd-write">
        
           <div id="pagekinCreateArea" style="width: 100%; height: 400px;">
           			<!-- 상세내용 미리보기 -->
					<iframe src="editor/contents.jsp" id = "default_iframe" title="글쓰기영역" frameborder="0" style="width: 100%; height: 100%; display: block;">
						<!-- 상세 이미지 & 글내용 include 영역 -->
					 </iframe>
            </div>
            <div>
            <br>
            	<!-- <input type = "button" value = "확인" id = "check">
            	<input type = "button" value = "태그거르기 확인" id = "check_img"> -->
            	<input type = "hidden" value = "" name = "p_contents" id = "p_contents">
            </div>
            
            <!-- 테스트용 holder -->
            <div id = "holder">
            
            </div>
            
        </div>
    </div><!-- .sect-cont -->
    <!-- ======================= 상세설명 종료 ======================= -->
    
    
    <div class="btn-c">
        <a href="javascript:void(0);" id="btn_save" class="btn-h52-blue m100per">등록</a>
    </div>
    </form>	<!-- 전체 폼 종료 -->
</div>

<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
//상세 내용에 이미지 미리보기 구현함수
function readURL(input, index) {
	 
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
            //$('#image_section').attr('src', e.target.result);
            //$('#default_iframe').contents().find('#contents_div').html().append($('#image_section'));
            var img = "<img id = "+index+" src = \""+e.target.result+"\" /><br>";
            $('#default_iframe').contents().find('#contents_div').append(img);
        }
 
        reader.readAsDataURL(input.files[0]);
    }
}

//input file 이미지 미리보기 
function readURL_input(input, tag) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            tag.prev().attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 
//상세 내용에 이미지 미리보기 이벤트
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
//파일 사이즈 체크
function CheckUploadFileSize(objFile, file){
	 var nMaxSize = 10 * 1024 * 1024; // 4 MB
	 var nFileSize = objFile.files[0].size;
	//alert(nFileSize);
	
	 if (nFileSize > nMaxSize) {
		 alert("10MB보다 큽니다" + nFileSize + " byte");
		 return false;
	 }else{
		return true; 
	 }
 }
function CheckuploadFileExt(objFile){
	var strFilePath = objFile.value;
	
	// 정규식
	var IMG_FORMAT = "\.(bmp|gif|jpg|jpeg|png)$";
	
 	if((new RegExp(IMG_FORMAT, "i")).test(strFilePath)){
 		return true;
 	}else{
 		alert("이미지파일만 업로드해주세요");
 		return false;	
 	}
}
function getTextLength(str) {
	var len = 0;
	for (var i = 0; i < str.length; i++) {
		//if (escape(str.charAt(i)).length == 6) {
			//len++;
		//}
		len++;
	}
	return len;
}
function bytesHandler(obj, tag){
	var text = $(obj).val();
	tag.next().find('span').text(getTextLength(text));
}
	
$(document).ready(function(){
	
	$('#option_no_tr').hide();
	//옵션 사용여부
	$('input:radio[name=option_check]').click(function(){
		if($(this).val() == 'Y'){
			$('#option_ok_tr').show();
			$('#option_no_tr').hide();
		}
		if($(this).val() == 'N'){
			$('#option_ok_tr').hide();
			$('#option_no_tr').show();
		}
		
	});
	
		$('#add_mix_option').on('click', '.btn-add-opt', function(){
		var appendTo_option = 
		'<tr>' +
		'<td><input type = "text" name = "p_option1[]" placeholder = "옵션명을 입력하세요. (예시: 색상/사이즈)"></td>' +
		'<td><input type = "text" name = "p_option2[]" placeholder = "옵션값을 입력하세요. (예시: red/m)"></td>' +
		'<td><input type = "text" name = "p_amount[]_list" placeholder = "재고 " value = ""></td>' + 
		'<td><input class = "need_check_input num_only" oninput="this.value = this.value.replace(/[^0-9.]/g, \'\').replace(/(\\..*)\./g, \'$1\').replace(/(^0+)/, \'\');" type="text" id = "p_cost_list" name="p_cost[]_list" placeholder="가격 " value="" maxlength = "7"></td>'+
		'<td style = "width : 10%"><a href="javascript:void(0)" class="btn-del-opt"><img src="//image.makeshop.co.kr/mysoho/assets/admin/images/btn/h43_delete.png" alt="삭제" style="width:30px"></a></td>' +
		'</tr>'
		;
		//var appendTo_html = $('#p_option_tbody').html() + appendTo_option;
		//$('#p_option_tbody').html(appendTo_html);
		$('#p_option_tbody').append(appendTo_option);
	})//기존 정보 사라짐
	$('#add_mix_option').on('click', '.btn-del-opt', function(){
		if($('#p_option_tbody tr').length == 1){	//옵션 최소한개는 유지
			return;
		}
		$(this).parent().parent().remove();
	});
		
		
	$('#check_img').click(function(){
		var data = 	$('#default_iframe').contents().find('#contents_div').html();
		var result = data.replace(/<div>/gi, '').replace(/<\/div>/gi, '\n');
		var result2 = result.replace(/<(\/img|img)([^>]*)>/gi, '');	//두번째인자에 '<img>' 주면 태그 위치남겨줌
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

		//키입력이벤트		상품명, 제조사, 원산지
		$(document).on('keydown keyup', '.need_check_input', function(){
	        if ($(this).val().length > $(this).attr('maxlength')) {
				 $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
			}
			bytesHandler(this, $(this));
		});
		
		//상세이미지 업로드
		$('input[name="img_detail[]"]').change(function(){
			var id = $(this).attr('id');
			var cnt = 0;
			$.each($('input[name="img_detail[]"]'), function(index, items){
				if(items.value != ''){
					cnt++;
				}
			});
			$('.detail_img_cnt').html(cnt);
			
			if($(this)[0].files.length < 1){
				$(this).prev().attr('src', 'https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif');
				//alert($('#default_iframe').contents().find('#contents_div').find('#'+id).remove());
				$('#default_iframe').contents().find('#contents_div').find('#'+id).next('br').remove();
				$('#default_iframe').contents().find('#contents_div').find('#'+id).remove();
				return;
			}
			if(!CheckUploadFileSize(this, $(this)) || !CheckuploadFileExt(this)){
				return;
			}
			
			readURL(this, id);
			readURL_input(this, $(this));
		});
		//대표이미지 업로드
		$('input[name="img[]"]').change(function(){
			var cnt = 0;
			$.each($('input[name="img[]"]'), function(index, items){
				if(items.value != ''){
					cnt++;
				}
			});
			$('.main_img_cnt').html(cnt);
			if($(this)[0].files.length < 1){
				$(this).prev().attr('src', 'https://image.makeshop.co.kr/mysoho/assets/admin/images/btn/h32_plus.gif');
				return;
			}
			if(!CheckUploadFileSize(this, $(this)) || !CheckuploadFileExt(this)){
				return;
			}
			//alert($('input[name="img[]"]:value').length);
			
			readURL_input(this, $(this));
		});
		
		
	
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
			$('#p_smallCate').html("<option value = '0'>-- 3차 선택 --</option>");
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
//					select += optionMaker(['종합 비타민', '남성용', '여성용', '과일']);
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
    	$('#p_cateNum_div').empty();
    	$('#p_midCate_div').empty();
    	$('#p_smallCate_div').empty();
    	$('#p_name_div').empty();
    	$('#p_maker_div').empty();
    	$('#p_origin_div').empty();
    	//$('#p_cost_div').empty();
    	$('#img_div').empty();
    	$('#p_option1_div').empty();
    	$('#p_option2_div').empty();
    	$('#ok_p_amount_div').empty();
    	$('#no_p_amount_div').empty();
    	$('#no_p_cost_div').empty();
    	$('#img_detail_div').empty();
    	
    	
    	
    	//컨텐츠 hidden값에 넣어줘야함
    	var all_contents = 	$('#default_iframe').contents().find('#contents_div').html();
		var div_tag_remove = all_contents.replace(/<div>/gi, '').replace(/<\/div>/gi, '\n').replace(/<br>/gi, '\n');
		var contents_param = div_tag_remove.replace(/<(\/img|img)([^>]*)>/gi, '');	//'<img>'두번째인자 지워주면 됨
//		alert(result2); //이미지태그 개수 및 위치 표시가능
		
		$('#p_contents').val(contents_param);
		
	//	alert($('#p_contents').val());
		//여기서 유효성검사 해줘야함
		if($('#p_cateNum').val() == 0){
			$('#p_cateNum_div').text('대분류를 선택하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_midCate').val() == 0){
			$('#p_midCate_div').text('중분류를 선택하세요').css('color', 'red').css('font-size', '9pt');			
		}else if($('#p_smallCate').val() == 0 && $('#p_midCate').val() != 'Drone' && $('#p_midCate').val() != 'Smart Watch'){
			$('#p_smallCate_div').text('소분류를 선택하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_name').val() == ''){
			$('#p_name_div').text('상품명을 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_maker').val() == ''){
			$('#p_maker_div').text('제조사를 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_origin').val() == ''){
			$('#p_origin_div').text('원산지를 입력하세요').css('color', 'red').css('font-size', '9pt');
		}/* else if($('#p_cost').val() == 0 || $('p_cost').val() < 0){
			$('#p_cost_div').text('판매가격을 입력하세요').css('color', 'red').css('font-size', '9pt');
		}*/else if($('.main_img_cnt').text() == 0){															//맨앞 하나만 체크해줌
			$('#img_div').text('대표이미지 선택하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_option1').val() == '' && $('input:radio[name=option_check]:checked').val() == 'Y'){
			$('#p_option1_div').text('옵션명을 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_option2').val() == '' && $('input:radio[name=option_check]:checked').val() == 'Y'){
			$('#p_option2_div').text('옵션값을 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#p_amount').val() == '' && $('input:radio[name=option_check]:checked').val() == 'Y'){
			$('#ok_p_amount_div').text('재고를 입력하세요').css('color', 'red').css('font-size', '9pt');	
		}else if($('#no_p_amount').val() == '' && $('input:radio[name=option_check]:checked').val() == 'N'){
			$('#no_p_amount_div').text('재고를 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('#no_p_cost_list').val() == '' && $('input:radio[name=option_check]:checked').val() == 'N'){
			$('#no_p_cost_div').text('가격을 입력하세요').css('color', 'red').css('font-size', '9pt');
		}else if($('.detail_img_cnt').text() == 0){															//맨앞 하나만 체크해줌
			$('#img_detail_div').text('상세이미지를 선택하세요').css('color', 'red').css('font-size', '9pt');
		}else{
			var upload = confirm("상품을 등록하시겠습니까?");
			if(upload){
	    		$('#product_form').submit();
			}
		}
    });
    
    //재고, 판매가격 이벤트 숫자만허용
     

})

</script>
