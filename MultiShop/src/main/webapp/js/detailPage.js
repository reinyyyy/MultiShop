$(document).ready(function(){
   //총합계 가격
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
   });
   
   //관심상품 버튼(a태그)
   $('#favoriteBtn').on('click',function(){
      var select_color = $('#detail_colorSelect').val();
      var select_size = $('#detail_sizeSelect').val();
      var select_amount = $('#detail_amountSelect').val();
      
      
      
   });
   
   //장바구니 버튼(a태그)
   $('#basketBtn').on('click',function(){
      var select_color = $('#detail_colorSelect').val();
      var select_size = $('#detail_sizeSelect').val();
      var select_amount = $('#detail_amountSelect').val();
      
      $('#basketModal').modal({backdrop: 'static', keyboard: false});
      
      $('#goBasket').click(function(){
         $('#detail_form').submit();
      });
      
   });
   
   //바로구매 버튼(a태그)
   $('#buyNowBtn').on('click',function(){
      var select_color = $('#detail_colorSelect').val();
      var select_size = $('#detail_sizeSelect').val();
      var select_amount = $('#detail_amountSelect').val();
      
      $('#detail_form').submit();
      
   });
   
   //-----------------------------------------------------------------------
   //양현규
   
   //상품 후기
   $('#btn_hoogi').on('click',function(){
      $('#detail_hoogiModal').modal();
   });

   //상품 후기 작성 버튼
   $('#detail_hoogiSendBtn').on('click',function(){
      console.log("@@@send");
      if($('#detail_hoogiModalContent').val()==""){
         $('#detail_hoogiModalContentDiv').text('글을 입력하세요.').css('color','red').css('font-size','9pt');
      }
      else if($('#detail_hoogiModalContent').val().length>10){
         $('#detail_hoogiModalContentDiv').text('10자내로 입력하시오.').css('color','red').css('font-size','9pt');
      }
      else{
         var detail_hoogiStar =  $('input[name="detail_hoogiStar"]:checked').val();
         var detail_hoogiModalContent = $('#detail_hoogiModalContent').val();
         var id = "id";
         var seq= 5;
         $.ajax({
            type : 'POST',
            url : '/MultiShop/detail_page/detail_hoogi.do',
            data : {'detail_hoogiStar': detail_hoogiStar
                  ,'detail_hoogiModalContent':detail_hoogiModalContent
                  ,'id':id
                  ,'seq':seq},
            success : function(){
               location.reload();
               $('#detail_hoogiOkModal').modal('show');
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
      console.log("@@@@@@@");
      $('#detail_QnAModal').modal('show');
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
         var id = "id";
         var seq = 10;
         var condition = $('input[name="detail_QnACondition"]:checked').val();
         var detail_QnASubject = $('#detail_QnASubject').val();
         var detail_QnAContent = $('#detail_QnAContent').val();
         $.ajax({
            type : 'POST',
            url : '/MultiShop/detail_page/detail_QnA.do',
            data : {'seq':seq,
                  'id':id,
                  'condition':condition,
                  'detail_QnASubject':detail_QnASubject,
                  'detail_QnAContent':detail_QnAContent},
            success : function(){
               location.reload();
            }
         });
      }
   });
   
   
   //상품 Q&A view seq
   var seq = '';
   //상품문의 제목
   $('.detail_QnA_ContactUs').on('click',function(){
      seq = $(this).parent().prev().prev().text();
      $('#detail_QnAModalView').modal();
   });
   
   //상품문의(Q&A) 모달 이 실행 시 안에 내용 ajax
   $('#detail_QnAModalView').on('show.bs.modal',function(){
      $.ajax({
         type : 'POST',
         url : '/MultiShop/detail_page/detail_ContactUs.do',
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
   
   //
   $('#detail_QnASendViewBtn').on('click',function(){
      
   });
   
   
});