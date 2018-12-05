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
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel ="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/my-spinner.css">
<link href="../css/xzoom.css" rel="stylesheet">
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

#floatMenu {
	position: absolute;
	width: 300px;
	height: 55px;
	left: 20px;
	top: 220px;
	background-color: #E6E6E6;
	color: #fff; 
	z-index:1300;
}
#wishList{
	position: absolute;
	width: 2500px;
	height: 200px;
	left: 1000px;
	top: 800px;
	background-color: #E6E6E6;
	color: #fff; 
	z-index:1300;
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

	<!-- 파라미터 값 -->
	<input type = "hidden" name = "sortType" id = "sortType" value = "${sortType}">
	<input type = "hidden" name = "p_midCate" id = "p_midCate" value = "${p_midCate}">				
	<input type = "hidden" name = "p_name" id = "p_name" value = "${p_name}">
	<%-- <input type = "hidden" name = "search_option" id = "search_option" value = "${search_option}"> --%>

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
					 <li>
					 	<c:if test="${session_email == null}">
                            <button type="button" id="login_navbar" class="btn btn-light"
                                aria-label="Left Align">
                                <i class="fas fa-sign-in-alt"></i>
                            </button>
						<button type = "button" class = "btn btn-success" onclick = "location.href='../manage/main.do'">M</button>	<!--  임시 -->
 
                        </c:if> 
                        <c:if test="${session_email != null}">
                            <button type="button" id="logout_navbar" class="btn btn-danger"
                                aria-label="Left Align">
                                <i class="fas fa-sign-in-alt"></i>
                            </button>
                        </c:if></li>
                   		 <li>
                    <c:if test="${session_email == null}">
                            <button type="button" id="non_member" class="btn btn-light"
                                aria-label="Left Align">
                                <i class="fas fa-user-circle"></i>
                            </button>
                        </c:if> 
                        <c:if test="${session_email != null}">
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
					 <c:if test="${session_email != null}">
						<button type="button" class="btn btn-danger" id="wishlist" onclick="document.getElementById('summary').style.display='none';" aria-label="Left Align">
						   <i class="far fa-heart"></i>
						</button>
					 </c:if>
					 
					 <c:if test="${session_email == null}">
						<button type="button" class="btn btn-dark" data-backdrop="static" data-toggle="modal" data-target="#wishlist_nonmember" aria-label="Left Align">
						   <i class="fas fa-heart"></i>
						</button>
					 </c:if>
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
		                        href="#" aria-expanded="false"  onclick = "location.href='../category/categoryItemList.do?cateNum=1'"> Food </a>
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
									<select name = "search_option" id = "search_option">
										<option value = "3"> Clothes </option>
										<option value = "2"> Tech++ </option>
										<option value = "1"> Food </option>
									</select>
									
									<input class="form-control" name = "search_value" id = "search_value" type="text" placeholder="검색어 입력"> 
									<button type="button" id = "search_btn" class="btn btn-primary" aria-label="left Align">
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
     
     <script src = "http://code.jquery.com//jquery-3.3.1.min.js"></script>
     <script>
     	$(document).ready(function(){
     		$('#search_btn').click(function(){
     			var search_option = $('#search_option').val()
     			var search_value = $('#search_value').val();
     			
     			console.log('옵션 : ' + search_option + ' 검색어 : ' + search_value);
     			location.href = '../category/categoryItemList.do?cateNum='+search_option+'&p_name='+search_value;
     		});
     	});
     </script>
   <div class="container">
     
   </div>
   <br>
   <section  id="section_location">
      <jsp:include page="${section}" />
   </section>
	
   <jsp:include page="modal.jsp"/>
	
	<!-- <div id="floatMenu">
		<audio src="../music/Arms.mp3"  autoplay controls style="z-index: 1300"></audio>
	</div> -->
	
	<div id='my-spinner' style="z-index: 1200">
      <div><span>
         <img src='//cdnjs.cloudflare.com/ajax/libs/galleriffic/2.0.1/css/loader.gif'>
      </span></div>
      </div>

