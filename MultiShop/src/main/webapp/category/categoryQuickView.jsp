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
   
		<div id="productView">
			<div id="productPopup">
				<div class="productPopupWrap">
					<div class="popLeft">
						<div class="popupSlide">
							<div class="popupSlide">
								<div class="mask">
								<img class="xzoom" id="detailMain_image" src="../image/coat1.jpg" xoriginal="../image/coat1.jpg">
                          	</div>
                       		<div class="pagerWrap xzoom-thumbs" id="gallery_01" style="text-align:center;">
                          		<a href="#" class="">
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
                          		</a>
                    			</div>
								</div>
							</div>
						</div>
					</div>

					<div class="popRight">
						<span class="color_red fs24"></span> <span class="viewTitle">${clothesDTO.p_name}</span> <input
							type="hidden" id="webItemNm" name="webItemNm"
							value="00000 - 재우롱패딩">
						<!-- 						<p class="sub">실 제본으로 책장이 넘기기 쉬운 노트</p> -->
						<p class="sub"></p>
						<div class="aboutList">
							<ul class="aboutListTop">
								<li>
									<dl>
										<dt>판매가</dt>
										<dd id = "cost"><fmt:formatNumber value="${productDTO.p_cost }" pattern="#,###" /> ￦</dd>		<!-- 가격 -->
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
										<dt>${productDTO.p_code }</dt>
									</dl>
								</li>
								<li>
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
								<span>총합계</span> <span id="totalPrice" class="totalPrice"
									totalp="99000.0"><fmt:formatNumber value="${productDTO.p_cost }" pattern="#,###" /> ￦</span>
							</div>
						</div>
						<div class="btnWrap">
							<a href="#none" id="favoriteBtn" class="btnFavorite bookmark"
								itemid="224000105259"> <img
								src="/images/contents/favoriteIcon.png" alt="">관심상품 등록
							</a> <a href="#none" id="basketBtn" class="btnBasket cart_add"
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
	</div>
		
	
	<!-- Jquery src 금지 -->
	<script type="text/javascript" src="../js/xzoom.js"></script>
	<script>
		$(document).ready(function(){
			
			
			
			//option_DTO 제작
			var option_DTO_DB = [];
			
			
			var test = "${productDTO.p_image}";
			var result = test.split('/');
			
			//alert(result[1]);
			var img_tag = '<img class="xzoom" src ="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'">'; 
			$('.mask').find('img').attr('src', );
			$('.mask').html(img_tag);
			
			$.each(result, function(index, items){
				if(index > 1){
					img_tag += '<a href = "#" class = "sumImg"> <img style = "width: 100px; height : 100px;" id = "" src = "../upload/"'+items+'>';
				}
			});
			
			
			
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
/*	중복제거 전 코드 				
				$.each(split_result, function(index, item){
					if(index == 0){
						option_name = '<dt>'+item+'</dt>';
					}else {
						option_tag += '<option value = "'+item+'" >'+item+'</option>';
					}
					class_index = index;
				}); */
				
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
			//option_DTO[amount_index] = [11, 22, 33, 44];
			//alert(option_DTO);
			//alert(option_DTO.length);
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
			// {블랙, 라지, 22},
			// {블랙, 미디움, 11},
			// {블랙, 미디움, 11},
			
			//첫 옵션제외 두번째 옵션부터 들어옴
			//alert(total_size);		//3	//9:23
			
			var result_DTO = new Array();
			change_arr(option_DTO);
			//
			//DTO 행열 바꿔주는 함수
			function change_arr (arr){
				//alert(arr.length);	//9:23
				var k = 1;
				for(var i = 0; i < total_size-1; i++){
					var temp_arr = new Array();
					$.each(arr, function(index, items){
						temp_arr[index] = items[k];
					});
					k++;
					result_DTO[i] = temp_arr;
				}
			}
			/* alert(result_DTO[0]);
			alert(result_DTO[1]);
			alert(result_DTO[2]);
			alert(result_DTO[3]);
			 */
			
			//option_list_maker(result_DTO);
			 
			//하위 옵션 판단함수
			var user_selected = new Array();
			var i = 0;
			var amount_op;
			function option_list_maker (name, next_index){
				
				if(next_index == 1){	//첫옵션 선택시 초기화
					//user_selected = new Array();
					arr_clear(next_index);	
					$('#amount_input').val(0);
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
									alert("다름!! " + items[j]);
									cnt = 1;
								}
							}
							if(cnt == user_selected.length+1){		//두 배열이 완전 똑같을경우
								amount_op = items[cnt-1];
								//alert("완전똑같음"+ items);			12/3 7:53
								$('#amount_input').val(amount_op);								
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
							'<dt>수량</dt><input id = "amount_input" type="number" min="0" max="99"'+
									//'onkeydown="max_amount()"'+
   									///'onKeyUp="if(this.value>99){this.value="99";}else if(this.value<0){this.value="0";}"'+
								'id="yourid">'+
							'</div>'+
						'</dd>'+
					'</dl>'+
				'</li>';
			$(document).on('keyup','#amount_input', function () {
				alert("change");
				this.value = this.value.replace(/\D/g, '');
				if(this.value > test){
					this.value = test;	
				}
			});
			
			$('#wr_2').on('keyup', function() {

			    this.value = this.value.replace(/\D/g, '');

			    if (this.value > 150) this.value = 150;

			});
				
			var temp = $('.aboutListBottom').html() + option_result + amount_input;
			$('.aboutListBottom').html(temp);
			
			//이미지 확대 기능
			$(".xzoom").xzoom();
			

			 //이미지 변경
			$('#detailSub1_image').click(function(){
			   $('#detailMain_image').attr('xoriginal', '../image/coat1.jpg');
			   $('#detailMain_image').attr('src', '../image/coat1.jpg');
			});

			$('#detailSub2_image').click(function(){
			   $('#detailMain_image').attr('xoriginal', '../image/coat2.jpg');
			   $('#detailMain_image').attr('src', '../image/coat2.jpg');
			});

			$('#detailSub3_image').click(function(){
			   $('#detailMain_image').attr('xoriginal', '../image/coat3.jpg');
			   $('#detailMain_image').attr('src', '../image/coat3.jpg');
			});

			$('#detailSub4_image').click(function(){
			   $('#detailMain_image').attr('xoriginal', '../image/coat4.jpg');
			   $('#detailMain_image').attr('src', '../image/coat4.jpg');
			});
			//alert(option_DTO.length);
			//alert(option_DTO);
			function option_maker(){
				
			}
			
			
			for(var i = 2; i < option_DTO.length; i++){
				$('#option_select'+i).html('<option>옵션선택</option>');
			}	
			
		});
		
		
	</script>
	
