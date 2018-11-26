<<<<<<< HEAD
$(document).ready(function(){
   //결재하기
   $('#orderPayBtn').click(function(){
      var firstName = $('#firstName').val();
      var lastName = $('#lastName').val();
      var userName = $('#userName').val();
      var email = $('#email').val();
      var postCode = $('#join_modal_postcode').val();
      var roadAddress = $('#join_modal_roadAddress').val();
      var jibunAddress = $('#join_modal_jibunAddress').val();
      var cc_name = $('#cc_name').val();
      var cc_number = $('#cc_number').val();
      var cc_expiration1 = $('#cc_expiration1').val();
      var cc_expiration2 = $('#cc_expiration2').val();
      var cc_cvv = $('#cc_cvv').val();
      
      
      $('#firstNameDiv').empty();
      $('#lastNameDiv').empty();
      $('#userNameDiv').empty();
      $('#emailDiv').empty();
      $('#cc_nameDiv').empty();
      $('#cc_numberDiv').empty();
      $('#cc_expirationDiv').empty();
      $('#cc_cvvDiv').empty();
      
      if(firstName.length==0)
         $('#firstNameDiv').html('<span style="color:red;font-size:8pt">이름을 입력하세요.</span>')
         //alert($('#firstProductPrice').text())
      else if(lastName.length==0)
         $('#lastNameDiv').html('<span style="color:red;font-size:8pt">성을 입력하세요.</span>')         
      else if(userName.length==0)
         $('#userNameDiv').html('<span style="color:red;font-size:8pt">전체 이름을 입력하세요.</span>')         
      else if(email.length==0)
         $('#emailDiv').html('<span style="color:red;font-size:8pt">이메일주소를 입력하세요.</span>')         
      else if(cc_name.length==0)
         $('#cc_nameDiv').html('<strong style="color:red;font-size:8pt">카드 소유자의 이름을 입력하세요.</strong>')
      else if(cc_number.length==0)
         $('#cc_numberDiv').html('<strong style="color:red;font-size:8pt">모든 카드의 번호를 입력하세요.</strong>')
      else if(cc_expiration1.length==0)
         $('#cc_expirationDiv').html('<strong style="color:red;font-size:8pt">올바른 유효기간을 입력하세요.</strong>')
      else if(cc_expiration2.length==0)
         $('#cc_expirationDiv').html('<strong style="color:red;font-size:8pt">올바른 유효기간을 입력하세요.</strong>')
      else if(cc_cvv.length==0)
         $('#cc_cvvDiv').html('<strong style="color:red;font-size:8pt">CVV/CVC번호를 입력하세요.</strong>')
      else 
         $.ajax({
        	 type :'POST',
        	 url : '/MultiShop/detail_page/successOrderPage.do',
        	 data : {},
        	 success : function(){
        		 
        	 },error : function(){
        		 alert("에러발생!!!!");
        	 }
         });
      
   });
   
 //장바구니 체크박스 선택삭제
   $('#deleteProduct').on('click',function(){
      var count = $('.productCheckBox:checked').length;
    
     /* if(count!=0){
			$('#checkBoxForm').submit();
      }else{
			alert("count="+count);
			alert("선택된 항목이 없습니다.");
      }*/
      $('input[name=productCheckBox]:checked').parent().parent().children().last().text('0');
      $('input[name=productCheckBox]:checked').parent().children('#productCodeAndName').text('선택한 상품 없음');
      
      var firstProductPrice = $('#firstProductPrice').text();
      var secondProductPrice = $('#secondProductPrice').text();
      var thirdProductPrice = $('#thirdProductPrice').text();
      
      firstProductPrice = parseFloat(firstProductPrice);
      secondProductPrice = parseFloat(secondProductPrice);
      thirdProductPrice = parseFloat(thirdProductPrice);
      var totalPrice = (firstProductPrice+secondProductPrice+thirdProductPrice);
      
      totalPrice = parseFloat(totalPrice);
      var mileage = $('#mileage').text((totalPrice*0.03));
      
      $('#order_totalPrice').text(totalPrice+"원");
      
      //$('#basketDiv').load('/MultiShop/detail_page/orderPage.do');
   });
   
   //우편번호
   function execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               var fullAddr = ''; 
               var extraAddr = '';

               if (data.userSelectedType === 'R') {
                   fullAddr = data.roadAddress;
               } else {
                   fullAddr = data.jibunAddress;
               }

               if(data.userSelectedType === 'R'){
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }
               document.getElementById('join_modal_postcode').value = data.zonecode;
               document.getElementById('join_modal_roadAddress').value = fullAddr;
               document.getElementById('join_modal_jibunAddress').focus();
           }
       }).open();
   }
   
   
   
=======
$(document).ready(function(){
   //결재하기
   $('#payBtn').click(function(){
      var firstName = $('#firstName').val();
      var lastName = $('#lastName').val();
      var userName = $('#userName').val();
      var email = $('#email').val();
      var cc_name = $('#cc_name').val();
      var cc_number = $('#cc_number').val();
      var cc_expiration1 = $('#cc_expiration1').val();
      var cc_expiration2 = $('#cc_expiration2').val();
      var cc_cvv = $('#cc_cvv').val();
      
      $('#firstNameDiv').empty();
      $('#lastNameDiv').empty();
      $('#userNameDiv').empty();
      $('#emailDiv').empty();
      $('#cc_nameDiv').empty();
      $('#cc_numberDiv').empty();
      $('#cc_expirationDiv').empty();
      $('#cc_cvvDiv').empty();
      
      if(firstName.length==0)
         $('#firstNameDiv').html('<span style="color:red;font-size:8pt">이름을 입력하세요.</span>')
      else if(lastName.length==0)
         $('#lastNameDiv').html('<span style="color:red;font-size:8pt">성을 입력하세요.</span>')         
      else if(userName.length==0)
         $('#userNameDiv').html('<span style="color:red;font-size:8pt">전체 이름을 입력하세요.</span>')         
      else if(email.length==0)
         $('#emailDiv').html('<span style="color:red;font-size:8pt">이메일주소를 입력하세요.</span>')         
      else if(cc_name.length==0)
         $('#cc_nameDiv').html('<strong style="color:red;font-size:8pt">카드 소유자의 이름을 입력하세요.</strong>')
      else if(cc_number.length==0)
         $('#cc_numberDiv').html('<strong style="color:red;font-size:8pt">모든 카드의 번호를 입력하세요.</strong>')
      else if(cc_expiration1.length==0)
         $('#cc_expirationDiv').html('<strong style="color:red;font-size:8pt">올바른 유효기간을 입력하세요.</strong>')
      else if(cc_expiration2.length==0)
         $('#cc_expirationDiv').html('<strong style="color:red;font-size:8pt">올바른 유효기간을 입력하세요.</strong>')
      else if(cc_cvv.length==0)
         $('#cc_cvvDiv').html('<strong style="color:red;font-size:8pt">CVV/CVC번호를 입력하세요.</strong>')
      else 
         $('#').submit();
      
   });
   
>>>>>>> refs/remotes/origin/minu
});