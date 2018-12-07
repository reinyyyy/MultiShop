$(document).ready(function(){
   /*//총합계 가격
   var totalPrice = parseFloat($('#totalPrice').text());
   $('#totalPrice').text(totalPrice.toLocaleString());
   
   //수량이 변경 할 때
   $(document).on('change',"#detail_amountSelect",function(){
      // 선택된 개수 값
      var select_amount = $('#detail_amountSelect').val();
      
      if(select_amount==1){
         $('#totalPrice').text((totalPrice).toLocaleString());
      }else if(select_amount==2){
         $('#totalPrice').text((totalPrice*2).toLocaleString());
      }else if(select_amount==3){
         $('#totalPrice').text((totalPrice*3).toLocaleString());	
      }else if(select_amount==4){
         $('#totalPrice').text((totalPrice*4).toLocaleString());
      }else if(select_amount==5){
         $('#totalPrice').text((totalPrice*5).toLocaleString());
      }else if(select_amount==6){
         $('#totalPrice').text((totalPrice*6).toLocaleString());
      }else if(select_amount==7){
         $('#totalPrice').text((totalPrice*7).toLocaleString());
      }else if(select_amount==8){
         $('#totalPrice').text((totalPrice*8).toLocaleString());
      }else if(select_amount==9){
         $('#totalPrice').text((totalPrice*9).toLocaleString());
      }else if(select_amount==10){
         $('#totalPrice').text((totalPrice*10).toLocaleString());
      }
   });*/
   
   //관심상품 버튼(a태그)
   $('#favoriteBtn').on('click',function(){
      var select_color = $('#detail_colorSelect').val();
      var select_size = $('#detail_sizeSelect').val();
      var select_amount = $('#detail_amountSelect').val();
   });
   
   //장바구니 버튼(a태그)
  /* $('#basketBtn').on('click',function(){
      //var select_color = $('#detail_colorSelect').val();
      //var select_size = $('#detail_sizeSelect').val();
      //var select_amount = $('#detail_amountSelect').val();
      var session_email = $('#session_email').val();
      var select_color = $('#option_select1').val();
      var select_size = $('#option_select2').val();
      var select_amount = $('#amount_input').val();
      
      $('#basketModal').modal({backdrop: 'static', keyboard: false});
      
      $('#goBasket').click(function(){
    	  if(session_email.length<=0){
        	  $('#detail_nonLoginModal').modal({backdrop: 'static', keyboard: false});
    	    	  
        	  //장바구니 비 로그인시
        	  $('#detail_loginBtn').click(function(){
        		  $('#basketModal_xBtn').trigger('click');
        		  $('#non_loginCloseBtn').trigger('click');
        		  $('#login_modal').modal({backdrop: 'static', keyboard: false});
    		  });
          }else if(session_email.length>0){
        	  location.href="../mypage/mypage.do"
        	  //나중에 장바구니 만들어지면 추가로 컨트롤러 만들어서 보내줄 것 지금은 임시로 마이페이지로 이동함
          }
    	  
      });
      
   });*/
   
   //바로구매 버튼(a태그)
   /*$('#buyNowBtn').on('click',function(){
	  //alert($('#option_select1').val());
	  //alert($('#option_select2').val());
      //alert($('#amount_input').val());
	  var select_color = $('#option_select1').val();
      var select_size = $('#option_select2').val();
      var select_amount = $('#amount_input').val();
      var session_email = $('#session_email').val();
      //alert(session_email.length);
      
      if(session_email.length<=0){
    	  $('#detail_nonLoginModal').modal({backdrop: 'static', keyboard: false});
	    	  
    	  //바로구매 비 로그인시
    	  $('#detail_loginBtn').click(function(){
    		  $('#non_loginCloseBtn').trigger('click');
    		  $('#login_modal').modal({backdrop: 'static', keyboard: false});
		  });
      }else if(session_email.length>0){
    	  $('#detail_form').submit();
      }
      
      
   });*/
   //바로구매 이사감..
   
   //-----------------------------------------------------------------------
   //양현규
   
   //상품 후기
   $('#btn_hoogi').on('click',function(){
      $('#detail_hoogiModal').modal();
   });

   //상품 후기 작성 버튼
   $('#detail_hoogiSendBtn').on('click',function(){
      if($('#detail_hoogiModalContent').val()==""){
         $('#detail_hoogiModalContentDiv').text('글을 입력하세요.').css('color','red').css('font-size','9pt');
      }
      else if($('#detail_hoogiModalContent').val().length>10){
         $('#detail_hoogiModalContentDiv').text('10자내로 입력하시오.').css('color','red').css('font-size','9pt');
      }
      else{
         var detail_hoogiStar =  $('input[name="detail_hoogiStar"]:checked').val();
         var detail_hoogiModalContent = $('#detail_hoogiModalContent').val();
         var id = $('#session_email').val();
         alert(id);
         /*var p_code = $('#p_code').val();*/
         var p_code = 1;
         $.ajax({
            type : 'POST',
            url : '/MultiShop/detail_page/detail_hoogi.do',
            data : {'detail_hoogiStar': detail_hoogiStar
                  ,'detail_hoogiModalContent':detail_hoogiModalContent
                  ,'id':id
                  ,'p_code':p_code},
            success : function(){
            	location.reload();
            	alert("글쓰기 완료");
            }
         });
      }
   });
   
   
   //상품후기 모달 종료시 초기화
   $('#detail_hoogiModal').on('hidden.bs.modal',function(){
      $(this).find('form')[0].reset()
      $('#detail_hoogiModalContentDiv').empty();
   });
   
   
   //Q&A
   $('#detail_Btn_QnA').on('click',function(){
      $('#detail_QnAModal').modal();
   });
   
   
   //상품문의 (Q&A) 전송버튼
   $('#detail_QnASendBtn').on('click',function(){
      
      if($('#detail_QnASubject').val()==""){
         $('#detail_QnASubjectDiv').text('제목을 입력하세요.').css('color','red').css('font-size','9pt');
      }
      else if($('#detail_QnAContent').val()==""){
         $('#detail_QnAContentDiv').text('내용을 입력하세요.').css('color','red').css('font-size','9pt');
      }
      else{
         var id = $('#session_email').val();
    	  /*var p_code = $('#p_code').val();*/
    	  var p_code = 1;
         var condition = $('input[name="detail_QnACondition"]:checked').val();
         var detail_QnASubject = $('#detail_QnASubject').val();
         var detail_QnAContent = $('#detail_QnAContent').val();
         var replyContent = '';
         var reply = 'ready';
         $.ajax({
            type : 'POST',
            url : '/MultiShop/detail_page/detail_QnA.do',
            data : {'p_code':p_code,
            	  	'id':id,
            	  	'condition':condition,
            	  	'detail_QnASubject':detail_QnASubject,
            	  	'detail_QnAContent':detail_QnAContent,
            	  	'replyContent':replyContent,
            	  	'reply':reply},
            success : function(){
               location.reload();
               alert("Q&A작성 완료");
            }
         });
      }
   });
   
   
   //상품 Q&A view seq
   var seq = '';
   //상품문의 제목
   $('.detail_hoogi_alramSpan').on('click',function(){
      seq = $(this).parent().prev().prev().prev().text();
      $('#detail_QnAReplySeq').val(seq);
      $('#detail_QnAModalView').modal();
   });
   
   //상품문의(Q&A) 모달 이 실행 시 안에 내용 ajax
   $('#detail_QnAModalView').on('show.bs.modal',function(){
      $.ajax({
         type : 'POST',
         url : '/MultiShop/detail_page/detail_QnAView.do',
         data : {'seq':seq},
         dataType : 'json',
         success : function(data){
            $.each(data, function(index,items){
               $('#detail_QnASubjectView').val(items.detail_QnASubject);
               $('#detail_QnAContentView').val(items.detail_QnAContent);
            });
         }
      });
   });
   
   //QnA 답변 완료
   $('#detail_QnASendViewBtn').on('click',function(){
      var seq = $('#detail_QnAReplySeq').val();
      var detail_QnAReplyView = $('#detail_QnAReplyView').val();
      var reply = 'complet';
      
      $.ajax({
    	  type : 'POST',
    	  url : '/MultiShop/detail_page/detail_QnA_Answer.do',
    	  data : {'seq':seq,
    		  	  'replyContent':detail_QnAReplyView,
    		  	  'reply':reply},
    	  success : function(){
    		  location.reload();
    	  }
      });
   });
   //테이블 보기/숨기기 스위치
   var click=0;
   //Q&A 보기
   $('.detail_QnA_ContactUs').on('click',function(){
	   var seq =$(this).parent().prev().prev().text();
	   var appendTr = $(this).parent().parent();
	   if(click == 1){
		   click=0;
		   $('.detail_QnAView_remove').parent().remove();
	   }
	   else{
		   click = 1;
		   $.ajax({
			   type : 'POST',
			   url : '/MultiShop/detail_page/detail_QnA_List.do',
			   data :{'seq':seq},
			   dataType : 'json',
			   success : function(data){
				   $.each(data.detail_QnA_List , function(index,items){
					   
					   var result;
					   if(items.replyContent == null){
						   result = '등록된 답변이 없습니다.';
					   }else{
						   result = items.replyContent;
					   }
						   
					   $('<tr/>').append($('<td/>',{
						   class : 'detail_QnAView_List detail_QnAView_remove',
						   align : 'center',
						   colspan : '2',
						   height : '100',
						   html : '<img src ="../image/QnA_A.png" style="width : 20px; height : 20px;">'
					   })).append($('<td/>',{
						   class : 'detail_QnAView_List',
						   align : 'center',
						   colspan : '4',
						   text : result,
					   })).insertAfter(appendTr);
					   $('<tr/>').append($('<td/>',{
						   class : 'detail_QnAView_List detail_QnAView_remove',
						   align : 'center',
						   colspan : '2',
						   height : '100',
						   html :'<img src="../image/QnA_Q.png" style="width : 20px; height : 20px;">'
					   })).append($('<td/>',{
						   class : 'detail_QnAView_List',
						   align : 'center',
						   colspan : '4',
						   text : items.detail_QnAContent
					   })).insertAfter(appendTr);
				   });
			   }
		   });
   		}
   });
});