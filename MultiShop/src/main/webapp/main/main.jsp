<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String session_email = (String) request.getAttribute("session_email"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/layout.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel ="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/my-spinner.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<title>Welcome to COZY!!</title>
<style>
#nav_location {
	position: relative;
	z-index: -1;
}

#section_location {
	overflow: hidden;
	zoom: 1;
	position: relative;
	z-index: 1
}

.float_left {
	float: left;
}

.float_right {
	float: right;
}

.float_center {
	float: left;
	position: relative;
	left: 40%;
}

.modal-backdrop {
	z-index: 1;
}

</style>
</head>
<body>

		<div class="event_coupon">	
			<a class="navbar-brand text-light">
				<h6><i class="fas fa-info-circle"></i>&emsp; just COZY 첫 구매 시 15% Discount</h6>
		</a>
		<button class="btn btn-primary btn-sm" aria-label="right Align">쿠폰 받기</button>
	</div>
	
	<div class="top_nav">	
		<div class="top_bg_area">
			<div class="top_box_area">
				<ul class="icon_list float_left">
					 <li><c:if test="${session_email == null}">
                            <button type="button" id="login_navbar" class="btn btn-light"
                                aria-label="Left Align">
                                <i class="fas fa-sign-in-alt"></i>
                            </button>
						<button type = "button" class = "btn btn-success" onclick = "location.href='../manage/addForm.do'">M</button>	<!--  임시 -->
 
                        </c:if> <c:if test="${session_email != null}">
                            <button type="button" id="logout_navbar" class="btn btn-danger"
                                aria-label="Left Align">
                                <i class="fas fa-sign-in-alt"></i>
                            </button>
                        </c:if></li>
                    <li><c:if test="${session_email == null}">
                            <button type="button" id="non_member" class="btn btn-light"
                                aria-label="Left Align">
                                <i class="fas fa-user-circle"></i>
                            </button>
                        </c:if> <c:if test="${session_email != null}">
                            <button type="button" id="mypageBtn" class="btn btn-success"
                                aria-label="Left Align">
                                <i class="fas fa-user-circle"></i>
                            </button>
                        </c:if></li>
                    <li>
                        <button type="button" class="btn btn-light"
                            aria-label="Left Align">
                            <i class="fas fa-shopping-cart"></i>
                        </button>
                    </li>
				</ul>
				<a href="http://localhost:8080/MultiShop/main/index.do">
					<img src="../image/justcozy.png" width="380" height="50">
				</a>
					
				<ul class="icon_list float_right">
					<li>    
						<button type="button" class="btn btn-danger" aria-label="Left Align">
						   <i class="far fa-heart"></i>
						</button>
					</li>
					<li>
						<button type="button" class="btn btn-success" data-backdrop="static" data-toggle="modal" data-target="#send_email" aria-label="Left Align">
						   <i class="fas fa-envelope"></i>
						</button>
						
					</li>
					<li>
						<button type="button" class="btn btn-info" aria-label="Left Align">
						   <i class="fas fa-question"></i>
						</button>
					</li>
				</ul>
				<div class="hidden_btn">   
					<button class="navbar-toggler" type="button" data-toggle="collapse"
					    data-target="#navbarResponsive" aria-controls="navbarResponsive"
					    aria-expanded="false" aria-label="Toggle navigation">
					    <!-- <span class="navbar-toggler-icon"></span> -->
					    <i class="fas fa-align-justify"></i>
					</button>
				</div>
			</div>
		</div>
	
	      <div class="top_mobile_nav">
	         <nav class="navbar navbar-expand-lg navbar-dark navbar_bg">
	            <div class="container">
		            <div class="container">
		            <div class="collapse navbar-collapse row"
		               id="navbarResponsive">
		               <div class="navbar_area col-md-7">
		                  <ul class="navbar-nav ml-auto">
		                   <li class="nav-item dropdown hidden_nav_menu">
                                <a class="dropdown-toggle text-secondary" data-toggle="dropdown" href="#" aria-expanded="false"> User </a>
                              <ul class="dropdown-menu" id="boardMenu" role="menu">
                      			 <c:if test = "${m_email != null }">
                                 	<a class="dropdown-item" id="login_navbar2">Login</a>
                                 </c:if>
                                 <c:if test = "${m_email == null }">
                                	 <a class="dropdown-item" id = "logout_navbar2" href="#">Logout</a>
                                 </c:if>
                                 <a class="dropdown-item" href="#">Basket</a>
                                 <a class="dropdown-item" href="#">WishList</a>
                                 <a class="dropdown-item" href="#">SendMail</a>
                                 <a class="dropdown-item" href="#">FAQ</a>
                              </ul>
                           </li>
                          <li class="nav-item dropdown">
                              <a class="text-sucess" style="cursor: pointer;" id="noticeBtn"> Notice</a>
                           </li>
							
		                  <li class="nav-item dropdown">
                               <a class="dropdown-toggle dropdown-toggle-split text-secondary"
		                        data-toggle="dropdown" href="#" aria-expanded="false" onclick = "location.href='../category/categoryItemList.do?cateNum=3'">Clothes
		                        </a>
		                        <ul class="dropdown-menu" id="ClothMenu" role="menu">
		                           <a class="dropdown-item" href="#">All</a>
		                           <a class="dropdown-item" href="#">Outer</a>
		                           <a class="dropdown-item" href="#">Top</a>
		                           <a class="dropdown-item" href="#">Bottom</a>
		                           <a class="dropdown-item" href="#">Shoes</a>
		                           <a class="dropdown-item" href="#">Inner</a>
		                        </ul>
		                     </li>
		                     <li class="nav-item dropdown"><a
		                        class="dropdown-toggle text-secondary" data-toggle="dropdown"
		                        href="#" aria-expanded="false"  onclick = "location.href='../category/categoryItemList.do?cateNum=2'"> Tech++ </a>
		                        <ul class="dropdown-menu" id="TechMenu" role="menu">
		                           <a class="dropdown-item" href="#">Audio/Video</a>
		                           <a class="dropdown-item" href="#">Game</a>
		                           <a class="dropdown-item" href="#">Smart Watch</a>
		                           <a class="dropdown-item" href="#">Drone</a>
		                           <a class="dropdown-item" href="#">TV</a>
		                           <a class="dropdown-item" href="#">Laptop/Computer HardWare</a>
		                        </ul></li>
		                     <li class="nav-item dropdown"><a
		                        class="dropdown-toggle text-secondary" data-toggle="dropdown"
		                        href="#" aria-expanded="false"  onclick = "location.href='../category/categoryItemList.do'"> Food </a>
		                        <ul class="dropdown-menu" id="FoodMenu" role="menu">
		                           <a class="dropdown-item" href="#">All</a>
		                           <a class="dropdown-item" href="#">Carbohydrate</a>
		                           <a class="dropdown-item" href="#">Protein</a>
		                           <a class="dropdown-item" href="#">Fat</a>
		                           <a class="dropdown-item" href="#">Vitamin</a>
		                           <a class="dropdown-item" href="#">Spice</a>
		                        </ul></li>
		                  </ul>
			            </div>
							
			               <div class="search_area col-md-5" id="navbarResponsive">
								<form class="form-inline float_right" action="#">
									<input class="form-control" type="text" placeholder="검색어 입력"> 
									<button type="button" class="btn btn-primary" aria-label="left Align">
										<i class="fa fa-search fa"></i>
									</button>
								</form>
			               </div>
		               </div>	
		            </div>
	            </div>
	         </nav>
	      </div>
     </div>
   <div class="container">
     
   </div>
   <br>
   <section  id="section_location">
      <jsp:include page="${section}" />
   </section>
	
   <jsp:include page="modal.jsp"/>
	
	<div id='my-spinner' style="z-index: 1200">
      <div><span>
         <img src='//cdnjs.cloudflare.com/ajax/libs/galleriffic/2.0.1/css/loader.gif'>
      </span></div>
    </div>
    
   <!-- Footer -->
   <footer class="py-5 bg-dark">
  	   <div class="dropdown">
          <p class="m-0 text-center text-white">(주)COZY 사업자 정보 보기
       </div>
      <div class="container">
         <p class="m-0 text-center text-white">Copyright &copy; KGITBANK</p>     
      </div>
      <!-- /.container -->
   </footer>
</body>
<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
   integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
   crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/navbar.js"></script>
<script type="text/javascript" src="../js/post.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../js/rsa.js"></script>
<script type="text/javascript" src="../js/jsbn.js"></script>
<script type="text/javascript" src="../js/prng4.js"></script>
<script type="text/javascript" src="../js/rng.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/messages_ko.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<script>
   $('.dropdown').hover(function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn();
   }, function() {
      $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut();
   });

   $('.dropdown-menu').hover(function() {
      $(this).stop(true, true);
   }, function() {
      $(this).stop(true, true).delay(200).fadeOut();
   });
</script>

<script type="text/javascript" src="../js/scrollTop.js"></script>
<script>
$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})
</script>

<!-- <script type="text/javascript">
$( document).ready(function() {
	  window.open("../main/eventPopup.html", "Open Event!", "width=400, height=510, toolbar=no, menubar=no, scrollbars=no, resizable=no" );  
	  
});
</script> -->

<script type="text/javascript">
$(document)
.ajaxStart(function () {
   $('#my-spinner').show();
})
.ajaxStop(function () {
   $('#my-spinner').hide();
});
</script>

</html>