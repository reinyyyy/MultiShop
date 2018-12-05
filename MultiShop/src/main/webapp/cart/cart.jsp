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
 <img src="../image/shoppingbasket.png" width="15%">
 </div>
 <div style="text-align:center;">
 <img src="../image/for.jpg" width="10%">
 <img src="../image/basketcozy.jpg" width="10%">
 </div>
 <i class="fas fa-cart-arrow-down fa-3x"></i>

 <form name="cartForm" id="cartForm" method="post" action="http://localhost:8080/MultiShop/cart/update.do">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:65%; text-align:center;" >상품명</th>
							<th style="width:10%; text-align:center;">가격</th>
							<th style="width:8%; text-align:center;">수량</th>
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
								<h4>${row.p_name}</h4>
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
								<input type="number" class="form-control text-center" value="${row.p_amount}">
								<input type="hidden" name="p_code" value=" ${row.p_code}"/>
							</td>
						<td data-th="Total" class="text-center">
							<fmt:formatNumber  type="currency" currencySymbol="￦" value = "${row.p_cost * row.p_amount}"/>
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
							<td class="text-center"><strong>합계: <fmt:formatNumber  type="currency" currencySymbol="￦" value = "${map.sumMoney}"/></strong></td>
						</tr>
						<tr>
							<td><a href= "../category/categoryItemList.do?cateNum=3" class="btn btn-warning"><i class="fa fa-angle-left"></i> 쇼핑 계속하기</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong></strong></td>
							<td><a href="#" class="btn btn-success btn-block">결제하기 <i class="fa fa-angle-right"></i></a></td>
						</tr>
					</tfoot>
				</table>
		</form>
	</c:if>
</div>

     <script type="text/javascript" src="../js/cart.js"></script>
</html>


