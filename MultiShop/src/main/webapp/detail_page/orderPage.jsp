<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Checkout form</title>
   
<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- <link href="../css/order.css" rel="stylesheet">
<link href="../css/detail_jw.css" rel="stylesheet"> -->
<link href="../css/common.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link href="form-validation.css" rel="stylesheet"> -->
<style type="text/css">
.order_checkBox{
   position: absolute ;
   top: 5px;
   left: 5px;
}
.order_radio{
   position: absolute ;
   bottom: 10px;
   left: 5px;
}

#section_location{
	position : unset;
}

.orderPageJwBtn{
	display: inline-block;
    width: 45px;
    height: 30px;
    font-size: 12px;
    border-radius: 5px;
    background-color: #d9d2d2;
    border: 1px solid #868e96;
    cursor: pointer;
}

</style>
</head>
<body class="bg-light">
	
   <div class="container">
      <div class="py-5 text-center">
         <img class="d-block mx-auto mb-4 mt-4" src="../image/jaewoo.jpg" alt="" width="72" height="72"/>
         <h2>Check out</h2>
         <p class="lead">깰껌</p>
      </div>
      <form id="orderPageForm" name="orderPageForm" class="needs-validation" method="post" action="orderSuccess.do">      <!-- novalidate은 유효성검사를 하지않겠다는 것 -->
      <input type="hidden" id="session_email" value="${session_email }">
      <input type="hidden" id="cartCount" name="cartCount" value="${cartCount}">
      <div class="row mb30">
         <div class="col-md-4 order-md-2 mb-4" id="basketDiv">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
               <span class="text-muted">My order</span>
               <span class="badge badge-secondary badge-pill">3</span>
            </h4>
			<ul class="list-group mb-3">
			<!-- 장바구니에서 결재한 화면 -->
            <c:if test="${cartMap.count!=0 }">
            <c:set var="k" value="0"    />
            <c:forEach var="productRow" items="${cartMap.list}" varStatus="i">
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">상품코드 / 제품명</h6>
                         <small class="text-muted" id="productCodeAndName" >${productRow.p_code} &nbsp; / &nbsp; ${productRow.p_name} </small>
                         <input type="hidden" id="firstProductCodeHiddenVal" name="p_code" value="${productRow.p_code}">
                         <input type="hidden" id="firstProductNameHiddenVal" name="p_name" value="${productRow.p_name}">
                         <input type="hidden" class="p_costHid" id="firstProductCostHiddenVal" name="p_cost" value="${productRow.p_cost}">
                     </div>
                     <span class="text-muted" id="firstProductPrice"></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">선택옵션1  / 옵션2 / 수량</h6>
                         <small class="text-muted" id="allOptionAndAmount">${productRow.p_option1}&nbsp;/&nbsp;${productRow.p_option2}&nbsp;/&nbsp;${productRow.p_amount}</small>
                         <!-- <input type="hidden" id="p_option1Val" name="p_option1" value=""> -->
                         <!-- <input type="hidden" id="p_optionVal" name="p_option" value=""> -->
                         <input type="hidden" id="firstProductAmountHiddenVal" class="p_amountHid" name="p_amount" value="${productRow.p_amount}">
                       </div>
                       <span class="text-muted"></span>
                  </li>
                  
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">제품가격</h6>
                         <small class="text-muted" id="pdtCost">${productRow.p_cost}</small>
                         <input type="hidden" id="" value="">
                       </div>
                       <!-- <span class="text-muted" id="secondProductPrice"></span> -->
                  </li>
                  <c:set var="k" value="${k+ productRow.p_cost*productRow.p_amount}"/>
                  
           	</c:forEach>
           	</c:if>
           	<!-- 장바구니 결재가 아니면 -->
           	<c:if test="${cartMap.count==0||nomalMap.count==1}">
           		<li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">상품코드 / 제품명</h6>
                         <small class="text-muted" id="productCodeAndName" >${nomalMap.p_code}&nbsp;/&nbsp;${nomalMap.p_name}</small>
                         <input type="hidden" id="firstProductCodeHiddenVal" name="p_code" value="${nomalMap.p_code}">
                         <input type="hidden" id="firstProductNameHiddenVal" name="p_name" value="${nomalMap.p_name}">
                         <input type="hidden" id="firstProductCostHiddenVal" class="p_costHid" name="p_cost" value="${nomalMap.p_cost}">
                     </div>
                     <span class="text-muted" id="firstProductPrice"></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">선택옵션1  / 옵션2 / 수량</h6>
                         <small class="text-muted" id="allOptionAndAmount">${nomalMap.p_option1}&nbsp;/&nbsp;${nomalMap.p_option2}&nbsp;/&nbsp;${nomalMap.p_amount}</small>
                         <!-- <input type="hidden" id="p_option1Val" name="p_option1" value=""> -->
                         <input type="hidden" id="p_optionVal" name="p_option" value="">
                         <input type="hidden" id="firstProductAmountHiddenVal" class="p_amountHid" name="p_amount" value="${nomalMap.p_amount}">
                       </div>
                       <span class="text-muted"></span>
                  </li>
                  
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">제품가격</h6>
                         <small class="text-muted" id="pdtCost">${nomalMap.p_cost}</small>
                         <input type="hidden" id="pdtCost" value="${nomalMap.p_cost}">
                       </div>
                      <!--  <span class="text-muted" id="secondProductPrice"></span> -->
                  </li>
                  <c:set var="k" value="${k+ nomalMap.p_cost*nomalMap.p_amount}"/>
           	</c:if>
           	
                  <li class="list-group-item d-flex justify-content-between bg-light">
                       <div class="text-success">
                         <h6 class="my-0">마일리지 적립</h6>
                         <small>예상 적립 금액</small>
                       </div>
                       <span class="text-success" id="guessMileage"></span>
                       <input type="hidden" id="m_point" name="m_point" value="">
                  </li>
                  <li class="list-group-item d-flex justify-content-between bg-light">
                       <div class="text-success">
                         <h6 class="my-0">보유 마일리지 현황</h6>
                         <small style="color:black">보유금 전액만 사용가능</small>
                       </div>
                       <c:if test="${nomalMap.count==1}">
                       <span class="text-success" id="myMileage">${nomalMap.myMileage}</span>
                       <input type="hidden" id="myMileageHid" name="myMileageHid" value="${nomalMap.myMileage}">
                       </c:if>
                       <c:if test="${cartMap.count!=0 }">
                       <span class="text-success" id="myMileage">${m_point}</span>
                       <input type="hidden" id="myMileageHid" name="myMileageHid" value="${m_point}">
                       </c:if>
                       <input type="hidden" id="useMileage" name="useMileage" value="0">
                       <div class="mt05">
                       		<input type="button" class="orderPageJwBtn" id="useM_pointBtn" value="사용">
                       		<input type="button" class="orderPageJwBtn" id="resetM_pointBtn" value="취소">
                       </div>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">쿠폰</h6>
                         <!-- 바로결재시 쿠폰확인 -->
                         <c:if test="${nomalMap.count==1}">
	                         <c:if test="${coupon == null}">
	                         	<select id="couponSelect">
	                         	<option>선택하기</option>
	                         </select>
	                         </c:if>
	                         <c:if test="${coupon != null}">
		                         <select id="couponSelect">
		                         	<option value="0">선택하기</option>
		                         	<option value="1">10% 할인권</option>
		                         </select>
	                         </c:if>
                         </c:if>
                         <!-- 장바구니에서 결재시 쿠폰확인 -->
                         <!-- ${cartMap.count==0||nomalMap.count==1}"> -->
                         <c:if test="${cartMap.count!=0 && nomalMap.count!=1}">
	                         <c:if test="${coupon == null}">
	                         	<select id="couponSelect">
	                         	<option>선택하기</option>
	                         </select>
	                         </c:if>
	                         <c:if test="${coupon != null}">
		                         <select id="couponSelect">
		                         	<option value="0">선택하기</option>
		                         	<option value="1">10% 할인권</option>
		                         </select>
	                         </c:if>
                         </c:if>
                      </div>
                      <div class="mt05">
                      	<input type ="button" class="orderPageJwBtn" value="사용" id="use_Coupon">
                      	<input type ="reset" class="orderPageJwBtn" value="취소" id="reset_Coupon">
                      </div>
                  </li>
                  <li class="list-group-item d-flex justify-content-between">
                       <div class="text-success">
                         <h6 class="my-0" style="color:magenta">최종 결재 금액</h6>
                         <small style="color:black" id="ifUseMileage"></small>
                       </div>
                       <!-- <span>최종 결재 금액</span> -->
                       <strong id="order_totalPrice">${k}</strong>
                       <input type="hidden" id="lastTotalPrice" name="" value="">
                  </li>
            </ul>
            <!-- </form> -->
              </div>
              <div class="col-md-8 order-md-1">
                <h4 class="mb-3">정보 입력</h4>
                
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <label for="firstName">이름</label>
                      <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                      <div class="firstNameDiv" id="firstNameDiv">
                         
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <label for="lastName">성</label>
                      <input type="text" class="form-control" id="lastName" placeholder="성" value="" required>
                      <div class="lastNameDiv" id="lastNameDiv">
                           
                      </div>
                    </div>
               	</div>
               	<div class="row">
                  	<div class="col-md-12 mb-3">
                  		<label for="username">성과 이름을 입력</label>
                      	<div class="input-group-prepend">
                           <span class="input-group-text"></span>
                        </div>
                      	<input type="text" class="form-control" id="userName" placeholder="이름" required>
                      	<div class="userNameDiv" id="userNameDiv" style="width: 100%;">
                      
                      	</div>
                  	</div>
               	</div>

               	<div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Optional)</span></label>
                    <input type="email" class="form-control" id="email" placeholder="honggildong@example.com">
                    <div class="emailDiv" id="emailDiv">
                    </div>
               	</div>
                
                <div class="input-group" style="margin-bottom: 10px">
					<span class="input-group-addon"><i class="fas fa-map-marked-alt -o fa-fw"></i></span>
					<input type="text" class="form-control" id="join_modal_postcode" name="m_zipcode" placeholder="우편번호" required="required" value="${memberDTO.m_zipcode}" readonly>
					<input type="button" class="btn btn-dark" id="join_modal_postcodeBtn" value="우편번호찾기" onclick="execDaumPostcode()">
				</div>
				<div>
				</div>
				<div class="input-group" style="margin-bottom: 10px">
					<input type="text" class="form-control" id="join_modal_roadAddress" name="m_roadAddress" placeholder="도로명주소" value="${memberDTO.m_roadAddress}" readonly>
					<input type="text" class="form-control" id="join_modal_jibunAddress" name="m_jibunAddress" placeholder="상세 주소" value="${memberDTO.m_jibunAddress}">
				</div>
                  
                <hr class="mb-4">
                <h4 class="mb-3">카드 선택</h4>

                <div class="d-block my-3">
                     <div class="custom-control custom-radio">
                       <input id="credit" name="order_radioBtn" type="radio" class="order_radio" value="credit" checked required>
                       <label class="custom-control-label" for="credit">신용 or 체크카드</label>
                     </div>
                     
                     <div class="custom-control custom-radio">
                       <input id="paypal" name="order_radioBtn" type="radio" class="order_radio" value="paypal" required>
                       <label class="custom-control-label" for="paypal">PayPal</label>
                   </div>
                </div>
                  
                <div class="row">
                     <div class="col-md-6 mb-3">
                       <label for="cc-name">카드 소유자 명</label>
                       <input type="text" class="form-control" id="cc_name" placeholder="카드소유자의 이름을 영문으로 입력하세요" value="" onkeyup="this.value=this.value.replace(/[^a-zA-Z]/g,'');" required>
                       <small class="text-muted">Full name as displayed on card</small>
                       <div class="cc_nameDiv" id="cc_nameDiv">
                       </div>
                     </div>
                     
                     <div class="col-md-6 mb-3">
                       <label for="cc-number">카드 번호</label>
                       <input type="number" class="form-control" id="cc_number" placeholder="공백 없이 16자리를 입력 하세요" maxlength="16" oninput="maxLengthCheck(this)" required>
                       <div class="cc_numberDiv" id="cc_numberDiv">
                       </div>
                    </div>
                </div>
                  
                <div class="row">
                     <div class="col-md-3 mb-3">
                       <label for="cc-expiration">유효 기간(mm/yy)</label>
                       <input type="number" class="form-control w45 inblock" id="cc_expiration1" placeholder="mm" value="" maxlength="2" oninput="maxLengthCheck(this)" required>
                       <input type="number" class="form-control w45 inblock" id="cc_expiration2" placeholder="yy" value="" maxlength="2" oninput="maxLengthCheck(this)" required>
                       <div class="cc_expirationDiv" id="cc_expirationDiv">
                      
                       </div>
                     </div>
                     
                     <div class="col-md-3 mb-3">
                       <label for="cc-expiration">CVV/CVC</label>
                       <input type="number" class="form-control" id="cc_cvv" placeholder="카드뒤 3자리" maxlength="3" oninput="maxLengthCheck(this)" required>
                       <div class="cc_cvvDiv" id="cc_cvvDiv">
                         </div>
                     </div>
                </div>
                
                <hr class="mb-4">
                <input type=button id="orderPayBtn" class="btn btn-primary btn-lg btn-block" value="결재하기">
               
	         </div>
	      </div>
      </form>
   </div>
	<jsp:include page="orderPage_modal.jsp"/>
	
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>
<script type="text/javascript">

