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
 	  장바구니가 비었습니다. 	
</c:if>

 <c:if test="${map.count!=0 }">
 <form name="cartForm" id="cartForm" method="post" action="http://localhost:8080/MultiShop/cart/update.do">
	<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr>
							<th style="width:65%">상품명</th>
							<th style="width:10%">가격</th>
							<th style="width:8%">수량</th>
							<th style="width:22%" class="text-center">합계</th>
							<th style="width:10%">변경사항</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr>
						<td>
							${row.p_name}
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value = "${row.p_cost}"/>
						</td>
						<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="${row.p_amount}">
								<input type="hidden" name="p_code" value=" ${row.p_code}"/>
							</td>
						<td data-th="Total" class="text-center">
							<fmt:formatNumber pattern="###,###,###" value = "${row.p_cost * row.p_amount}"/>
						</td>
						<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fas fa-sync-alt fa-spin"></i></button>
								<a href="delete.do?c_seq=${row.c_seq}" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></a>								
							</td>
						</tr>
					
					</c:forEach>
						<!-- <tr>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs"><img src="http://placehold.it/100x100" alt="..." class="img-responsive"/></div>
									<div class="col-sm-10">
										<h4 class="nomargin">상품 1</h4>
										<p>설명1</p>
									</div>
								</div>
							</td>
							<td data-th="Price">$1.99</td>
							<td data-th="Quantity">
								<input type="number" class="form-control text-center" value="1">
							</td>
							<td data-th="Total" class="text-center">1.99</td>
							<td class="actions" data-th="">
								<button class="btn btn-info btn-sm"><i class="fas fa-sync-alt fa-spin"></i></button>
								<button class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>								
							</td>
						</tr> -->
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"><strong>합계: <fmt:formatNumber pattern="###,###,###" value = "${map.sumMoney}"/></strong></td>
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