<!-- footer -->
<footer class="page-footer font-small unique-color-dark">
    <div style="background-color: #D8D8D8;">
      <div class="container">
        <!-- Grid row-->
        <div class="row py-4 d-flex align-items-center">
          <!-- Grid column -->
          <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
            <h6 class="mb-0"><i class="fas fa-globe-asia"></i><strong>2019</strong> facebook, instagram, twitter, google+ <strong>Coming Soon!</strong></h6>
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-6 col-lg-7 text-center text-md-right">
            <!-- Facebook -->
            <a class="fb-ic">
              <i class="fab fa-facebook fa-2x white-text"></i>
            </a>
            <!-- Twitter -->
            <a class="tw-ic">
              <i class="fab fa-twitter fa-2x white-text"> </i>
            </a>
            <!-- Google +-->
            <a class="gplus-ic">
              <i class="fab fa-google-plus fa-2x white-text"> </i>
            </a>
            <!--Instagram-->
            <a class="ins-ic">
              <i class="fab fa-instagram fa-2x white-text"> </i>
            </a>
          </div>
          <!-- Grid column -->
        </div>
        <!-- Grid row-->
      </div>
    </div>

    <!-- Footer Links -->
    <div class="container text-center text-md-left mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase font-weight-bold">사업자 정보</h6>
          <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
          <p style="font-size:9pt; "> 상호명: (주)JJ Company<br>
          	     대표: 제갈준혁<br>
          	   사업장소재지: 서울특별시 종로구 묘동 56 4층<br>
          	  사업자등록번호:203-44-25960<br>
          	  통신판매업신고:2018-서울종로-1953    	     
          </p>
          <p style="font-size:17pt;">
          <i class="fas fa-phone"></i>
          1644-9301<br>
          </p>
          <p style="font-size:10pt;">
          AM 10:00 ~ PM 06:00 <br>Off-time PM 12:30 ~ PM 02:00 <br>DAY OFF(SATURDAY. SUNDAY, HOLIDAY)<br></p>
		 <button type="button" class="btn btn-dark">FAQ ></button>
          
        </div>
        <!-- Grid column -->
        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <div class="container">
          <i class="fas fa-mobile-alt fa-5x"></i>
          <br><br>
          </div>
          <div>
          <button id="privatePolicyBtn" data-backdrop="static" data-toggle="modal" data-target="#privatePolicy_modal" class="btn btn-light">Privacy</button>
          <br>
          </div>
          <div>
          <button id="termsAndConditionBtn" data-backdrop="static" data-toggle="modal" data-target="#termsAndConditions_modal" class="btn btn-light">Agreement</button>
          <br><br>
          </div>
		 <div>
		 	<i class="fab fa-cc-paypal fa-4x"></i> 	
		 	<i class="fab fa-cc-visa fa-4x"></i>
		 </div>
		 <div>
		 	<i class="fab fa-cc-discover fa-4x"></i>
		 	<i class="fab fa-cc-mastercard fa-4x"></i>
		 </div>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

          <!-- Links -->
          <h6 class="text-uppercase font-weight-bold">제휴 Site</h6>
          <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
          <p style="font-size:10pt;">
          	신제품 소식을 just COZY와 협업 되어 있는 사이트에서 확인하세요!
          </p>
          <p>
          	<i class="fab fa-apple"></i>
            <a href="https://www.apple.com/kr/"> Apple</a>
          </p>
          <p>
          	<i class="fas fa-gamepad"></i>
            <a href="https://www.nintendo.co.kr/main.php">Nintendo</a>
          </p>
          <p>
          	<i class="fas fa-tshirt"></i>
            <a href="http://www.apc-korea.com/main.do?referer=https://www.google.co.kr/&null">A.P.C</a>
          </p>
          <p>
         	 <i class="fas fa-shoe-prints"></i>
            <a href="http://shop.adidas.co.kr/adiMain.action">Adidas</a>
          </p>
		  <p>
		  <i class="far fa-lemon"></i>
		  <a href="https://www.naturesway.com/Brands/Alive">Alive</a>
		  </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

          <!-- Links -->
          <h6 class="text-uppercase font-weight-bold">Contact</h6>
          <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
          <p style="font-size:10pt; ">
            <i class="fa fa-home mr-3"></i>서울시 종로구 묘동 56 단성사 4층 </p>
          <p style="font-size:10pt; ">
            <i class="fa fa-envelope mr-3"></i> 이종훈(y70ead@naver.com) </p>
          <p style="font-size:10pt; ">
            <i class="fa fa-phone mr-3"></i> 010-7255-0746</p>
          <p style="font-size:10pt; ">
            <i class="fa fa-print mr-3"></i> 02-1445-9304</p>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row -->

    </div>
    <!-- Footer Links -->
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3" style="background-color: #000000;"><span style="color:white;">© 2018 Copyright:</span>
      <a href="https://localhost:8080/MultiShop/main/index.do"> just COZY</a>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->
</body>
<script type="text/javascript"  src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
   integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
   crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/navbar.js"></script>
<script type="text/javascript" src="../js/mypage.js"></script>
<script type="text/javascript" src="../js/post.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="../js/rsa.js"></script>
<script type="text/javascript" src="../js/jsbn.js"></script>
<script type="text/javascript" src="../js/prng4.js"></script>
<script type="text/javascript" src="../js/rng.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/messages_ko.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/xzoom.js"></script>
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
<script type="text/javascript" src="../js/eventPopUp.js"></script>
<script type="text/javascript" src="../js/followMenu.js"></script>
<script>
$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})
</script>

<script type="text/javascript">
$(document)
.ajaxStart(function () {
   $('#my-spinner').show();
})
.ajaxStop(function () {
   $('#my-spinner').hide();
});
</script>

<script>
	$(document).ready(function(){
		$('#search_option').val("${cateNum}").prop('selected', true);
	});
</script>