//글자수 제한
function maxLengthCheck(object){
	if(object.value.length>object.maxLength){
		object.value = object.value.slice(0, object.maxLength);
	}
}

$(document).ready(function(){
    //마일리지(재우)
    var totalPrice = $('#order_totalPrice').text();
    totalPrice = parseFloat(totalPrice);
    var mileage = parseInt(totalPrice*0.02);
	//예상적립금액
    $('#guessMileage').text(mileage);
    $('#m_point').val(mileage);
	
    //포인트 사용버튼
    $('#useM_pointBtn').on('click',function(){
        //alert($('#myMileage').text());
        //alert($('#useMileage').val()); 
        //히든갑 체크용으로 val너줌	
       	$('#useMileage').val(1);
       	$('#ifUseMileage').text("-"+$('#myMileage').text());
       	$('#order_totalPrice').text((totalPrice-$('#myMileage').text()));
    });
	
    //포인트 취소버튼
    $('#resetM_pointBtn').on('click',function(){
    	$('#useMileage').val(0);
    	$('#ifUseMileage').text("");
    	$('#order_totalPrice').text(totalPrice);
    });
	
	//쿠폰 사용 (현규)
    $('#use_Coupon').on('click',function(){
		var couponValue = $('#couponSelect option:selected').val();
		if(couponValue=="1"){
			$('#order_totalPrice').text(totalPrice-(totalPrice/10));
		}
		//alert($('#couponSelect option:selected').val());
    });
	
	//쿠폰 취소(재우)
	$('#reset_Coupon').on('click',function(){
		$('#order_totalPrice').text(totalPrice);
		//alert($('#couponSelect option:selected').val());
	});
   
});
</script>
</html>