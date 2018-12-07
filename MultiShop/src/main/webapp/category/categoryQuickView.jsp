<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/contents.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
   integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
   crossorigin="anonymous">
<link href="../css/xzoom.css" rel="stylesheet">
   		<!-- 파라미터 -->
   		<input type = "hidden" id="session_email" value="${session_email}">
   		
		<%-- <div id="productView">
			<div id="productPopup">
				<div class="productPopupWrap">
					<div class="popLeft">
						<div class="popupSlide">
							<div class="popupSlide">
								<div class="mask">
								<img class="xzoom" id="detailMain_image" src="../image/product_ready.jpg" xoriginal="../image/product_ready.jpg">
                          	</div>
                       		<div class="pagerWrap xzoom-thumbs" id="gallery_01" style="text-align:center;">
                          		<!-- <a href="#" class="">
                             		<img style="width:100px; height:100px;" class="xzoom-gallery" id="detailSub1_image" src="../image/coat1.jpg" xpreview="../image/coat1.jpg">
                         		 </a>      
                         		 <a href="#" class="">
                             		<img style="width:100px; height:100px;" class="xzoom-gallery" id="detailSub2_image" src="../image/coat2.jpg">
                          		</a>
                          		<a href="#" class="">
                            		 <img style="width:100px; height:100px; " class="xzoom-gallery" id="detailSub3_image" src="../image/coat3.jpg">
                          		</a>
                          		<a href="#" class="">
                             		<img style="width:100px; height:100px; " class="xzoom-gallery" id="detailSub4_image" src="../image/coat4.jpg">
                          		</a> -->
                    			</div>
								</div>
							</div>
								<form id ="detail_form" method="post" action="orderPage.do">
							
						</div>
					</div>
					
					<div class="popRight">
						<span class="color_red fs24"></span> <span class="viewTitle">${productDTO.p_name}</span> <input
							type="hidden" id="webItemNm" name="webItemNm"
							value="00000 - 재우롱패딩">
						<!-- 						<p class="sub">실 제본으로 책장이 넘기기 쉬운 노트</p> -->
						<p class="sub"></p>
						<div class="aboutList">
							<ul class="aboutListTop">
								<li>
									<dl>
										<dt>판매가</dt>
										<dd id = "cost">￦&emsp;<fmt:formatNumber value="${productDTO.p_cost}" pattern="#,###" /> </dd>		<!-- 가격 -->
									</dl>
								</li>
								<input type="hidden" name="itemP" id="itemP" value="99000.0">
								
								<li>
									<dl>
										<dt>배송비</dt>
										<dd>
											2,500원 <span>(50,000원 이상 구매 시 무료)</span>
										</dd>
									</dl>
								</li>
							</ul>
							<ul class="aboutListBottom">
								<li>
									<dl>
										<dt>상품코드</dt>
										<dt id = "product_code">${productDTO.p_code }</dt>
										<input type="hidden" name="productCode" id="productCode" value="${p_code}">
									</dl>
								</li>
								<li>`
									<dl>
										<dt>제조국가</dt>
										<dd>${productDTO.p_origin }</dd>
									</dl>
								</li>
							<!-- cateNum 에 따라서 동적으로 다르게 생성해줘야함 --> 
							
							
							<!-- 
								
								1. 옵션 1, 옵션 2 변경 이벤트 : p_amount 최대값 갱신되어야함, 현재 상품코드 정보를 어떻게해서든 바꿔놔야함 
																								modal 의 hidden 값 줄것인지, 컨트롤러에서 옵션 select로 찾을것인지
																								
								2. 개수 변경 이벤트 : var sum_cost = $('#cost').val() * $('#amount').val() 이 최종가격에 $('#sum_cost').val(sum_cost) 되어야함 

								
								3. 품절된 상황 ${p_amount == 0} 일 때 선택은 가능하되?? 선택도 불가능하게?? 구매 버튼에서 막아야함
								
							 -->
					</ul>
						</div>
						<div class="productCon02"></div>
						<div class="conWrap">
							<div class="totalWrap">
								<span>총합계</span>
								<span id="totalPrice" class="totalPrice" ><fmt:formatNumber value="${productDTO.p_cost }" pattern="#,###" /> ￦</span>
							</div>
						</div>
						<div class="btnWrap">
							<!-- <a href="#none" id="favoriteBtn" class="btnFavorite bookmark"
								itemid="224000105259"> <img
								src="/images/contents/favoriteIcon.png" alt="">관심상품 등록
							</a> --> <a href="#none" id="basketBtn" class="btnBasket cart_add"
								data-toggle="modal" href="#basketModal"> <img
								src="/images/contents/basketIcon.png" alt="">장바구니 담기
							</a> <a href="#none" id="buyNowBtn" class="btnBuyNow order_now"
								itemsts="1" unitea=""> <img
								src="/images/contents/payIcon.png" alt="">바로구매
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<div id="basketModal" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">MultiShop&nbsp;:</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>장바구니로 이동하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" id="goBasket" class="btn btn-primary">예</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니오</button>
				</div>
			</div>
		</div>
	</div> --%>
	<div class="container">
         <div id="productView">
         <div id="productPopup" >
            <div class="productPopupWrap">
                  <div class="popLeft">
                     <div class="popupSlide">
                          <div class="mask">
                          	<img class="xzoom" id="detailMain_image" src="../image/product_ready.jpg" xoriginal="../image/product_ready.jpg">
                          </div>
                       <div class="pagerWrap xzoom-thumbs" id="gallery_01" style="text-align:center;">
                          <!-- <a href="#" class="">
                             <img style="width:100px; height:100px;" class="xzoom-gallery" id="detailSub1_image" src="../image/coat1.jpg" xpreview="../image/coat1.jpg">
                          </a>      
                          <a href="#" class="">
                             <img style="width:100px; height:100px;" class="xzoom-gallery" id="detailSub2_image" src="../image/coat2.jpg">
                          </a>
                          <a href="#" class="">
                             <img style="width:100px; height:100px; " class="xzoom-gallery" id="detailSub3_image" src="../image/coat3.jpg">
                          </a>
                          <a href="#" class="">
                             <img style="width:100px; height:100px; " class="xzoom-gallery" id="detailSub4_image" src="../image/coat4.jpg">
                          </a> -->
                       </div>
                  </div>
               </div>
            <form id ="detail_form" method="post" action="../detail_page/orderPage.do">
            <!--파라미터-->
            <input type = "hidden" name = "productCode" id = "p_code" value = "${productDTO.p_code}">
   			<input type = "hidden" name = "p_status" id = "p_status" value = "">
            <div class="popRight">
               <span class="viewTitle">${productDTO.p_name}</span>
               <input type="hidden" id="productName" name="productName" value="${product_DTO.p_name}">
<!--                   <p class="sub">실 제본으로 책장이 넘기기 쉬운 노트</p> -->
               <p class="sub"></p>
               <div class="aboutList">
               
                  <ul class="aboutListTop">
                     <li>
                        <dl>
                           <dt>판매가</dt>
                           <dd id="product_price">￦&emsp;<fmt:formatNumber value="${productDTO.p_cost }" pattern="#,###" /></dd>      <!-- 가격 -->
                        </dl>
                     </li>
                     <input type="hidden" name="product_price" id="product_price" value="99000.0">
                     <li>
                        <dl>
                           <dt>배송비</dt>
                           <dd>배송비무료</dd>
                        </dl>
                     </li>
                  </ul>
                  <ul class="aboutListBottom">
                     <li>
                        <dl>
                           <dt>상품코드</dt>
                           <dt id="product_code">${productDTO.p_code}</dt>
                           <%-- <input type="hidden" name="productCode" id="productCode" value="${p_code}"> --%>
                           <!-- <input type="hidden" name="p_midCate" id="p_midCate" value="">
                           <input type="hidden" name="p_smallCate" id="p_smallCate" value=""> -->
                           
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>제조국가</dt>
                           <dd>${productDTO.p_origin }</dd>
                        </dl>
                     </li>
                    <!--  <li>
                        <dl>
                           <dt>발송예정일</dt>
                           <dd>12월 25일 이내</dd>
                        </dl>
                     </li> -->
                     <!-- <li>
                        <dl>
                           <dt>색상</dt>
                           <dd>
                              <div class="detail_color">
                                 <select name="detail_colorSelect" id="detail_colorSelect" onchange="changeColor(this.value)">
                                    <option value="black" selected="selected">black</option>
                                    <option value="green">green</option>
                                    <option value="begie">begie</option>
                                    <option value="white">white</option>
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>사이즈</dt>
                           <dd>
                              <div class="detail_size">
                                 <select name="detail_sizeSelect" id="detail_sizeSelect">
                                    <option value="S" selected="selected">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option>
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>수량</dt>
                           <dd>
                              <div class="detail_amount">
                                 <select name="detail_amountSelect" id="detail_amountSelect">
                                    <option value="1" selected="selected">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li> -->
                  </ul>
                  </div>
                     <div class="productCon02">
                        
                     </div>
                     <div class="conWrap">
                        <div class="totalWrap">
                           <span>총합계</span>
                           <span id="totalPrice" class="totalPrice" ></span>
                        </div>
                     </div>
                     <div class="btnWrap row">
                        <div class = "col">
                        	<!-- <a href="#none" id="favoriteBtn" class="btnFavorite bookmark" itemid="224000105259">
                           	<i class="far fa-heart"></i>&emsp;관심상품 등록
                        	</a> -->
                        </div>
                        <div class = "col">
                        	<a href="#none" id="basketBtn" class="btnBasket cart_add" data-toggle="modal" href="#basketModal">
                           <i class="fas fa-shopping-cart"></i>&emsp;장바구니 담기
                        	</a>
                        </div>
                        <div class = "col">
                       		<a href="#none" id="buyNowBtn" class="btnBuyNow order_now" itemsts="1" unitea="">
                        	<i class="fas fa-credit-card"></i>&emsp;바로구매
                        	</a>
                        </div>
                     </div>
                  </div>
               </form>
               </div>
            </div>
         </div>
      </div>
      
      <div id="basketModal" class="modal" tabindex="-1" role="dialog">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">MultiShop&nbsp;: </h5>
                    <button type="button" id="basketModal_xBtn" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <p>장바구니로 이동하시겠습니까?</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="goBasket" class="btn btn-primary">예</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                  </div>
             </div>
         </div>
      </div>
	
	
	<!-- Jquery src 금지 -->
	<script type="text/javascript" src="../js/xzoom.js"></script>
	<script>
		$(document).ready(function(){
			var p_status = new Array();	//판매상태
			
			var img_param = "${productDTO.p_image}";
			var result = img_param.split('/');
			//alert(result[1]);
			//var img_tag = '<img class="xzoom" src ="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'">'; 
			$('.mask').children().attr('src',  '../upload/'+result[1]).attr('xoriginal', '../upload/'+result[1]);
			//$('.mask').html(img_tag);
			var img_length = result.length-1;	//이미지 개수
			var img_tag = '';
			$.each(result, function(index, items){
				if(index > 0 && items != undefined){
					img_tag += '<a href = "#" class = "sumImg"> <img class="xzoom-gallery" style = "width: 100px; height : 100px;" id = "" src = "../upload/'+items+'">';
				}
			});
			$('.pagerWrap').html(img_tag);
			
			
			
			/*
						EL로 받아오면 모두 string 타입으로 데려오기때문에 [ 지워줘야함 ]
			*/			
			
			
			// 1. select 레이아웃 생성
			// 2. option_DTO 생성
			// 3. 상위 select 하나만 중복제거해서 보여주고, 그 아래 하위들은 동적으로 생성되게 만들기
			
			
			
			var amount = [];//수량
			amount[0] = '수량';
			
			var option_name = '';			//
			var option_tag = '<option>옵션선택</option>';	//기본
			var class_index = '';			
			var option_result = '';			
			var option_DTO = [];
			var amount_index;
			//alert("${option_result_list}");		[[색상, 블랙, 블랙, 레드, 레드], [사이즈, 미디움, 라지, 미디움, 스몰]]  Type = String
			var total_size = 1;
			
			//옵션 없는경우 disabled 해제
			var p_code_list = new Array();
			
			var no_option_index = 0;
			<c:forEach items="${group_list}" var = "p_code" varStatus = "first_index">
				p_code_list[Number("${first_index.count}")] = "${p_code.p_code}";
				//alert("${p_code.p_code}" + "의 판매상태 : " + "${p_code.p_status}");
				p_status[Number("${first_index.count}")] = "${p_code.p_status}";
				no_option_index += 1;
			</c:forEach>
			p_code_list.splice(0, 1);
			
			
			p_status.splice(0, 1);
			//alert(p_status);
			
			
			<c:forEach items="${option_result_list}" var="item1" varStatus = "first_index">
				
				var option_list = "${item1}";
				//alert(option_list);		//index 0 : [색상, 블랙, 블랙, 레드, 레드], index 1 : [사이즈, 미디움, 라지, 미디움, 스몰]	Type = String //9:23
				
				
				var split_result = option_list.replace('[', '').replace(']', '').split(/[\s,]+/);		
				//inedx 0 : 색상,블랙,블랙,레드,레드	index 1 : 사이즈,미디움,라지,미디움,스몰	Type = 배열
				
				option_DTO["${first_index.count-1}"] = split_result;
				amount_index = "${first_index.count}";
				
				//중복제거
				var ovl_result = [];
				$.each(split_result, function(i, el){
					if($.inArray(el, ovl_result) === -1) ovl_result.push(el);
				});
				
				//중복제거 후 코드
				
				$.each(ovl_result, function(index, item){
					if(index == 0){
						option_name = '<dt>'+item+'</dt>';
					}else {
						option_tag += '<option value = "'+item+'" >'+item+'</option>';
					}
					if("${first_index.count}" != 1){
						option_tag = '';
					}
					class_index = index;		//클래스명 지을때 씀
				});
				
				option_result +=
				'<li>'+
					'<dl id = "option_'+class_index+'">'+
						option_name +
						'<dd>' +
							'<div>' +
								'<input type = "hidden" value = "${first_index.count}">'+
								'<select class = "option_select" name="option_select'+'${first_index.count}" id="option_select'+'${first_index.count}">'+
									option_tag +
								'</select>'+
							'</div>'+
						'</dd>'+
					'</dl>'+
				'</li>';
				option_tag = '<option>옵션선택</option>';
			</c:forEach>
			
			var option_length = (option_DTO.length); //옵션 개수			
			
			<c:forEach items = "${amount_list}" var = "amount" varStatus = "amount_index">
				total_size += 1;	//그룹 전체 수량 판단
				amount["${amount_index.count}"] = "${amount}"; 
			</c:forEach>
			//alert(amount);
			
			option_DTO[amount_index] = amount; 
			$.each(option_DTO, function(index, items){
				//alert('완성본 option_DTO['+index+'] : ' + option_DTO[index]);		////9:23
			});
			
			//[amount_index] 재고 인덱스
			//{색상, 블랙, 블랙, 레드, 레드},
			//{사이즈, 미디움, 라지, 미디움, 스몰},
			//{사이즈, 11, 22, 33 , 42}
			
			// {블랙, 미디움, 11},
			// {블랙, 미디움, 11},
			// {블랙, 미디움, 11},
			// {블랙, 미디움, 11},
			
			//첫 옵션제외 두번째 옵션부터 들어옴
			//alert(total_size);		//3	//9:23
			
			var result_DTO = new Array();
			change_arr(option_DTO);
			//p_code_list
			//DTO 행열 바꿔주는 함수
			function change_arr (arr){
				//alert(arr.length);	//9:23
				var j = 0;
				var k = 1;
				for(var i = 0; i < total_size-1; i++){
					var temp_arr = new Array();
					$.each(arr, function(index, items){
						temp_arr[index] = items[k];
					});
					k++;
					temp_arr[temp_arr.length] = p_code_list[j]; 
					result_DTO[i] = temp_arr;
					j++;
				}
			}
			//option_list_maker(result_DTO);
			 
			//하위 옵션 판단함수
			var user_selected = new Array();
			var i = 0;
			var amount_op;
			function option_list_maker (name, next_index){
				
				if(next_index == 1){	//첫옵션 선택시 초기화
					//user_selected = new Array();
					arr_clear(next_index);	
					$('#amount_input').val('');
					$('#amount_input').attr('disabled', 'true');
				}else{
					arr_clear(next_index);	
				}
				user_selected[i] = name;
				i++;
				var k = 0;
				var op = '';
				$.each(result_DTO, function(index, items){
					if(name == items[next_index-1]){
						if(items[next_index-1] == name){
							//alert(items[next_index-1] +"와 같은 이름 " + name +"사이즈는 " + items[next_index]);
							op += op_maker(items[next_index], op);
						}
						//alert('t : ' + items[next_index-1] + ' 같음');
						if(option_length == next_index){		// 마지막 옵션 선택했을 경우
							
							/*
							
								판단 필요한 거 : result_DTO[] 와  user_selected 에 비교해서 수량 빼내와야댐  
								
								
							*/
							
							var cnt = 1;
							//alert("포문돌기전 유저선택값 " + user_selected);			12/3 7:53
							//alert(user_selected.length);							12/3 7:53
							for(var j = 0; j < user_selected.length; j++){
								if(items[j] == user_selected[j]){
									//alert("같음!! " + items[j]);	
									cnt += 1;
								}else{
									//alert("다름!! " + items[j]);
									cnt = 1;
								}
							}
							if(cnt == user_selected.length+1){		//두 배열이 완전 똑같을경우
								amount_op = items[cnt-1];
								//alert("완전똑같음"+ items);			12/3 7:53
								$('#amount_input').val(1);			//과거 amount_op 엿음
								$('#amount_input').attr('max', amount_op);
								$('#amount_input').removeAttr('disabled');
								$('#p_code').val(result_DTO[index][result_DTO[index].length-1]);	//p_code 선택된거 넘겨줌
								//alert(index);
								//alert(p_status[index]);
								if(p_status[index] == 'Y'){
									$('#product_code').html($('#p_code').val()).css('color', 'black');
								}else{
									$('#product_code').html($('#p_code').val() + ' (품절)').css('color', 'red');
									$('#amount_input').prop('disabled', true);
									$('#amount_input').val('0');
									
									
								}
								
							}
							//alert(amount_op);	
							
							k = 0;
							//alert("선택해온 값 " + user_selected);		12/3 7:53
							//alert("개수..."+ amount);			12/3 7:53
						}
					}
				});
				//var c_option = '<option>'+
				$('#option_select'+(Number(next_index)+1)).html('<option>옵션선택</option>'+op);
				
			}
			

			
			//선택한값 삭제 함수
			function arr_clear(start_num){
				for(var z = (start_num-1); z < user_selected.length; z++){
					user_selected.splice(z, 1);
				}
				i = start_num-1;
				
			}
			
			function op_maker(op_value, op){
				if(op == '<option>'+op_value+'</option>'){
					return ''; 
				}else{
					return '<option>'+op_value+'</option>';
				}
			}
			
			$(document).on('change', '.option_select', function(){
				//alert($(this).val());			11:55
				//alert($(this).prev().val());	11:55
				//{블랙, 미디움, 11}
				reset($(this).prev().val());	
				option_list_maker($(this).val(), $(this).prev().val()); 
				
			});
				
			function reset(remove_num){
				var val = Number(remove_num)+2;
				for(var i = 0; i < option_length; i++){
					$('#option_select'+val).empty().append('<option>옵션선택</option>');
					val += 1;
				}
			} 
			
			
			
			
			//사이즈 생성
			var amount_input =
				'<li>'+
					'<dl id = "amount_list">'+
						'<dd>' +
							'<div>' +
								'<dt>수량</dt>' +
								'<dd style = "width : 12%;">' +
									'<input name = "amount_input" class = "form-control text-center" id = "amount_input" disabled="true" type="number" min="1" max="99"id="yourid">'+
								'</dd>' +
							'</div>'+
						'</dd>'+
					'</dl>'+
				'</li>';
			
			var total_price = Number("${productDTO.p_cost}");
				
			
			
			//수량 체인지 이벤트
			$(document).on('keypress','#amount_input', function () {
				
				if(Number($(this).val()) > amount_op){
					$('#amount_input').val(amount_op);
					price = total_price * $(this).val();
					$('#totalPrice').html('￦ ' + (price.toLocaleString()));
				}else if(Number($(this).val()) < 0){
					$('#amount_input').val(0);	
				};
			});
			
			$(document).on('blur','#amount_input', function(){
				
				if(Number($(this).val()) > amount_op){
					$('#amount_input').val(amount_op);
					price = total_price * $(this).val();
					$('#totalPrice').html('￦ ' + (price.toLocaleString()));
				}else if(Number($(this).val()) < 0 ){
					$('#amount_input').val(0);
					$('#totalPrice').html('￦ 0');
				};
			});
			
			$(document).on('change', '#amount_input', function(){
				
				var price = total_price * Number($(this).val());
				$('#totalPrice').html('￦ ' + (price.toLocaleString()));
				console.log(price);
			});
			
			
			
			/* $('#wr_2').on('keyup', function() {
			    this.value = this.value.replace(/\D/g, '');
			    if (this.value > 150) this.value = 150;
			}); */
			
			//옵션 생성 해서 집어넣음
			var temp = $('.aboutListBottom').html() + option_result + amount_input;
			$('.aboutListBottom').html(temp);
			
			//이미지 확대 기능
			$(".xzoom").xzoom();
			

			 //이미지 변경
			 $(document).on('click', '.xzoom-gallery', function(){
				var src = $(this).attr('src');
				$('.mask').children().attr('src', src).attr('xoriginal', src);
			 });
			
			 
			for(var i = 2; i < option_DTO.length; i++){
				$('#option_select'+i).html('<option>옵션선택</option>');
			}	
			
			
			if("${option_result_list}" == ''){
				amount_op = Number("${amount_list[0]}");
				$('#amount_input').attr('max', amount_op);
				$('#amount_input').removeAttr('disabled');
			}
			//품절체크
			if(no_option_index == 1 && p_status[0] == 'N'){
				$('#product_code').html($('#p_code').val() + ' (품절)').css('color', 'red');
				$('#amount_input').prop('disabled', true);
			}
			
			//alert(option_length);
			//구배버튼
			$('#buyNowBtn').click(function(){
					var session_email = $('#session_email').val();
					if(session_email.length<=0){
				    	  $('#detail_nonLoginModal').modal({backdrop: 'static', keyboard: false});
					    	  
				    	  //바로구매 비 로그인시
				    	  $('#detail_loginBtn').click(function(){
				    		  alert("비로그인구매임");
				    		  $('#non_loginCloseBtn').trigger('click');
				    		  $('#login_modal').modal({backdrop: 'static', keyboard: false});
						  });
				    	  
				    	  return;
				    }else if(session_email.length>0){
				    	
				    	var no_order = 0;
						for(var i = 1; i < option_length+1; i++){
							var temp = 'option_select'+i;
							if($('#'+temp).val() == '옵션선택'){
								no_order++;
							}
						}
						
				    	if(no_order != 0 ){
							alert("옵션을 선택해주세요");						
						}else if($('#amount_input').val() == '' || $('#amount_input').val() < 0){
							alert("수량을 선택해주세요");
						}else if($('#amount_input').val() == '0'){
							alert("품절된 상품입니다");
						}else{
							alert("p_code : " + $('#p_code').val() + "성공");
							$('#detail_form').submit();
						}
				    }
					
				});
			$('#totalPrice').html('￦ ' + (Number("${productDTO.p_cost}").toLocaleString()));
			
			$('#detail_nonLoginModal').on('show.bs.modal', function(event) {
				alert("비로그인 모달열림");
			    $('#quick_view').css('z-index', 1050);
			    $(this).css('display', 'block');
			    $(this).css('z-index', 9999);
			    //$(".modal-backdrop").removeClass('show').attr('class', 'fade').attr('class', 'in');
			});
			
		});
		
		
		
	</script>
	

			