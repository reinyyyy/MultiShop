$(document).ready(function(){
   
   var Mw_regName = /^[가-힣]+$/;   //한글만 가능 
   var Mw_regId = /^[a-z0-9_]{5,12}$/; //5~12자 영문소문자, 숫자, 특수문자 _ 사용가능
   //var Mw_regPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;   //6-24자리 영문대소문자or숫자or특수기호
   var Mw_regPwd =  /^[a-z0-9_]{6,24}$/;
   var Mw_regPhone =  /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;   //휴대폰 번호 양식
   var Mw_regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; //이메일 양식
   
   /*login modal*/
   $('#login_navbar').on('click',function(){
      $.post('/MultiShop/member/loginForm.do',
            function(data){
               $('#RSAModulus').val(data.RSAModulus);
               $('#RSAExponent').val(data.RSAExponent);
               $('#login_modal').modal({backdrop: 'static', keyboard: false});
            },'json'
      );
      
   });
   
 //로그인모달켜질때 rsa암호화
   $('#login_modal').on('show.bs.modal', function (){
      $.post('/MultiShop/member/loginForm.do',
            function(data){
               $('#RSAModulus').val(data.RSAModulus);
               $('#RSAExponent').val(data.RSAExponent);
               $('#login_modal').modal({backdrop: 'static', keyboard: false});
            },'json'
      );
   });
   
   $('#login_join_navbar').on('click',function(){
      $('#join_modal').modal({backdrop: 'static', keyboard: false});
   });
   
   $('#login_modal_loginBtn').on('click',function(){
        var email = $("#login_modal_email");
        var pwd = $("#login_modal_pwd");
      
        if(email.val()==""){
           $('#login_modal_statusDiv').text('아이디를 입력해주세요.').css('color','red');
        }else if(pwd.val()==""){
           $('#login_modal_statusDiv').text('비밀번호를 입력해주세요.').css('color','red');
        }else{
           var rsa = new RSAKey();
           rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
           $("#RSA_email").val(rsa.encrypt(email.val()));
           $("#RSA_pwd").val(rsa.encrypt(pwd.val()));
           email.val("");
           pwd.val("");
           $.post('/MultiShop/member/login.do',
                 {"RSA_email": $("#RSA_email").val(),"RSA_pwd": $("#RSA_pwd").val()},
                 function(data){
                    if(data=='true'){
                       $('#login_modal').modal('hide');
                       $('#login_complete_modal').modal({backdrop: 'static', keyboard: false});
                       
                    }else if(data=='false'){
                       $('#login_modal_statusDiv').text('없는아이디거나 비밀번호가 틀렸습니다.').css('color','red');
                    }},'text'
           )
        }
        $('#login_complete_modal_Btn').on('click',function(){           
          location.reload();
       });
   });
   
   $('#login_navbar2').on('click',function(){
      $.post('/MultiShop/member/loginForm.do',
            function(data){
               $('#RSAModulus').val(data.RSAModulus);
               $('#RSAExponent').val(data.RSAExponent);
               $('#login_modal').modal({backdrop: 'static', keyboard: false});
            },'json'
      );
   });
   $('#login_modal_loginBtn').on('click',function(){
      
        var email = $("#join_modal_email");
        var pwd = $("#join_modal_pwd");
       
        var rsa = new RSAKey();
        rsa.setPublic($('#RSAModulus').val(),$('#RSAExponent').val());
        
        $("#RSA_email").val(rsa.encrypt(email.val()));
        $("#RSA_pwd").val(rsa.encrypt(pwd.val()));
        
        email.val("");
        pwd.val("");
        
        $('#login_modal_form').validate({
          rules :{RSA_email : {required : true, minlength : 30, 
             remote : $.post('/MultiShop/member/login.do',
                     {"RSA_email": $("#RSA_email").val(),"RSA_pwd": $("#RSA_pwd").val()},
                     function(data){
                        if(data=='true'){
                           $('#login_modal').modal('hide');
                           location.reload();
                        }},'text'
                   )//ajax
          }}
       });

        
   });
   /*logout modal*/
   $('#logout_navbar').on('click',function(){
      $('#logout_modal').modal({backdrop: 'static', keyboard: false}) ;
   });
   /*logout modal*/
   $('#logout_navbar2').on('click',function(){
      $('#logout_modal').modal({backdrop: 'static', keyboard: false}) ;
   });
   $('#logout_modal_logoutBtn').on('click',function(){
      $.post('/MultiShop/member/logout.do',
            function(data){
               $('#logout_modal').modal('hide');
               $('#logout_complete_modal').modal({backdrop: 'static', keyboard: false});
            }
      );
      /*location.href="http://localhost:8080/MultiShop/main/index.do";*/
   });
   $('#logout_complete_modal_Btn').on('click',function(){
	   location.href='/MultiShop/main/index.do';
   });
   
   /*join modal*/
   $('#join_navbar').on('click',function(){
      $('#join_modal').modal({backdrop: 'static', keyboard: false}) ;
      alert('ddd');
      $('#join_modal_email').focus();
   });
   
   $('#join_modal_email').blur(function(){
      if($('#join_modal_email').val()==''){
         $('#join_modal_statusDiv').text('이메일을 입력하세요.').css('color','red');
         $('#join_modal_email').css({'border':'1px solid red'});
      }else if(!Mw_regEmail.test($('#join_modal_email').val())){
         $('#join_modal_statusDiv').text("이메일 형식이 맞지 않습니다").css('color','red');
         $('#join_modal_email').css({'border':'1px solid red'});
      }else{
         $.post('/MultiShop/member/idCheck.do',
               {"email":$('#join_modal_email').val()},
               function(data){
                  if(data!="true"){
                     $('#join_modal_statusDiv').text('');
                     $('#join_modal_email').css({'border':''});
                     $('#join_modal_emailCheck').val('1');
                  }else{
                     $('#join_modal_statusDiv').text("사용중인 이메일입니다.").css('color','red');
                     $('#join_modal_email').css({'border':'1px solid red'});
                  }
               },'text'
               );
      }
   });
   
   $('#join_modal_email').change(function() {
      $('#join_modal_emailCheck').val('0');
   })
   
   $('#join_modal_pwd').blur(function(){
      if($('#join_modal_pwd').val()==""){
         $('#join_modal_statusDiv').text('비밀번호를 입력하세요.').css('color','red');
         $('#join_modal_pwd').css({'border':'1px solid red'});
      }else if(!Mw_regPwd.test($('#join_modal_pwd').val())){
         $('#join_modal_statusDiv').text("비밀번호는 6자리 이상입니다").css('color','red');
         $('#join_modal_pwd').css({'border':'1px solid red'});
      }else{
         $('#join_modal_statusDiv').text('');
         $('#join_modal_pwd').css({'border':''});
      }
   });
   
   $('#join_modal_repwd').blur(function(){
      if($('#join_modal_repwd').val()==''){
         $('#join_modal_statusDiv').text("비밀번호 다시 입력하세요").css('color','red');
         $('#join_modal_repwd').css({'border':'1px solid red'});
      }else if(!Mw_regPwd.test($('#join_modal_repwd').val())){
         $('#join_modal_statusDiv').text("비밀번호는 6자리 이상입니다").css('color','red');
         $('#join_modal_repwd').css({'border':'1px solid red'});
      }else if($('#join_modal_pwd').val()!= $('#join_modal_repwd').val()){
         $('#join_modal_statusDiv').text("비밀번호가 일치하지 않습니다").css('color','red');
         $('#join_modal_repwd').css({'border':'1px solid red'});
      }else{
         $('#join_modal_statusDiv').text('');
         $('#join_modal_repwd').css({'border':''});
      }
   });
   
   $('#join_modal_name').blur(function(){
      if($('#join_modal_name').val()==""){
         $('#join_modal_statusDiv').text('이름을 입력해주세요.').css('color','red');
         $('#join_modal_name').css({'border':'1px solid red'});
      }else if(!Mw_regName.test($('#join_modal_name').val())){
         $('#join_modal_statusDiv').text('이름은 한글만 가능합니다').css('color','red');
         $('#join_modal_name').css({'border':'1px solid red'});
      }else{
         $('#join_modal_statusDiv').text('');
         $('#join_modal_name').css({'border':''});
      }
   });
   
   $('#join_modal_phone').blur(function(){
      if($('#join_modal_phone').val()==""){
         $('#join_modal_statusDiv').text('전화번호를 입력해주세요.').css('color','red');
         $('#join_modal_phone').css({'border':'1px solid red'});
      }else if(!Mw_regPhone.test($('#join_modal_phone').val())){
         $('#join_modal_statusDiv').text("전화번호 형식이 맞지 않습니다").css('color','red');
         $('#join_modal_phone').css({'border':'1px solid red'});
      }else{
         $('#join_modal_statusDiv').text('');
         $('#join_modal_phone').css({'border':''});
      }
   });
   
   $('#join_modal_joinBtn').on('click',function(){
      if(Mw_regName.test($('#join_modal_name').val()) && Mw_regPwd.test($('#join_modal_pwd').val())
            && ($('#join_modal_pwd').val()== $('#join_modal_repwd').val()) && Mw_regEmail.test($('#join_modal_email').val()) 
            && Mw_regPhone.test($('#join_modal_phone').val()) && $('#join_modal_emailCheck').val()=='1'){
         if($('#join_modal_roadAddress').val()==""){
            $('#join_modal_statusDiv').text('우편번호찾기를 해주세요.').css('color','red');
            $('#join_modal_postcode').css({'border':'1px solid red'});
         }else{
            $(this).find('input').css({'border':''});
            $.post('/MultiShop/member/signup.do',
                  $('#join_modal_form').serialize(),
                  function(data){
               if(data=='true'){
                  $('#join_modal').modal('hide');
                  $('#signup_modal').modal('show');
               }
            },'text'
            );
         }
      }
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
   
   
   
   /*logout modal*/
      $('#non_member').on('click',function(){
         $('#mypage_nonmember').modal({backdrop: 'static', keyboard: false}) ;
      });
     
   /* mypage */
   $('#mypageBtn').on('click',function(){
      location.href="../mypage/mypage.do";      
   });
   /* member modify */
   
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
   
   /*delivery page*/
   $('#mypage_deleveryBtn').on('click',function(){
	   location.href='/MultiShop/mypage/deliveryPage.do';
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
   
   
   
   /*modal-hide*/
   $('.modal').on('hidden.bs.modal', function () {
      if($(this).find('form')[0]!=null){
         $(this).find('form')[0].reset();
      }
      $(this).find('input').css({'border':''});
/*      $('html, body').css({'overflow': 'initial', 'height': '100%'}); //scroll hidden 해제 
*/      $('#element').off('scroll touchmove mousewheel'); // 터치무브 및 마우스휠 스크롤 가능
      $('#join_modal_statusDiv').empty();
      $('#login_modal_statusDiv').empty();
      $('#find_email_modal_statusDiv').empty();
      $('#find_pwd_modal_statusDiv').empty();
   	});
   $('#find_email_complete_model').on('hidden.bs.modal',function(){
      $('#find_email_complete_email').text('');
      
   	});
   $('#find_pwd_modal').on('hidden.bs.modal',function(){
	      $('#find_pwd_modal_statusDiv').text('');
	   });
   
   /*modal-show*/
   $('.modal').on('show.bs.modal', function () {
     /* $('html, body').css({'overflow': 'hidden', 'height': '100%'});*/ // 모달팝업 중 html,body의 scroll을 hidden시킴
      $('#element').on('scroll touchmove mousewheel', function(event) { // 터치무브와 마우스휠 스크롤 방지
          event.preventDefault();
          event.stopPropagation();
          return false;
      });
   });
   
   $('#noticeBtn').on('click',function(){
	      location.href="/MultiShop/notice/notice.do?pg=1"
	   });
   
});

