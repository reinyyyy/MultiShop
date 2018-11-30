<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/contents.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
		<div id="productView">
			<div id="productPopup">
				<div class="productPopupWrap">
					<div class="popLeft">
						<div class="popupSlide">
							<div class="popupSlide">
								<div class="mask">
									<div style="" class="zoomWrapper">
										<img class="zoom_goods" src="../upload${productDTO.p_image}"
											data-zoom-image="" alt="" style="position: absolute;">
									</div>
								</div>
								<div class="pagerWrap" id="gallery_01"
									style="text-align: center;">
									<a href="#" class="sumImg"> <img
										style="width: 100px; height: 100px; border: 2px solid lightgray"
										id="" src="../image/coat1.jpg">
									</a> <a href="#" class="sumImg"> <img
										style="width: 100px; height: 100px;" id=""
										src="../image/coat2.jpg">
									</a> <a href="#" class="sumImg"> <img
										style="width: 100px; height: 100px;" id=""
										src="../image/coat3.jpg">
									</a> <a href="#" class="sumImg"> <img
										style="width: 100px; height: 100px;" id=""
										src="../image/coat4.jpg">
									</a>
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
								<li>
									<dl>
										<dt>발송예정일</dt>
										<dd>12월 25일 이내</dd>			<!-- 모르겠음 ㅜㅜ -->
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
	<script>
		$(document).ready(function(){
			var test = "${productDTO.p_image}";
			var result = test.split('/');
			
			alert(result[1]);
			var img_tag = '<img class="zoom_goods" src ="../upload/'+result[1]+'" data-zoom-image="" alt="" style="position:absolute;">'; 
			$('.zoomWrapper').html(img_tag);
			
			$.each(result, function(index, items){
				if(index > 1){
					img_tag += '<a href = "#" class = "sumImg"> <img style = "width: 100px; height : 100px;" id = "" src = "../upload/"'+items+'>';
				}
			});
			
			
			
			/*
						EL로 받아오면 모두 string 타입으로 데려오기때문에 [ 지워줘야함 ]
			*/			
			var option_name = '';
			var option_tag = '';
			var class_index = '';
			var option_result = '';
			<c:forEach items="${option_result_list}" var="item1">
				var option_list = "${item1}";
				var split_result = option_list.replace('[', '').replace(']', '').split(/[\s,]+/);
				
				$.each(split_result, function(index, item){
					if(index == 0){
						option_name = '<dt>'+item+'</dt>';
					}else {
						option_tag += '<option value = "'+item+'" >'+item+'</option>';
					}
					class_index = index;
				});
				
				option_result +=
				'<li>'+
					'<dl id = "option_'+class_index+'">'+
						option_name +
						'<dd>' +
							'<div>' +
								'<select name="detail_colorSelect" id="detail_colorSelect">'+
									option_tag +
								'</select>'+
							'</div>'+
						'</dd>'+
					'</dl>'+
				'</li>';
				option_tag = '';
				
			</c:forEach>
			var temp = $('.aboutListBottom').html() + option_result;
			$('.aboutListBottom').html(temp);
		});
	</script>
	
<!--
<script type="text/javascript"
	src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/detailPage.js"></script> -->
