<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <link rel="stylesheet" href="../css/shoppingcart.css">
 <script type="text/javascript" src="../js/shoppingCart.js"></script>

 <!-- cart -->   
<div id="summary" class="summary">
        <div class="summary-total-items"><span class="total-items"></span> WishList</div>
        <div class="summary-subtotal">
          <div class="subtotal-title">Price</div>
          <div class="subtotal-value final-value" id="basket-subtotal">130.00</div>
          <div class="summary-promo hide">
            <div class="promo-title">Promotion</div>
            <div class="promo-value final-value" id="basket-promo"></div>
          </div>
        </div>
        <!-- <div class="summary-delivery">
          <select name="delivery-collection" class="summary-delivery-selection">
              <option value="0" selected="selected">Select Collection or Delivery</option>
             <option value="collection">Collection</option>
             <option value="first-class">Royal Mail 1st Class</option>
             <option value="second-class">Royal Mail 2nd Class</option>
             <option value="signed-for">Royal Mail Special Delivery</option>
          </select>
        </div> -->
        <div>
        <i class="fas fa-cart-plus fa-2x"></i>
        </div>
        <div class="item">
         	상품이 없어요:(
        </div>
        <div class="summary-total">
          <div class="total-title">Total</div>
          <div class="total-value final-value" id="basket-total">130.00</div>
        </div>
        <div class="summary-checkout" style="text-align:center;">
          <button class="btn btn-dark" id="wishShoppingCartBtn">장바구니 이동</button>
          <button class="btn btn-danger" id="closeWishList" >닫기</button>
        </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    $('#closeWishList').click(function() {
		
    });
  }); 
</script>