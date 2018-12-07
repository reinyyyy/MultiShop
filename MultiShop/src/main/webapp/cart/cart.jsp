<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/cart.css">

</head>
<body>
 <div class="container">
 
 <c:if test="${map.count==0 }">
 	 <img src="../image/cartempty.gif" width="100%">
</c:if>

 <c:if test="${map.count!=0 }">
 <div style= "text-align:center;">
 <img src="../image/shoppingbasket.png" width="13%">
 </div>
 <div style="text-align:center;">
 <img src="../image/for.jpg" width="10%">
 <img src="../image/basketcozy.jpg" width="10%">
 </div>
 <i class="fas fa-cart-arrow-down fa-3x"></i>

 <form name="cartForm" id="cartForm" method="post" action="update.do">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:*;" class="text-center">상품명</th>
							<th style="width:10%;">가격</th>
							<th style="width:7%;" class="text-center">수량</th>
							<th style="width:22%" class="text-center">소계</th>
							<th style="width:10%">변경사항</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr>
						<td data-th="Product">
						<div class="row"> 
						<div class="col-sm-2 hidden-xs">
							<img src="../upload/${row.p_image}" class="img-fluid"/>
						</div>
						<div class="col-sm-10"">
							<div class="row">
								<div class="col">
								<h5>${row.p_name}</h5>
								</div>
								<div class="col">
								<p><strong>${row.p_option1}</strong></p>
								<p><strong>${row.p_option2}</strong></p>
								</div>
													
								</div>
							</div>
						</div>
						</td>
						<td>
							<fmt:formatNumber type="currency" currencySymbol="￦" value = "${row.p_cost}"/>
						</td>
						<td data-th="Quantity">
								<div class="row">	
								<div class="amount_change">
									<input type="number" name="p_amount" id="p_amount" class="form-control text-center" value="${row.p_amount}" min="1">
									<input type="hidden" name="p_code" value="${row.p_code}"/>
							<!-- 	<div style="display: inline-block; width: 50%;">
									<button type="button" id="up"class="btn btn-success" style="margin-left: 5px;"><i class="fas fa-caret-up"></i></button>
									<button type="button" id="down" class="btn btn-danger"><i class="fas fa-caret-down"></i></button>													
								</div> --></div>
								</div>
							</td>
						<td data-th="Total" class="text-center">
						<div class="cart-subtotal">
							<fmt:formatNumber  type="currency" currencySymbol="￦" value = "${row.p_cost * row.p_amount}"/>
						</div>	
						</td>
						<td class="actions" data-th="">
								<button type="submit" class="btn btn-info btn-sm"><i class="fas fa-sync-alt fa-spin"></i></button>
								<a href="delete.do?c_seq=${row.c_seq}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>								
							</td>
						</tr>
					
					</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">				
							<td class="text-center">
							<div class="total" style="text-align:left;">
								<strong>합계: <fmt:formatNumber type="currency" currencySymbol="￦" value = "${map.sumMoney}"/></strong>
							</div>
							</td>
						</tr>
						<tr>
							<td><a href= "../category/categoryItemList.do?cateNum=3" class="btn btn-warning"><i class="fa fa-angle-left"></i> 쇼핑 계속하기</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong></strong></td>
							<td><a href="#" class="btn btn-success btn-block" id="cart_Btn">결제하기 <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
		</form>
	</c:if>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
 <script type="text/javascript" src="../js/cart.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#cart_Btn').on('click',function(){
		//폼에 액션에 값을 변경해줘라
		$('#cartForm').attr('action','/MultiShop/detail_page/cartOrderPage.do');
		$('#cartForm').submit();
		/* $.ajax({
  		  type : 'POST',
            url : '/MultiShop/detail_page/orderPage.do',
            data : {'p_code': '${p_code}'
                ,'p_amount':'${p_amount}'},
            success : function(data){
            	alert(JSON.stringify(data));
          	  //location.href="../cart/cart.do?p_code="+p_code+"&p_amount="+p_amount;
            },error : function(data){
          	  alert("에러발생!!");
            }
         
  	  });
		 */
	});
	
});
</script>
</html>


