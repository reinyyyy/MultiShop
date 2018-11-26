<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.productCheckBox{
   position: absolute;
   top: 2px;
   right: 2px;
}
</style>
</head>
<body class="bg-light">
   <div class="container">
      <div class="py-5 text-center">
         <img class="d-block mx-auto mb-4 mt-4" src="../image/jaewoo.jpg" alt="" width="72" height="72"/>
         <h2>결재</h2>
         <p class="lead">깰껌</p>
      </div>
      
      <div class="row mb30">
         <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
               <span class="text-muted">My cart</span>
               <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <input type="button" id="deleteProduct" class="btn btn-primary btn-lg btn-block" value="선택삭제">
            
            <ul class="list-group mb-3">
               <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">상품코드 / 제품명</h6>
                         <small class="text-muted" id="productCodeAndName"></small>
                         <input type="checkbox" class="productCheckBox" name="productCheckBox" id="first_productCheckBox">
                     </div>
                       <span class="text-muted" id="firstProductPrice"></span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                     <div>
                         <h6 class="my-0">두번 째 상품</h6>
                         <small class="text-muted">선택한 상품 없음</small>
                         <input type="checkbox" class="productCheckBox" name="productCheckBox" id="second_productCheckBox">
                       </div>
                       <span class="text-muted" id="secondProductPrice">99000</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between lh-condensed">
                       <div>
                         <h6 class="my-0">세번 째 상품</h6>
                         <small class="text-muted">선택한 상품 없음</small>
                         <input type="checkbox" class="productCheckBox" name="productCheckBox" id="third_productCheckBox">
                       </div>
                       <span class="text-muted" id="thirdProductPrice">0</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between bg-light">
                       <div class="text-success">
                         <h6 class="my-0">마일리지 적립</h6>
                         <small>예상 적립 금액</small>
                       </div>
                       <span class="text-success" id="mileage">2225</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between">
                       <span>최종 결재 금액</span>
                       <strong id="order_totalPrice"></strong>
                  </li>
            </ul>
            
            <!-- 쿠폰 -->
            <form class="card p-2">
                  <div class="input-group">
                       <!-- <input type="text" class="form-control" placeholder="Promo code"> -->
                       <select class="form-control" name="PromoCode" id="PromoCode">
                     <option value="   쿠폰1" selected="selected">쿠폰1</option>
                     <option value="쿠폰2">쿠폰2</option>
                     <option value="쿠폰3">쿠폰3</option>
                     <option value="쿠폰4">쿠폰4</option>
                  </select>
                       <div class="input-group-append">
                         <button type="submit" class="btn btn-secondary">Redeem</button>
                       </div>
                  </div>
                </form>
                
              </div>
              <div class="col-md-8 order-md-1">
                <h4 class="mb-3">정보 입력</h4>
                <form class="needs-validation" method="post" action="order.do">      <!-- novalidate은 유효성검사를 하지않겠다는 것 -->
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <label for="firstName">이름</label>
                      <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                      <div class="firstNameDiv" id="firstNameDiv">
                         
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <label for="lastName">성</label>
                      <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
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
                      <input type="text" class="form-control" id="userName" placeholder="이름 입력" required>
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
                 
                 <hr class="mb-4">
                  <div class="custom-control custom-checkbox">
                       <input type="checkbox" class="order_checkBox" id="save-info">
                       <label class="custom-control-label" for="save-info">이 주소를 저장하겠습니다.</label>
                    </div>
                    
                  <hr class="mb-4">
                  <h4 class="mb-3">카드 선택</h4>

                  <div class="d-block my-3">
                       <div class="custom-control custom-radio">
                         <input id="credit" name="paymentMethod" type="radio" class="order_radio" checked required>
                         <label class="custom-control-label" for="credit">신용 카드</label>
                       </div>
                       
                       <div class="custom-control custom-radio">
                         <input id="debit" name="paymentMethod" type="radio" class="order_radio" required>
                         <label class="custom-control-label" for="debit">체크 카드</label>
                       </div>
                       
                       <div class="custom-control custom-radio">
                         <input id="paypal" name="paymentMethod" type="radio" class="order_radio" required>
                         <label class="custom-control-label" for="paypal">PayPal</label>
                     </div>
                  </div>
                  
                  <div class="row">
                       <div class="col-md-6 mb-3">
                         <label for="cc-name">카드 소유자 명</label>
                         <input type="text" class="form-control" id="cc_name" placeholder="카드소유자의 이름을 입력하세요" value="" required>
                         <small class="text-muted">Full name as displayed on card</small>
                         <div class="cc_nameDiv" id="cc_nameDiv">
                         </div>
                       </div>
                       
                       <div class="col-md-6 mb-3">
                         <label for="cc-number">카드 번호</label>
                         <input type="text" class="form-control" id="cc_number" placeholder="" required>
                         <div class="cc_numberDiv" id="cc_numberDiv">
                         </div>
                      </div>
                  </div>
                  
                  <div class="row">
                       <div class="col-md-3 mb-3">
                         <label for="cc-expiration">유효 기간(mm/yy)</label>
                         <input type="text" class="form-control w45 inblock" id="cc_expiration1" placeholder="(mm)" value="" required>
                         <input type="text" class="form-control w45 inblock" id="cc_expiration2" placeholder="(yy)" value="" required>
                         <div class="cc_expirationDiv" id="cc_expirationDiv">
                        
                         </div>
                       </div>
                       
                       <div class="col-md-3 mb-3">
                         <label for="cc-expiration">CVV/CVC</label>
                         <input type="text" class="form-control" id="cc_cvv" placeholder="" required>
                         <div class="cc_cvvDiv" id="cc_cvvDiv">
                           </div>
                       </div>
                  </div>
                  
                  <hr class="mb-4">
                  <button id="payBtn" class="btn btn-primary btn-lg btn-block" type="submit">결재</button>
                 
                 </form>
         </div>
      </div>
   </div>

</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/order.js"></script>
<script type="text/javascript">
$(document).ready(function(){
   $.ajax({
      type : 'POST',
      url : '/MultiShop/detail_page/getOrderPage.do',
      data : {'color':'${color}',
            'size':'${size}',
            'amount':'${amount}',
            'productCode':'${productCode}',
            'productName':'${productName}'},
      dataType : 'json',
      success : function(data){
         //alert(JSON.stringify(data));
         $('#productCodeAndName').append(data.detailDTO.p_code + " / " + data.detailDTO.p_name +"&emsp;"+ " X " + data.detailDTO.p_amount);
         $('#firstProductPrice').text((data.detailDTO.p_cost*data.detailDTO.p_amount));
         
         var firstProductPrice = $('#firstProductPrice').text();
         var secondProductPrice = $('#secondProductPrice').text();
         var thirdProductPrice = $('#thirdProductPrice').text();
         
         firstProductPrice = parseFloat(firstProductPrice);
         secondProductPrice = parseFloat(secondProductPrice);
         thirdProductPrice = parseFloat(thirdProductPrice);
         var totalPrice = (firstProductPrice+secondProductPrice+thirdProductPrice);
         
         $('#order_totalPrice').text(totalPrice+"원");
      },error : function(data){
         alert("실패");
      }
   });
   
   //장바구니 체크박스
   $('#deleteProduct').on('click',function(){
      var count = $('.productCheckBox:checked').length;
      //var checked = $('.productCheckBox:checked').is(':cheked');
      
      if(count!=0){
         alert(count);
      }else{
         alert("count="+count);
         alert("선택된 항목이 없습니다.");
      }
   });   
   
});
</script>

</html>