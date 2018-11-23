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
   
});