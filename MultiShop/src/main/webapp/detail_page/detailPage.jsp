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
	<input type = "hidden" id="session_email" value="${session_email}">
	<input type = "hidden" id="p_code" value="${p_code}">
	<input type = "hidden" name = "p_status" id = "p_status" value = "">
   <header>
      <div class="container">
         <div id="productView">
         <div id="productPopup" >
            <div class="productPopupWrap">
                  <div class="popLeft">
                     <div class="popupSlide">
                          <div class="mask">
                          	<img class="xzoom" id="detailMain_image" src="../image/product_ready.jpg" xoriginal="../image/product_ready.jpg">
                          </div>
                       <div class="pagerWrap xzoom-thumbs" id="gallery_01" style="text-align:center;">
                          <!-- <a href="#" class="">
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
                          </a> -->
                       </div>
                  </div>
               </div>
            <form id ="detail_form" method="post" action="orderPage.do">
            <input type = "hidden" name="p_code" id = "p_code" value = "${p_code}">
			
            <div class="popRight">
               <span class="viewTitle">${productDTO.p_name}</span>
               <input type="hidden" id="productName" name="productName" value="JCoat">
<!--                   <p class="sub">실 제본으로 책장이 넘기기 쉬운 노트</p> -->
               <p class="sub"></p>
               <div class="aboutList">
               
                  <ul class="aboutListTop">
                     <li>
                        <dl>
                           <dt>판매가</dt>
                           <%-- <dd id="product_price">￦&emsp;<fmt:formatNumber value="${productDTO.p_cost }" pattern="#,###" /></dd>      <!-- 가격 --> --%>
                           <dd id = "cost">￦&emsp;<fmt:formatNumber value="${productDTO.p_cost}" pattern="#,###" /> </dd>		<!-- 가격 -->
                        </dl>
                     </li>
                   
                   
                     <input type="hidden" name="p_cost" id="product_price" value="${productDTO.p_cost }">
                     <li>
                        <dl>
                           <dt>배송비</dt>
                           <dd>무료</dd>
                        </dl>
                     </li>
                  </ul>
                  <ul class="aboutListBottom">
                     <li>
                        <dl>
                           <dt>상품코드</dt>
                           <dt id="product_code">${p_code}</dt>
                          
                           <!-- <input type="hidden" name="p_midCate" id="p_midCate" value="">
                           <input type="hidden" name="p_smallCate" id="p_smallCate" value=""> -->
                           
                        </dl>
                     </li>
                     <li>
                        <dl>
                           <dt>제조국가</dt>
                           <dd>${productDTO.p_origin }</dd>
                        </dl>
                     </li>
                    <!--  <li>
                        <dl>
                           <dt>발송예정일</dt>
                           <dd>12월 25일 이내</dd>
                        </dl>
                     </li> -->
                     <!-- <li>
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
                                    <option value="S" selected="selected">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option>
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
                     </li> -->
                  </ul>
                  </div>
                     <div class="productCon02">
                        
                     </div>
                     <div class="conWrap">
                        <div class="totalWrap">
                           <span>총합계 </span>
                           <%-- <span id="totalPrice" class="totalPrice" ><fmt:formatNumber value="${productDTO.p_cost}" pattern="#,###" /></span> --%>
                           <span id="totalPrice" class="totalPrice" ></span>
                        </div>
                     </div>
                     <div class="btnWrap" style="text-align: right;">
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
            <%-- <h5>${product_boardDTO.p_image}</h5> --%>
            <c:if test = "${detail_image_arr != null}">
            	<c:forEach var="img" items="${detail_image_arr}" varStatus = "index">
            		<c:if test = "${index.count != 1}">
            			<img src="../upload/${img}"><br>
            		</c:if>
            	</c:forEach>
            </c:if>
