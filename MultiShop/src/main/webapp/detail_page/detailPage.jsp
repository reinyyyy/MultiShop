<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/contents.css" rel="stylesheet">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/detail_work.css" rel="stylesheet">
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
   integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
   crossorigin="anonymous">

<style type="text/css">
#section_location{
	position: unset;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<input type = "hidden" id="session_email" value="${session_email }">
	<input type = "hidden" id="p_code" value="${p_code }">
   <header>
      <div class="container">
         <div id="productView">
         <div id="productPopup" >
            <div class="productPopupWrap">
                  <div class="popLeft">
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
            <form id ="detail_form" method="post" action="orderPage.do">
            <div class="popRight">
               <span class="viewTitle">JCoat</span>
               <input type="hidden" id="productName" name="productName" value="JCoat">
<!--                   <p class="sub">실 제본으로 책장이 넘기기 쉬운 노트</p> -->
               <p class="sub"></p>
               <div class="aboutList">
                  <ul class="aboutListTop">
                     <li>
                        <dl>
                           <dt>판매가</dt>
                           <dd id="product_price"></dd>
                        </dl>
                     </li>
                     <input type="hidden" name="product_price" id="product_price" value="99000.0">
                     <li>
                        <dl>
                           <dt>배송비</dt>
                           <dd>2,500원 </dd>
                        </dl>
                     </li>
                  </ul>
                  <ul class="aboutListBottom">
                     <li>
                        <dl>
                           <dt>상품코드</dt>
                           <dt id="product_code">${p_code}</dt>
                           <input type="hidden" name="productCode" id="productCode" value="${p_code}">
                           <!-- <input type="hidden" name="p_midCate" id="p_midCate" value="">
                           <input type="hidden" name="p_smallCate" id="p_smallCate" value=""> -->
                           
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>제조국가</dt>
                           <dd>이탈리아</dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>발송예정일</dt>
                           <dd>12월 25일 이내</dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>색상</dt>
                           <dd>
                              <div class="detail_color">
                                 <select name="detail_colorSelect" id="detail_colorSelect" onchange="changeColor(this.value)">
                                    <option value="black" selected="selected">black</option>
                                    <option value="green">green</option>
                                    <option value="begie">begie</option>
                                    <option value="white">white</option>
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>사이즈</dt>
                           <dd>
                              <div class="detail_size">
                                 <select name="detail_sizeSelect" id="detail_sizeSelect">
                                    <!-- <option value="S" selected="selected">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option> -->
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>수량</dt>
                           <dd>
                              <div class="detail_amount">
                                 <select name="detail_amountSelect" id="detail_amountSelect">
                                    <option value="1" selected="selected">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                 </select>
                              </div>
                           </dd>
                        </dl>
                     </li>
                  </ul>
                  </div>
                     <div class="productCon02">
                        
                     </div>
                     <div class="conWrap">
                        <div class="totalWrap">
                           <span>총합계</span>
                           <span id="totalPrice" class="totalPrice" totalp="99000.0">99000</span>
                        </div>
                     </div>
                     <div class="btnWrap">
                        <a href="#none" id="favoriteBtn" class="btnFavorite bookmark" itemid="224000105259">
                           <i class="far fa-heart"></i>&emsp;관심상품 등록
                        </a>
                        <a href="#none" id="basketBtn" class="btnBasket cart_add" data-toggle="modal" href="#basketModal">
                           <i class="fas fa-shopping-cart"></i>&emsp;장바구니 담기
                        </a>
                        <a href="#none" id="buyNowBtn" class="btnBuyNow order_now" itemsts="1" unitea="">
                           <i class="fas fa-credit-card"></i>&emsp;바로구매
                        </a>
                     </div>
                  </div>
               </form>
               </div>
            </div>
         </div>
      </div>
      
      <div id="basketModal" class="modal" tabindex="-1" role="dialog">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title">MultiShop&nbsp;: </h5>
                    <button type="button" id="basketModal_xBtn" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <p>장바구니로 이동하시겠습니까?</p>
                  </div>
                  <div class="modal-footer">
                    <button type="button" id="goBasket" class="btn btn-primary">예</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                  </div>
             </div>
         </div>
      </div>
         
   </header>
   
   <!-- 양현규 -->
   
   <div class="section">
       <section id="detail_Section-1"  align="center">
         <div class="container detail_Information">
            <div class="row" align="center">
               <div class="col" style="border : 2px solid black; border-bottom: 0px; height : 50px;">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-1">상세정보</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-2">상품정보고시</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-3">사용후기</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-4">상품Q&A</a>
               </div>
            </div>
         </div>
            <br><br>
           <img style="width : 100%;" src="../image/makeup.jpg"><br>
           <img style="width : 100%;" src="../image/makeup1.jpg">
       </section>
       
       <section id="detail_Section-2">
          <div class="container detail_Product">
            <div class="row" align="center">
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px;">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-1">상세정보</a>
               </div>
               <div class="col" style="border : 2px solid black; border-bottom: 0px; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-2">상품정보고시</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-3">사용후기</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-4">상품Q&A</a>
               </div>
            </div>
           <br><h5><strong>상품정보고시</strong></h5>
         </div>
       </section>
       <br><br>
       
       <section id="detail_Section-3">
         <div class="container detail_hoogi">
            <div class="row">
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000;  height : 50px;" align="center">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-1">상세정보</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px" align="center">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-2">상품정보고시</a>
               </div>
               <div class="col" style="border : 2px solid black; border-bottom: 0px; height : 50px" align="center">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-3">사용후기</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px" align="center">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-4">상품Q&A</a>
               </div>
            </div>
              <!--사용 후기 테이블 위치  -->
              <br>
              <div id="detail_hoogi_Table">
              	<jsp:include page="../detail_Table/detail_hoogiTable.jsp"/>
              </div>
               <%-- <br>
              <div>
              	<jsp:include page="../detail_Paging/detail_hoogiPaging.jsp"/>
              </div> --%>
              <br>
            <div class="container" align="right">
            	<input type="button" value="사용후기작성" class="btn_hoogi" id="btn_hoogi" data-toggle="modal" data-taget="#detail_hoogiModal">
            </div>
         </div>
       </section>
       
      <br><br>
       <section id="detail_Section-4">
          <div class="container detail_QnA">
            <div class="row" align="center">
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px;">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-1">상세정보</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-2">상품정보고시</a>
               </div>
               <div class="col" style="border : 1px solid gray; border-bottom: 2px solid #000000; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-3">사용후기</a>
               </div>
               <div class="col" style="border : 2px solid black; border-bottom: 0px; height : 50px">
                  <a class="sangse" style="display :block;  cursor:pointer; line-height : 50px; color : black;" href="#detail_Section-4">상품Q&A</a>
               </div>
            </div>
            
            <!-- QnA 테이블 위치 -->
            <br>
            <div id="detail_QnA_Table">
                 <jsp:include page="../detail_Table/detail_QnATable.jsp"/>
            </div>
            <%-- <br>
            <div>
              	<jsp:include page="../detail_Paging/detail_QnAPaging.jsp"/>
            </div> --%>
              <br>
              <div class="container" align="right">
               <input type="button" value="상품문의작성" class="detail_Btn_QnA mb-4" id="detail_Btn_QnA">
              </div>
         </div>
       </section>
   </div>
   <jsp:include page="../detail_Modal/detail_Modal.jsp"/>
   <jsp:include page="../detail_Modal/detail_nonLogin.jsp"/>
   
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/detailPage.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript">

