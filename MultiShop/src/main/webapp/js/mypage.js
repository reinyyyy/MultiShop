
 /* mypage */
   $('#mypageBtn').on('click',function(){
      location.href="../mypage/mypage.do";      
   });
   /* member modify */
   
   $('#mypage_member_modifyBtn').on('click',function(){
	   location.href="../mypage/membermodifyconfirmForm.do";
   });
   
   $('#member_modify_confirm_Btn').on('click',function(){
      var pwd = $('#member_modify_pwd');
      if(pwd.val()==''){
         $('#member_modify_statusDiv').text('비밀번호를 입력해주세요').css('color','red');
      }else{
         $.post('/MultiShop/mypage/membermodifyconfirm.do',
               $('#member_modify_confirm_form').serialize(),
               function(data){
                  if(data=='true'){
                     location.href='/MultiShop/mypage/memberModifyForm.do'
                  }else{
                     $('#member_modify_statusDiv').text('비밀번호가 맞지않습니다').css('color','red');
                  }
         },'text');
      }
   });
   
   $('#member_modify_pwd').blur(function(){
      if($('#member_modify_pwd').val()==""){
         $('#member_modify_statusDiv').text('비밀번호를 입력하세요.').css('color','red');
         $('#member_modify_pwd').css({'border':'1px solid red'});
      }else if(!Mw_regPwd.test($('#member_modify_pwd').val())){
         $('#member_modify_statusDiv').text("비밀번호는 6자리 이상입니다").css('color','red');
         $('#member_modify_pwd').css({'border':'1px solid red'});
      }else{
         $('#member_modify_statusDiv').text('');
         $('#member_modify_pwd').css({'border':''});
      }
   });
   
   $('#member_modify_repwd').blur(function(){
      if($('#member_modify_repwd').val()==''){
         $('#member_modify_statusDiv').text("비밀번호 다시 입력하세요").css('color','red');
         $('#member_modify_repwd').css({'border':'1px solid red'});
      }else if(!Mw_regPwd.test($('#member_modify_repwd').val())){
         $('#member_modify_statusDiv').text("비밀번호는 6자리 이상입니다").css('color','red');
         $('#member_modify_repwd').css({'border':'1px solid red'});
      }else if($('#member_modify_pwd').val()!= $('#member_modify_repwd').val()){
         $('#member_modify_statusDiv').text("비밀번호가 일치하지 않습니다").css('color','red');
         $('#member_modify_repwd').css({'border':'1px solid red'});
      }else{
         $('#member_modify_statusDiv').text('');
         $('#member_modify_repwd').css({'border':''});
      }
   });
   
   $('#member_modify_name').blur(function(){
      if($('#member_modify_name').val()==""){
         $('#member_modify_statusDiv').text('이름을 입력해주세요.').css('color','red');
         $('#member_modify_name').css({'border':'1px solid red'});
      }else if(!Mw_regName.test($('#member_modify_name').val())){
         $('#member_modify_statusDiv').text('이름은 한글만 가능합니다').css('color','red');
         $('#member_modify_name').css({'border':'1px solid red'});
      }else{
         $('#member_modify_statusDiv').text('');
         $('#member_modify_name').css({'border':''});
      }
   });
   
   $('#member_modify_phone').blur(function(){
      if($('#member_modify_phone').val()==""){
         $('#member_modify_statusDiv').text('전화번호를 입력해주세요.').css('color','red');
         $('#member_modify_phone').css({'border':'1px solid red'});
      }else if(!Mw_regPhone.test($('#member_modify_phone').val())){
         $('#member_modify_statusDiv').text("전화번호 형식이 맞지 않습니다").css('color','red');
         $('#member_modify_phone').css({'border':'1px solid red'});
      }else{
         $('#member_modify_statusDiv').text('');
         $('#member_modify_phone').css({'border':''});
      }
   });
   
   
   $('#member_modifyBtn').on('click',function(){
      if(Mw_regName.test($('#member_modify_name').val()) && Mw_regPwd.test($('#member_modify_pwd').val())
            && ($('#member_modify_repwd').val()== $('#member_modify_pwd').val()) && Mw_regEmail.test($('#member_modify_email').val()) 
            && Mw_regPhone.test($('#member_modify_phone').val())){
         if($('#member_modify_roadAddress').val()==""){
            $('#member_modify_statusDiv').text('우편번호찾기를 해주세요.').css('color','red');
            $('#member_modify_postcode').css({'border':'1px solid red'});
         }else{
            $(this).find('input').css({'border':''});
            $.post('/MultiShop/mypage/memberModify.do',
                  $('#member_modify_form').serialize(),
                  function(data){
                     if(data=='true'){
                        $('#member_modify_complete_modal').modal({backdrop: 'static', keyboard: false});
                     }
                  },'text'
               );
         }
      }
   });
   $('#member_modify_complete_modalBtn').on('click',function(){
      $.post('/MultiShop/member/logout.do',
            function(data){
               $('#member_modify_complete_modal').modal('hide');
               location.href='/MultiShop/main/index.do';
            }
      );
   });
   
   /* member modify */
   $('#member_modifyBtn').on('click',function(){
      $.post('/MultiShop/member/membermodify.do',
         $('#member_modify_form').serialize(),
         function(data){
            if(data=='true'){
               alert("수정성공");
            }else 
               alert("수정실패");
         },'text'
      );
   });
   
   /*delivery page*/
   $('#mypage_deleveryBtn').on('click',function(){
	   location.href='/MultiShop/mypage/deliveryPage.do'
   });
   
   
   
   
   
   /*find email*/
   $('#find_email_modal_findBtn').on('click',function(){
      var name = $('#find_email_modal_name');
      var phone = $('#find_email_modal_phone');
      
      if(name.val()==''){
         $('#find_email_modal_statusDiv').text('이름을 입력해주세요.').css('color','red');
      }else if(phone.val()==''){
         $('#find_email_modal_statusDiv').text('전화번호를 입력해주세요.').css('color','red');
      }else{
         $.post('/MultiShop/member/findEmail.do',
               $('#find_email_modal_form').serialize(),
               function(data){
                  if(data=='false'){
                     $('#find_email_modal_statusDiv').text('존재하지 않는 이메일입니다.').css('color','red');
                  }else{
                     $('#find_email_modal').modal('hide');
                     $('#find_email_complete_email').text(data);
                     $('#find_email_complete_modal').modal({backdrop: 'static', keyboard: false})
                  }
         },'text'
               );
      }
   });
   /*find pwd*/
   $('#find_pwd_modal_findBtn').on('click',function(){
      var email = $('#find_pwd_modal_email');
      var name = $('#find_pwd_modal_name');
      var phone = $('#find_pwd_modal_phone');
      
      if(email.val()==''){   
         $('#find_pwd_modal_statusDiv').text('이메일을 입력해주세요.').css('color','red');
      }else if(name.val()==''){
         $('#find_pwd_modal_statusDiv').text('이름을 입력해주세요.').css('color','red');
      }else if(phone.val()==''){
         $('#find_pwd_modal_statusDiv').text('전화번호를 입력해주세요.').css('color','red');
      }else{
         $.post('/MultiShop/member/findPwd.do',
               $('#find_pwd_modal_form').serialize(),
               function(data){
            if(data=='false'){
               $('#find_pwd_modal_statusDiv').text('정보가 맞지 않습니다').css('color','red');
            }else if(data=='true'){
            	 $('#find_pwd_modal').modal('hide');
               $.post('/MultiShop/member/sendMail.do',	 
                     $('#find_pwd_modal_form').serialize(),
                     function(data){
                        if(data=='true'){            
                           $('#find_pwd_complete_modal').modal({backdrop: 'static', keyboard: false})
                        }else{
                           console.log('실패');
                        }
                     },'text'
               );
            }
         },'text'
         );
      }
   });