<%--             <c:if test = "${product_boardDTO != null}">
            	<c:forEach var="img" items="${product_boardDTO.p_image }">
            		<img src="../upload/${product_boardDTO.p_image }">
            	</c:forEach>
            </c:if> --%>
           <!-- <img style="width : 100%;" src="../image/makeup.jpg"><br> -->
           <!-- <img style="width : 100%;" src="../image/makeup1.jpg"> -->
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
/* function changeColor(detail_colorSelect){
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
	
} */


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
	/* //이미지 확대 기능
	$(".xzoom").xzoom();
	
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
	}); */
	
	
	
	/* 재우 상세페이지 값 불러오는 ajax
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
			} 
		},error : function(data){
			alert("에러발생!@!@");	
		}
		
	}); */
	
	var p_status = new Array();	//판매상태
	
	var img_param = "${productDTO.p_image}";
	var result = img_param.split('/');
	//alert(result[1]);
	//var img_tag = '<img class="xzoom" src ="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'" xoriginal="../upload/'+result[1]+'">'; 
	$('.mask').children().attr('src',  '../upload/'+result[1]).attr('xoriginal', '../upload/'+result[1]);
	//$('.mask').html(img_tag);
	var img_length = result.length-1;	//이미지 개수
	var img_tag = '';
	$.each(result, function(index, items){
		if(index > 0 && items != undefined){
			img_tag += '<a href = "#" class = "sumImg"> <img class="xzoom-gallery" style = "width: 100px; height : 100px;" id = "" src = "../upload/'+items+'">';
		}
	});
	$('.pagerWrap').html(img_tag);
	
	
	
	/*
				EL로 받아오면 모두 string 타입으로 데려오기때문에 [ 지워줘야함 ]
	*/			
	
	
	// 1. select 레이아웃 생성
	// 2. option_DTO 생성
	// 3. 상위 select 하나만 중복제거해서 보여주고, 그 아래 하위들은 동적으로 생성되게 만들기
	
	
	
	
	var amount = [];//수량
	amount[0] = '수량';
	
	var option_name = '';			//
	var option_tag = '<option>옵션선택</option>';	//기본
	var class_index = '';			
	var option_result = '';			
	var option_DTO = [];
	var amount_index;
	//alert("${option_result_list}");		[[색상, 블랙, 블랙, 레드, 레드], [사이즈, 미디움, 라지, 미디움, 스몰]]  Type = String
	var total_size = 1;
	
	//옵션 없는경우 disabled 해제
	var p_code_list = new Array();
	
	var no_option_index = 0;
	<c:forEach items="${group_list}" var = "p_code" varStatus = "first_index">
		p_code_list[Number("${first_index.count}")] = "${p_code.p_code}";
		//alert("${p_code.p_code}" + "의 판매상태 : " + "${p_code.p_status}");
		p_status[Number("${first_index.count}")] = "${p_code.p_status}";
		no_option_index += 1;
	</c:forEach>
	p_code_list.splice(0, 1);
	
	
	p_status.splice(0, 1);
	//alert(p_status);
	
	
	<c:forEach items="${option_result_list}" var="item1" varStatus = "first_index">
		
		var option_list = "${item1}";
		//alert(option_list);		//index 0 : [색상, 블랙, 블랙, 레드, 레드], index 1 : [사이즈, 미디움, 라지, 미디움, 스몰]	Type = String //9:23
		
		
		var split_result = option_list.replace('[', '').replace(']', '').split(/[\s,]+/);		
		//inedx 0 : 색상,블랙,블랙,레드,레드	index 1 : 사이즈,미디움,라지,미디움,스몰	Type = 배열
		
		option_DTO["${first_index.count-1}"] = split_result;
		amount_index = "${first_index.count}";
		
		//중복제거
		var ovl_result = [];
		$.each(split_result, function(i, el){
			if($.inArray(el, ovl_result) === -1) ovl_result.push(el);
		});
		
		//중복제거 후 코드
		
		$.each(ovl_result, function(index, item){
			if(index == 0){
				option_name = '<dt>'+item+'</dt>';
			}else {
				option_tag += '<option value = "'+item+'" >'+item+'</option>';
			}
			if("${first_index.count}" != 1){
				option_tag = '';
			}
			class_index = index;		//클래스명 지을때 씀
		});
		
		option_result +=
		'<li>'+
			'<dl id = "option_'+class_index+'">'+
				option_name +
				'<dd>' +
					'<div>' +
						'<input type = "hidden" value = "${first_index.count}">'+
						'<select class = "option_select" name="option_select'+'${first_index.count}" id="option_select'+'${first_index.count}">'+
							option_tag +
						'</select>'+
					'</div>'+
				'</dd>'+
			'</dl>'+
		'</li>';
		option_tag = '<option>옵션선택</option>';
	</c:forEach>
	
	var option_length = (option_DTO.length); //옵션 개수			
	
	<c:forEach items = "${amount_list}" var = "amount" varStatus = "amount_index">
		total_size += 1;	//그룹 전체 수량 판단
		amount["${amount_index.count}"] = "${amount}"; 
	</c:forEach>
	//alert(amount);
	
	option_DTO[amount_index] = amount; 
	$.each(option_DTO, function(index, items){
		//alert('완성본 option_DTO['+index+'] : ' + option_DTO[index]);		////9:23
	});
	
	//[amount_index] 재고 인덱스
	//{색상, 블랙, 블랙, 레드, 레드},
	//{사이즈, 미디움, 라지, 미디움, 스몰},
	//{사이즈, 11, 22, 33 , 42}
	
	// {블랙, 미디움, 11},
	// {블랙, 미디움, 11},
	// {블랙, 미디움, 11},
	// {블랙, 미디움, 11},
	
	//첫 옵션제외 두번째 옵션부터 들어옴
	//alert(total_size);		//3	//9:23
	
	var result_DTO = new Array();
	change_arr(option_DTO);
	//p_code_list
	//DTO 행열 바꿔주는 함수
	function change_arr (arr){
		//alert(arr.length);	//9:23
		var j = 0;
		var k = 1;
		for(var i = 0; i < total_size-1; i++){
			var temp_arr = new Array();
			$.each(arr, function(index, items){
				temp_arr[index] = items[k];
			});
			k++;
			temp_arr[temp_arr.length] = p_code_list[j]; 
			result_DTO[i] = temp_arr;
			j++;
		}
	}
	//option_list_maker(result_DTO);
	 
	//하위 옵션 판단함수
	var user_selected = new Array();
	var i = 0;
	var amount_op;
	function option_list_maker (name, next_index){
		
		if(next_index == 1){	//첫옵션 선택시 초기화
			//user_selected = new Array();
			arr_clear(next_index);	
			$('#amount_input').val('');
			$('#amount_input').attr('disabled', 'true');
		}else{
			arr_clear(next_index);	
		}
		user_selected[i] = name;
		i++;
		var k = 0;
		var op = '';
		$.each(result_DTO, function(index, items){
			if(name == items[next_index-1]){
				if(items[next_index-1] == name){
					//alert(items[next_index-1] +"와 같은 이름 " + name +"사이즈는 " + items[next_index]);
					op += op_maker(items[next_index], op);
				}
				//alert('t : ' + items[next_index-1] + ' 같음');
				if(option_length == next_index){		// 마지막 옵션 선택했을 경우
					
					/*
					
						판단 필요한 거 : result_DTO[] 와  user_selected 에 비교해서 수량 빼내와야댐  
						
						
					*/
					
					var cnt = 1;
					//alert("포문돌기전 유저선택값 " + user_selected);			12/3 7:53
					//alert(user_selected.length);							12/3 7:53
					for(var j = 0; j < user_selected.length; j++){
						if(items[j] == user_selected[j]){
							//alert("같음!! " + items[j]);	
							cnt += 1;
						}else{
							//alert("다름!! " + items[j]);
							cnt = 1;
						}
					}
					if(cnt == user_selected.length+1){		//두 배열이 완전 똑같을경우
						amount_op = items[cnt-1];
						//alert("완전똑같음"+ items);			12/3 7:53
						$('#amount_input').val(1);			//과거 amount_op 엿음
						$('#amount_input').attr('max', amount_op);
						$('#amount_input').removeAttr('disabled');
						$('#p_code').val(result_DTO[index][result_DTO[index].length-1]);	//p_code 선택된거 넘겨줌
						//alert(index);
						//alert(p_status[index]);
						if(p_status[index] == 'Y'){
							$('#product_code').html($('#p_code').val()).css('color', 'black');
						}else{
							$('#product_code').html($('#p_code').val() + ' (품절)').css('color', 'red');
							$('#amount_input').prop('disabled', true);
							$('#amount_input').val('0');
							
							
						}
						
					}
					//alert(amount_op);	
					
					k = 0;
					//alert("선택해온 값 " + user_selected);		12/3 7:53
					//alert("개수..."+ amount);			12/3 7:53
				}
			}
		});
		//var c_option = '<option>'+
		$('#option_select'+(Number(next_index)+1)).html('<option>옵션선택</option>'+op);
		
	}
	

	
	//선택한값 삭제 함수
	function arr_clear(start_num){
		for(var z = (start_num-1); z < user_selected.length; z++){
			user_selected.splice(z, 1);
		}
		i = start_num-1;
		
	}
	
	function op_maker(op_value, op){
		if(op == '<option>'+op_value+'</option>'){
			return ''; 
		}else{
			return '<option>'+op_value+'</option>';
		}
	}
	
	$(document).on('change', '.option_select', function(){
		//alert($(this).val());			11:55
		//alert($(this).prev().val());	11:55
		//{블랙, 미디움, 11}
		reset($(this).prev().val());	
		option_list_maker($(this).val(), $(this).prev().val()); 
		
	});
		
	function reset(remove_num){
		var val = Number(remove_num)+2;
		for(var i = 0; i < option_length; i++){
			$('#option_select'+val).empty().append('<option>옵션선택</option>');
			val += 1;
		}
	} 
	
	
	
	
	//사이즈 생성
	var amount_input =
		'<li>'+
			'<dl id = "amount_list">'+
				'<dd>' +
					'<div>' +
						'<dt>수량</dt>' +
						'<dd style = "width : 12%;">' +
							'<input name = "amount_input" class = "form-control text-center" id = "amount_input" disabled="true" type="number" min="1" max="99"id="yourid">'+
						'</dd>' +
					'</div>'+
				'</dd>'+
			'</dl>'+
		'</li>';
	
	var total_price = Number("${productDTO.p_cost}");
		
	
	
	//수량 체인지 이벤트
	$(document).on('keypress','#amount_input', function () {
		
		if(Number($(this).val()) > amount_op){
			$('#amount_input').val(amount_op);
			price = total_price * $(this).val();
			$('#totalPrice').html('￦ ' + (price.toLocaleString()));
		}else if(Number($(this).val()) < 0){
			$('#amount_input').val(0);	
		};
	});
	
	$(document).on('blur','#amount_input', function(){
		
		if(Number($(this).val()) > amount_op){
			$('#amount_input').val(amount_op);
			price = total_price * $(this).val();
			$('#totalPrice').html('￦ ' + (price.toLocaleString()));
		}else if(Number($(this).val()) < 0 ){
			$('#amount_input').val(0);
			$('#totalPrice').html('￦ 0');
		};
	});
	
	$(document).on('change', '#amount_input', function(){
		
		var price = total_price * Number($(this).val());
		$('#totalPrice').html('￦ ' + (price.toLocaleString()));
		console.log(price);
	});
	
	
	
	/* $('#wr_2').on('keyup', function() {
	    this.value = this.value.replace(/\D/g, '');
	    if (this.value > 150) this.value = 150;
	}); */
	
	//옵션 생성 해서 집어넣음
	var temp = $('.aboutListBottom').html() + option_result + amount_input;
	$('.aboutListBottom').html(temp);
	
	//이미지 확대 기능
	$(".xzoom").xzoom();
	

	 //이미지 변경
	 $(document).on('click', '.xzoom-gallery', function(){
		var src = $(this).attr('src');
		$('.mask').children().attr('src', src).attr('xoriginal', src);
	 });
	
	 
	for(var i = 2; i < option_DTO.length; i++){
		$('#option_select'+i).html('<option>옵션선택</option>');
	}	
	
	
	if("${option_result_list}" == ''){
		amount_op = Number("${amount_list[0]}");
		$('#amount_input').attr('max', amount_op);
		$('#amount_input').removeAttr('disabled');
	}
	//품절체크
	if(no_option_index == 1 && p_status[0] == 'N'){
		$('#product_code').html($('#p_code').val() + ' (품절)').css('color', 'red');
		$('#amount_input').prop('disabled', true);
	}
	
	//alert(option_length);
	//구배버튼
	$('#buyNowBtn').click(function(){
			var session_email = $('#session_email').val();
			if(session_email.length<=0){
		    	  $('#detail_nonLoginModal').modal({backdrop: 'static', keyboard: false});
			    	  
		    	  //바로구매 비 로그인시
		    	  $('#detail_loginBtn').click(function(){
		    		  alert("비로그인구매임");
		    		  $('#non_loginCloseBtn').trigger('click');
		    		  $('#login_modal').modal({backdrop: 'static', keyboard: false});
				  });
		    	  
		    	  return;
		    }else if(session_email.length>0){
		    	
		    	var no_order = 0;
				for(var i = 1; i < option_length+1; i++){
					var temp = 'option_select'+i;
					if($('#'+temp).val() == '옵션선택'){
						no_order++;
					}
				}
				
		    	if(no_order != 0 ){
					alert("옵션을 선택해주세요");						
				}else if($('#amount_input').val() == '' || $('#amount_input').val() < 0){
					alert("수량을 선택해주세요");
				}else if($('#amount_input').val() == '0'){
					alert("품절된 상품입니다");
				}else{
					alert("p_code : " + $('#p_code').val() + "성공");
					$('#detail_form').submit();
				}
		    }
			
		});
	$('#totalPrice').html('￦ ' + (Number("${productDTO.p_cost}").toLocaleString()));
	
});

</script>
</html>