//색깔 선택 시 재고 확인 후 동적으로 구매가능한 사이즈만 확인 
function changeColor(detail_colorSelect){
	$.ajax({
		type : "POST",
		url : '/MultiShop/detail_page/getSelectBox.do',
		dataType : 'json',
		data : {selectColor : detail_colorSelect},
		success : function(data){
			//alert(JSON.stringify(data));
			$('#detail_sizeSelect').find("option").remove().end().append("<option value=''>전체</option>");
			
			$.each(data.sizeList, function(i){
				$('#detail_sizeSelect').append("<option value='"+data.sizeList[i]+"'>"+data.sizeList[i]+"</option>");
			});
			
		},error : function(data){
			alert("에러에러에러에러에러에러에러!");
		}
		
	});//ajax
	
}


/* function categoryChange(){
	
	var black = ["S","M","L","XL"];
	var begie = ["M","L","XL"];
	var green = ["S","M"];
	var white = ["L","XL","XXL"];
	
	var selectColor = $("#detail_colorSelect option:selected").val();
	alert(selectColor);
	
	var changeItem;
	
	if(selectColor=="black"){
		changeItem = black;
	}else if(selectColor="begie"){
		changeItem = begie;
	}else if(selectColor="green"){
		changeItem = green;
	}else if(selectColor="white"){
		changeItem = white;
		alert(changeItem);
	}
	
	$('#detail_sizeSelect').empty();
	
	for(var i=0; i<changeItem.length; i++){
		alert(changeItem[i]);
		var newOption = $("<option>"+changeItem[i]+"</option>");
		$('#detail_sizeSelect').append(newOption);
	}
	
	
	
	/* for (x in choose) {
	    var opt = document.createElement("option");
	    opt.value = choose[x];
	    opt.innerHTML = choose[x];
	    target.appendChild(opt);
	}  
	
} */

$(document).ready(function(){
	
	//이미지 확대 기능
	$(".xzoom").xzoom();
	
	var option_arr =[];
	//상세페이지 값너어주기
	var k = 0;
	var j = 0;
	$.ajax({
		type : 'POST',
		url : '/MultiShop/detail_page/getDetailPage.do',
		data : {'p_code':'${p_code}'},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			alert(data.product_boardDTO.p_COST);
			
			alert(data.product_boardDTO.p_name + data.product_boardDTO.p_contents);
			$('#product_price').text(data.product_boardDTO.p_COST+"원");
				
			$.each(data.detail_list, function(index, items){
				//alert("index : " + index +"items : " + items);			//index 변수명, items 값
				//alert(items.p_midCate);
				$.each(items, function(i, t){
					option_arr[k] = t;
					k++;
				});
			});
			//alert(option_arr);
			/* 
			alert(JSON.stringify(data));
			var detail_list = data.detail_list;
			alert(detail_list[0]);
			var jbSplit = jbString.split('/');
			alert(jbSplit); */
			/*
			for(var i in JwSplit){
				console(JwSplit[i]);
			} */
		},error : function(data){
			alert("에러발생!@!@");	
		}
		
	});

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
	
});

</script>
</html>
