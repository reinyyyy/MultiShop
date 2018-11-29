<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login_modal -->
	<div class="modal fade animated rollIn" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Login</h4>
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>					
				</div>
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-user-check fa-4x"></i>
					<br><br>
					<form id="login_modal_form">
						<div class="input-group" style="margin-bottom: 10px;">
							<span class="input-group-addon" style="background-color: #A9F5A9;"><span style="color:white"><i class="far fa-envelope -o fa-fw"></span></i></span>
							<input type="text" class="form-control" width ="50" id="login_modal_email" name="m_email" placeholder="Email" required="required">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon" style="background-color: #F78181;"><span style="color:black"><i class="fas fa-unlock-alt -o fa-fw"></span></i></span>
							<input type="password" class="form-control" id="login_modal_pwd" name="m_pwd" placeholder="Password" required="required">
						</div>
						<div id="login_modal_statusDiv">
						
						</div>
						<div class="container">
							<button type="button" id="login_modal_loginBtn" class="btn btn-dark btn-lg"><span style="color: white">Login</span></button>
						</div>
						<input type="hidden" id="RSAModulus" value=""/>
        				<input type="hidden" id="RSAExponent" value=""/>
						<input type="hidden" id="RSA_email" name="RSA_email">
       					<input type="hidden" id="RSA_pwd" name="RSA_pwd">
					</form>
				</div>
				
			<div class="modal-footer">
				<div>
					<span data-toggle="tooltip" data-placement="Bottom" title="오른쪽 버튼을 눌러 회원가입 해주세요">
						<font size="2em"><strong><u>아이디가 없으신가요?</u></strong>
						</font>
					</span>
				</div>

				<button type="button" class="btn btn-warning btn-xs"
					id="login_join_navbar" data-toggle="modal"
					data-target="#join_modal" data-dismiss="modal">
					<span style="color: white"><i
						class="fas fa-pen-square fa-2x"></i></span>
				</button>
				<div>
					<span data-toggle="tooltip" data-placement="Bottom"
						title="이메일이 기억 안 나시면 오른쪽 버튼을 눌러 이메일을 찾아주세요">
						<font size="1em"><strong>이메일 찾기</strong></font>
				</div>
				<button type="button" class="btn btn-dark btn-xs"
					id="login_find_email_navbar" data-toggle="modal"
					data-target="#find_email_modal" data-dismiss="modal"
					data-backdrop="static" data-keyboard="false">
					<span style="color: white"><i class="fas fa-at"></i></span>
				</button>
				<div>
					<span data-toggle="tooltip" data-placement="Bottom"
						title="비밀번호가 기억 안 나시면 오른쪽 버튼을 눌러 비밀번호를 찾아주세요!!">
						<font size="1em"><strong>비밀번호 찾기</strong></font>
				</div>
				
				<button type="button" class="btn btn-dark btn-xs"
					id="login_find_pwd_navbar" data-toggle="modal"
					data-target="#find_pwd_modal" data-dismiss="modal"
					data-backdrop="static" data-keyboard="false">
					<span style="color: white"><i class="fas fa-key"></i></span>
				</button>
			</div>
		</div>
		</div>
	</div>
	
	<!-- logout modal -->
	<div class="modal fade animated rotateInUpRight " id="logout_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-sad-tear fa-4x"></i>
					<div class="container">
						<div class="">
						</div>
						<div class="m-10">
						
							<strong>${session_name }</strong>님
							벌써 로그아웃 하세요 :( ?
						</div>				
					</div>
					<br><br>
					<div>
						<button type="button" class="btn btn-warning" id="logout_modal_logoutBtn">로그아웃</button>
						<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
	
	<!-- join modal -->
	<div class="modal fade animated tada" id="join_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Register</h4>
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>					
				</div>
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-user-plus fa-5x"></i>
					<br>
					<form id="join_modal_form" class="form-horizontal" role="form">
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="far fa-envelope -o fa-fw"></i></span>
							<input type="text" class="form-control" id="join_modal_email" name="m_email" placeholder="이메일주소" required aria-required="true">
							<input type="hidden" id="join_modal_emailCheck" value="0">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
							<input type="password" class="form-control" id="join_modal_pwd" name="m_pwd" placeholder="비밀번호" required="required">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
							<input type="password" class="form-control" id="join_modal_repwd" placeholder="비밀번호 재입력" required="required">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="far fa-user -o fa-fw"></i></span>
							<input type="text" class="form-control" id="join_modal_name" name="m_name" placeholder="이름" required="required">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="fas fa-mobile-alt -o fa-fw"></i></span>
							<input type="text" class="form-control" id="join_modal_phone" name="m_tel_phone" placeholder="- 빼고 입력" required="required">
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<span class="input-group-addon"><i class="fas fa-map-marked-alt -o fa-fw"></i></span>
							<input type="text" class="form-control" id="join_modal_postcode" name="m_zipcode" placeholder="우편번호" required="required">
							<input type="button" class="btn btn-dark" id="join_modal_postcodeBtn" value="우편번호찾기" onclick="execDaumPostcode()">
						</div>
						<div>
						</div>
						<div class="input-group" style="margin-bottom: 10px">
							<input type="text" class="form-control" id="join_modal_roadAddress" name="m_roadAddress" placeholder="도로명주소" readonly>
							<input type="text" class="form-control" id="join_modal_jibunAddress" name="m_jibunAddress" placeholder="상세 주소">
						</div>		
						<div class="float_right">		
								<button type="reset" class="btn btn-light" id="reset_modal_resetBtn"><i class="fas fa-trash"></i></button>
								<button type="button" class="btn btn-danger" id="undo_modal_loginBtn"><i class="fas fa-undo"></i></button>
						
						</div>
						<div id="join_modal_statusDiv">
						
						</div>
						<div class="float_center">			
							<button type="button" class="btn btn-success" id="join_modal_joinBtn"><i class="fas fa-check fa-2x"></i></button>
						</div>		
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- signup complete -->
	<div class="modal fade animated lightSpeedIn" id="signup_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-child fa-5x"></i>
					<div class="container">
						<br>
						축하합니다!
						<br>
						<small>just</small> <span style="color:#58ACFA"><strong>COZY</strong></span>의 회원이 되셨습니다.
					</div>	
					<div>
						<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- login complete -->
	<div class="modal fade animated zoomInLeft" id="login_complete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="text-align: center;">
					<i class="far fa-grin-wink fa-4x"></i>
					<div class="container">
						<div class="">
						</div>
						<div class="m-10">
						<br>
						환영합니다!!
						<br> 
						<br> 
						<small>just</small> <span style="color:#58ACFA"><strong>COZY</strong></span>에서 좋은 시간 보내세요!
						</div>	
					</div>
					<br><br>
					<div>
						<button type="button" class="btn btn-dark" id="login_complete_modal_Btn" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- logout complete -->
	<div class="modal fade animated swing" id="logout_complete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-sad-cry fa-4x"></i>
					<br><br>
					<div class="container">
						더 좋은 아이템들로
						찾아뵐게요!
						<br><br>
						by <small>just</small> <span style="color:#58ACFA"><strong>COZY</strong></span>
					</div>	
					<br>
					<div>
						<button type="button" class="btn btn-dark" id="logout_complete_modal_Btn" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mypage nonmember -->
   <div class="modal fade animated flip" id="mypage_nonmember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
        	 <div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">회원정보</h4>
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>					
				</div>
            <div class="modal-body" style="text-align: center;">
              <i class="fas fa-circle-notch fa-spin fa-4x"></i>
              <br><br>
               <div class="container">
                  	<strong>회원전용입니다! 로그인 해주세요!</strong>
               </div>   
               <div>
               	<br>
                  <button type="button" class="btn btn-warning" id="login_navbar" data-toggle="modal" data-target="#login_modal" data-dismiss="modal">로그인창으로 이동</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- WishList nonmember -->
   <div class="modal fade animated flip" id="wishlist_nonmember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
        	 <div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">WishList</h4>
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>					
				</div>
            <div class="modal-body" style="text-align: center;">
              <i class="fas fa-circle-notch fa-spin fa-4x"></i>
              <br><br>
               <div class="container">
                  	<strong>회원전용입니다! 로그인 해주세요!</strong>
               </div>   
               <div>
               	<br>
                  <button type="button" class="btn btn-warning" id="login_navbar" data-toggle="modal" data-target="#login_modal" data-dismiss="modal">로그인창으로 이동</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- email Modal -->
<div class="modal fade animated pulse" id="send_email" tabindex="-1" role="dialog"
	aria-labelledby="ModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document"
		style="margin: 161px auto;">
		<div class="modal-content">
			<div class="modal-header" style="background-color: #81F781">
				<h5 class="modal-title" id="Email_Title">
					<span style="color: white"><i class="far fa-envelope-open"></i></span>
				</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<form class="send_email">
						<div class="container">
						<h5 class="emailform-heading">
							<span style="color: #585858"><strong>문의하실 내용이 있으신가요?</strong></span>
							<br>
							<span style="color: #585858"><small>**저희 쪽에서 1일내로 친절히 답변드립니다**</small></span>
						</h5>
						</div>
						<br>
						<label for="inputEmail" class="sr-only">Email address</label> <input
							type="text" id="inputEmail" class="form-control"
							placeholder="Email address" required autofocus> <br>
						<input type="text" id="inputTitle" class="form-control"
							placeholder="Title" required autofocus> <br>
						<textarea class="form-control" id="emailTextarea" placeholder=":)"
							rows="15"></textarea>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">
					<i class="fas fa-hand-pointer"></i>
				</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">
					<i class="fas fa-ban"></i>
				</button>
			</div>
		</div>
	</div>
</div>
<!-- find Email -->
   <div class="modal fade animated bounceInUp" id="find_email_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">Lost your Email?</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
               <i class="fas fa-user-lock fa-4x"></i>
               <br><br>
               <form id="find_email_modal_form">
                  <div class="input-group" style="margin-bottom: 10px;">
                     <span class="input-group-addon" style="background-color: #E6E6E6;"><span style="color:black"><i class="far fa-user -o fa-fw"></span></i></span>
                     <input type="text" class="form-control" width ="50" id="find_email_modal_name" name="m_name" placeholder="Name" required="required">
                  </div>
                  <div class="input-group" style="margin-bottom: 10px">
                     <span class="input-group-addon" style="background-color: #E6E6E6;"><span style="color:black"><i class="fas fa-mobile-alt -o fa-fw"></span></i></span>
                     <input type="text" class="form-control" id="find_email_modal_phone" name="m_phone" placeholder="Phone" required="required">
                  </div>
                  <div id="find_email_modal_statusDiv">
                  
                  </div>
                  <div class="container">
                     <button type="button" id="find_email_modal_findBtn" class="btn btn-warning btn-lg"><span style="color: #000000">Enter</span></button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
   <!-- complete email -->
   <div class="modal fade animated jackInTheBox" id="find_email_complete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">Email</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
              <i class="far fa-address-card fa-4x"></i>
              <br><br>
               <div class="container">
                     <div><strong>고객님의 이메일은 <span id="find_email_complete_email"></span> 입니다.</strong></div>
               </div>   
               <div>
                  <br>
                  <button type="button" class="btn btn-dark" id="login_navbar" data-toggle="modal" data-target="#login_modal" data-dismiss="modal"><span style="color:white;">로그인 창으로 이동</span></button>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- find pwd -->
   <div class="modal fade animated fadeInDownBig" id="find_pwd_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">Lost your Password?</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
               <i class="fas fa-user-lock fa-4x"></i>
               <br><br>
               <form id="find_pwd_modal_form">
                  <div class="input-group" style="margin-bottom: 10px;">
                     <span class="input-group-addon" style="background-color: #A9F5A9;"><span style="color:white"><i class="far fa-envelope -o fa-fw"></span></i></span>
                     <input type="text" class="form-control" width ="50" id="find_pwd_modal_email" name="m_email" placeholder="Email" required="required">
                  </div>
                  <div class="input-group" style="margin-bottom: 10px">
                     <span class="input-group-addon" style="background-color: #E6E6E6;"><span style="color:black"><i class="fas fa-user -o fa-fw"></span></i></span>
                     <input type="text" class="form-control" id="find_pwd_modal_name" name="m_name" placeholder="Name" required="required">
                  </div>
                  <div class="input-group" style="margin-bottom: 10px">
                     <span class="input-group-addon" style="background-color: #E6E6E6;"><span style="color:black"><i class="fas fa-mobile-alt -o fa-fw"></span></i></span>
                     <input type="text" class="form-control" id="find_pwd_modal_phone" name="m_phone" placeholder="Phone" required="required">
                  </div>
                  <div id="find_pwd_modal_statusDiv">
                  
                  </div>
                  <div class="container">
                     <button type="button" id="find_pwd_modal_findBtn" class="btn btn-warning btn-lg"><span style="color: black">Enter</span></button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
   
   <!-- find complete -->
   <div class="modal fade animated lightSpeedIn" id="find_pwd_complete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">Temporary Password</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
              <i class="fas fa-exclamation-circle fa-spin fa-4x"></i>
              <br><br>
               <div class="container">
               
                     <div>
                     <strong>당신의 이메일로 임시 비밀번호를 발송했습니다.
                     <br>
                     	로그인 후 비밀번호 변경해주세요!
                     </strong>
                     </div>
               </div>   
               <div>
                  <br>
                  <button type="button" class="btn btn-warning" id="login_navbar" data-toggle="modal" data-target="#login_modal" data-dismiss="modal">로그인창으로 이동</button>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <!-- personal privacy -->
	<div class="modal fade animated bounceInUp" id="privatePolicy_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
              		 <h4 class="modal-title" id="myModalLabel">Privacy Policy</h4>
               		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>       
           	    </div>
				<div class="modal-body" style="text-align: center;">
					<i class="fas fa-user-cog fa-5x"></i>
					<div class="container">
						<br>
						<div>
						<p style="font-size: 9pt;">
							고객의 기본적인 사생활 비밀과 자유 및 통신 비밀을 보장하고,불법적인 도청, 정보유출로 인한 인권 피해가 발생하지
							않도록 하고자 마련한 것 입니다. <br>
						</p>
						<p style="font-size: 10pt;">
						<strong>just COZY</strong>의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다.
						</p>
					</div>
						<div style="overflow-y:scroll; height:270px; border: 1px dotted black"> 
                   		<p style="font-size:9pt; text-align:left">
						<Strong>제 1조 (총칙)</Strong><br><br>
						개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 주민등록번호 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보 <br>
						(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다.) 를 말합니다.<br><br>
						<strong>just COZY</strong>는 귀하의 개인정보 보호를 매우 중요시하며, ‘정보통신망 이용촉진 및 정보보호에 관한 법률’ 상의 개인정보 보호규정 및 정보통신부가 제정한 ‘개인정보 보호지침’을 준수하고 있습니다.<br>
						<strong>just COZY</strong>는 개인정보취급방침을 정하고 이를 귀하께서 언제나 쉽게 확인할 수 있게 공개하도록 하고 있습니다.<br>
						<strong>just COZY</strong>는 개인정보 처리방침의 지속적인 개선을 위하여 개정하는데 필요한 절차를 정하고 있으며, 개인정보 처리방침을 회사의 필요한 사회적 변화에 맞게 변경할 수 있습니다.<br><br>
						그리고 개인정보처리방침을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다.<br><br>
						<strong>제 2조 (수집하는 개인정보 항목 및 수집방법)</strong><br><br>
						<strong>just COZY</strong>는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다.<br>
						<strong>just COZY</strong>는 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 합니다.<br><br>
						- 입력항목 : 희망ID(이메일주소 형식), 비밀번호, 성명, 이메일주소<br>
						또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br>
						- 최근접속일, 접속 IP 정보, 쿠키, 구매로그, 이벤트로그<br>
						- 회원가입 시 회원이 원하시는 경우에 한하여 추가 정보를 선택, 제공하실 수 있도록 되어있으며,
						일부 재화 또는 용역 상품에 대한 주문 및 접수 시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 주문 및 결제, 배송을 위하여 추가적인 정보를 요구하고 있습니다.<br><br>
						<strong>just COZY</strong>는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
						- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청 <br>
						- 협력회사로부터의 제공<br>
						- 로그 분석 프로그램을 통한 생성정보 수집<br><br>
						<strong>개인정보 수집에 대한 동의</strong><br>
						- <strong>just COZY</strong>는 귀하께서 에이플러스비의 개인정보취급방침 및 이용약관의 내용에 대해 「동의한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 
						「동의한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br>
						<strong>14세 미만 아동의 개인정보보호</strong><br>
						<strong>just COZY</strong>는 법정 대리인의 동의가 필요한 만14세 미만 아동의 회원가입은 받고 있지 않습니다.<br>
						<strong>비회원의 개인정보보호</strong><br>
						① <strong>just COZY</strong>는 비회원 주문의 경우에도 배송, 대금결제, 주문내역 조회 및 구매확인, 실명여부 확인을 위하여 필요한 개인정보만을 요청하고 있으며, 이 경우 그 정보는 대금결제 및 상품의 배송에 관련된 용도 이외에는 다른 어떠한 용도로도 사용되지 않습니다.<br>
						② <strong>just COZY</strong>는 비회원의 개인정보도 회원과 동등한 수준으로 보호합니다.<br><br>
						<strong>제 3조 (개인정보의 수집목적 및 이용 목적)</strong><br><br>
						<strong>just COZY</strong>는 다음과 같은 목적을 위하여 개인정보를 수집하고 있습니다.<br>
						성명, 아이디, 비밀번호, 주민등록번호, 이메일 또는 아이핀 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용<br>
						이메일주소(뉴스레터 수신여부) : 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스, 신상품이나 이벤트 정보 등 최신 정보의 안내<br>
						주소, 전화번호 : 쇼핑 물품 배송에 대한 정확한 배송지의 확보<br>
						그 외 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br><br>
						<strong>제 4조 (개인정보의 공유 및 제공)</strong><br><br>
						<strong>just COZY</strong>는 귀하의 개인정보를 (개인정보의 수집목적 및 이용목적) 에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 타인 또는 타기업/기관에 제공하지 않습니다.<br>
						단, 다음은 예외로 합니다.<br>
						① 관계법령에 의하여 수사상의 목적으로 관계기관으로부터의 요구가 있을 경우<br> 
						② 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br>
						③ 이용자들이 사전에 동의한 경우<br>
						④ 그러나 예외사항에서도 관계법령에 의하거나 수사기관의 요청에 의해 정보를 제공한 경우에는 이를 당사자에게 고지하는 것을 원칙으로 운영하고 있습니다. <br>
						법률상의 근거에 의해 부득이하게 고지를 하지 못할 수도 있습니다. <br>
						본래의 수집목적 및 이용목적에 반하여 무분별하게 정보가 제공되지 않도록 최대한 노력하겠습니다. <br><br>
						<strong>제 5조 (수집한 개인정보 취급 위탁) </strong><br><br>
						CJ택배, 우체국택배, 현대택배, 대한통운, 한진택배 외 기타택배사 : 상품배송업무 이니시스, LG데이콤, 모빌리언스, KCP, 올앳 : 상품 구매에 필요한 신용카드, 현금결제 등의 결제정보 전송 인포뱅크, LG데이콤 : SMS, MMS등 문자메세지 전송 상품판매제휴업체 :
						상품주문확인 및 배송 업무 <br><br>
						<strong>제 6조 (개인정보의 보유, 이용기간)</strong> <br><br>
						귀하의 개인정보는 회사가 신청인에게 서비스를 제공하는 기간 동안에 한하여 보유하고 이를 활용합니다. <br> 
						다만 다른 법률에 특별한 규정이 있는 경우에는 관계법령에 따라 보관합니다. <br>
						① 회원가입정보 : 회원가입을 탈퇴하거나 회원에 제명된 때<br>
						② 대금지급정보 : 대금의 완제일 또는 채권소명시효기간이 만료된 때 <br>
						③ 배송정보 : 물품 또는 서비스가 인도되거나 제공된 때<br>
						④ 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등이 종료한 때 위 개인정보 수집목적 달성시 즉시파기 원칙에도 불구하고 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는
						전자상거래 등에서의 소비자보호에 관한 법률 등에 근거하여 일정기간 보유합니다.<br><br> 
						① 계약 또는 청약철회 등에 관한 기록: 5년 <br>
						② 대금결제 및 재화 등의 공급에 관한 기록 : 5년 <br>
						③ 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
						④ 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등의 종료 시점 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우 에이플러스비는 지체없이 그 열람, 확인 할 수 있도록
						조치합니다. <br><br>
						<strong>제 7조 (개인정보의 파기 절차)</strong><br><br>
						 <strong>just COZY</strong>는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. <br>
						 파기절차 및 방법은 다음과 같습니다. <br><br>
						 파기절차: 귀하가 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(제6조 개인정보의 보유, 이용기간참조) 일정 기간 저장된 후 파기되어집니다. <br>
						 동 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른목적으로 이용되지 않습니다. <br><br>
						 파기방법 : 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br><br>
						<strong>제 8조 (개인정보 처리를 위한 기술적, 관리적 대책)</strong> <br><br>
						*기술적 대책 <strong>just COZY</strong>는 귀하의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다. <br><br>
						<strong>just COZY</strong>는 방화벽(Fire Wall)과 Nescape사의 채널보안방식인 SSL(Secure Socket Layer)방식 암호화 체계 시스템 등을 갖추어 개인정보 보호에 만전을 기하고 있습니다.<br><br>		
						세계적인 보안 인증 회사로부터 인증서를 발급 받아 <strong>just COZY</strong>를 사칭하는 것을 방지하여 고객께 피해가 가지 않도록 하고 있습니다.<br><br>
						 귀하의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다. <br><br>
						<strong>just COZY</strong>는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다.<br><br>
						백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공 함으로써 개인정보가 침해되는 것을 방지하고 있습니다. <br><br>
						<strong>just COZY</strong>는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다. <br><br>
						개인정보에 해당하는 이메일, 휴대폰번호 등은 암호화되어 저장하고 있습니다. <br><br>
						*관리적 대책 에이플러스비는 귀하의 개인정보에 대한 접근 권한을 최소한의 인원으로 제한하고 있습니다. <br>
						그 최소한의 인원에 해당하는 자는 다음과 같습니다. <br><br>이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자 개인정보보호책임자 및 담당자 등 개인정보보호업무를 수행하는 자 기타 업무상 개인정보의 처리가 불가피한 자<br>
						<br>
						① 개인정보를 처리하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보 보호 의무 등에 관해 정기적인 사내교육 및 외부 위탁교육을 실시하고 있습니다.<br>
						② 입사 시 전 직원의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다.<br>
						③ 개인정보 관련<br>
							처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한
							책임을 명확화하고 있습니다. <br>
						④ 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다. <br>
						⑤ <strong>just COZY</strong>는 이용자 개인의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. <br>
						회원 개개인이 본인의 개인정보를 보호하기 위해서 자신의 ID 와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야 합니다. 
						⑥ 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 <strong>just COZY</strong>는 즉각 귀하께 사실을 알리고 적절한 대책과 보상을 강구할 것입니다.<br><br>
						
						<strong> 제 9조 (링크사이트)</strong><br><br>
						
						<strong>just COZY</strong>는 귀하께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. <br>
						이 경우 <strong>just COZY</strong> 외부사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다.<br>
						<strong>just COZY</strong>가 포함하고 있는 링크를 클릭(Click)하여 타 사이트(Site)의 페이지로 옮겨갈 경우 해당 사이트의 개인정보처리방침은 <strong>just COZY</strong>와 무관하므로 새로 방문한 사이트의 정책을 검토해 보시기 바랍니다.
						<br><br>
							<strong>제 10조 (게시물)</strong><br><br>
						<strong>just COZY</strong>는 귀하의 게시물을 소중하게 생각하여 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다.그러나 다음의 경우는 그렇지 아니합니다. 
						- 스팸(spam)성 게시물 및 상업성 게시물 (예: 행운의 편지, 특정사이트 광고 등)<br>
						- 타인을 비방할 목적으로 허위 사실을 유포하여 타인의 명예를 훼손하는 글<br>
						- 동의 없는 타인의 신상공개, 제3자의 저작권 등 권리를 침해하는 내용, 기타 게시판 주제와 다른 내용의 게시물 <strong>just COZY</strong>는 바람직한 게시판 문화를 활성화하기 위하여 동의 없는 타인의 신상 공개 시 특정부분 이동 경로를 밝혀 오해가 없도록
							하고 있습니다. 그 외의 경우 명시적 또는 개별적인 경고 후 삭제 조치할 수 있습니다.<br>
						 근본적으로 게시물에 관련된 제반 관리와 책임은 작성자 개인에게 있습니다. 또 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보
							공개 전에 심사 숙고하시기 바랍니다. <br><br>
							<strong>제 11조 (이용자의 권리와 의무)</strong>
						 귀하의 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다. <br>
						 귀하가 입력한 부정확 한 정보로 인해 발생하는 사고의 책임은 이용자 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원 자격이 상실될 수 있습니다.<br>
						  귀하는 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. <br>
						  비밀번호를 포함한 귀하의 개인정보가 유출되지 않도록 조심 하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오. <br>
						  만약 이 같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 ‘정보통신망이용 촉진및정보보호등에관한법률’ 등에 의해 처벌받을 수 있습니다. <br>
						  온라인상에서(게시판, E-mail, 또는 채팅 등) 귀하가 자발적으로 제공하는 개인정보는 다른 사람들이 수집하여 사용할 수 있음을 항상 유념하시기 바랍니다.<br>
						   즉, 공개적으로 접속할 수 있는 온라인상에서 개인정보를 게재하는 경우, 다른 사람들로부터 원치 않는 메시지를 답장으로 받게 될 수도 있음을 의미합니다.<br>
						공공장소에서 이용할 때에는 자신의 비밀번호가 노출되지 않도록 하고 서비스 이용을 마친 후에는 반드시 로그아웃을 해주시기 바랍니다. <br><br>
						
						<strong>제 12조 (이용자 및 법정 대리인의 권리와 그 행사방법)</strong>
						 귀하는 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. <br>
						 귀하의 개인정보 조회, 수정 또는 가입해지를 위해서는 「MY 개인정보」버튼을 클릭하여 본인확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. <br>
						 혹은	개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. <br>
						 <strong>just COZY</strong>는 귀하의 요청에 의해 해지 또는 삭제된 개인정보는 “제 6조 개인정보의 보유, 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로
						열람 또는 이용할 수 없도록 처리하고 있습니다. <br><br>
						
						<strong>제 13조 (개인정보 자동 수집 장치의 설치, 운영 및 그 거부에 관한 사항)</strong><br><br>
						 쿠키(cookie)란? <strong>just COZY</strong>는 귀하에 대한 정보를 저장하고 수시로 찾아내는 쿠키(cookie)를 사용합니다. <br>
						 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷익스플로러 등)로 전송하는 소량의 정보입니다.<br>귀하께서 웹사이트에 접속을 하면 에이플러스비의 서버는 귀하의 브라우저에 추가정보를 임시로 저장하여 접속에 따른 성명
						등의 추가 입력 없이 에이플러스비의 서비스를 제공할 수 있습니다. <br>
						쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다. 또한 귀하는 쿠키에 대한 선택권이 있습니다. <br>
						<strong>just COZY</strong>의 쿠키 운용 <strong>just COZY</strong>는 이용자의 편의를 위하여 쿠키를 운영합니다. <br>
						<strong>just COZY</strong>가 쿠키를 통해 수집하는 정보는 회원Email에 한하며, 그 외의 다른 정보는 수집하지 않습니다.<br>
						<strong>just COZY</strong>가 쿠키를 통해 수집한 회원 Email은 다음의 목적을 위해 사용됩니다. <br>
						① 개인의 관심 분야에 따란 차별화된 정보를 제공 <br>
						② 쇼핑한 품목들에 대한 정보와 장바구니 서비스를 제공 <br>
						③ 회원과 비회원의 접속빈도 또는 머문 시간 등을 분석하여 서비스 개편 및 마케팅에 활용 쿠키는 브라우저의 종료시나 로그아웃 시 만료됩니다.<br><br>						
							쿠키의 설치 및 거부 <br><br>
						① 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도
							있습니다.<br>
						② 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 에이플러스비 일부 서비스는 이용에 어려움이 있을 수 있습니다. <br>
						③ 쿠키 설치 허용 여부를 지정하는 방법 -<br>
						 Internet Explorer의 경우 : [도구]
							메뉴에서 [인터넷 옵션]을 선택 → [개인정보]를 클릭 → [고급]을 클릭 → 쿠키 허용여부를 선택 <br><br>
							- Safari의 경우 :MacOS 상단 좌측 메뉴바에서 [Safari]에서 [환경설정]을 선택 → [환경설정] 창에서 [보안]으로
							이동하여 쿠키 허용여부 선택 <br><br>
							
						<strong>제 14조 (개인정보 보호문의처)</strong><br><br>
						 당사는 귀하의 의견을 소중하게 생각하며, 귀하는	의문사항으로부터 언제나 성실한 답변을 받을 권리가 있습니다. <br>
						 당사는 귀하와의 원활한 의사소통을 위해 고객센터를 운영하고 있습니다. 고객센터의 연락처는 다음과 같습니다. <br>
						 [고객센터] - 이메일 :y70ead@naver.com <br>
						 - 전화번호 : 1644-9301 <br>
						 - 팩스번호 : 070-3945-2934
						 -주소 : 서울특별시 종로구 묘동 56 4층, 
						 just COZY 고객센터 전화상담은 월~금요일 오전 10:00 ~ 오후 07:00에만 가능합니다. (주말, 공휴일 휴무) <br>
						 전자우편이나 팩스 및 우편을 이용한 상담은 접수 후 24시간 내에 성실하게 답변 드리겠습니다. 다만 근무시간 이후 또는 주말 및 공휴일에는 익일 처리하는 것을 원칙으로 합니다.<br>
						기타 개인정보에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 인터넷범죄수사센터, 경찰청 사이버테러대응센터 등으로 문의하실 수 있습니다. <br><br>
						[개인정보침해신고센터] 118 / http://www.118.or.kr/ 118@kisa.or.kr / 02-3480-3600<br>
						 [대검찰청 인터넷범죄수사센터] http://icic.sppo.go.kr/ 02-392-0330 <br>
						 [경찰청 사이버테러대응센터] http://ctrc.go.kr/ <br><br>
						 
						 <strong>제 15조 (개인정보보호책임자 및 담당자)</strong><br><br>
						 
						  <strong>just COZY</strong>는 귀하가 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. <br>
						  개인정보를 보호하는데 있어 귀하께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보관리책임자가 모든 책임을 집니다. <br>
						  그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다. <br>
						  귀하의 개인정보를 취급하는 책임자 및 담당자는 다음과 같으며 개인정보 관련 문의사항에 신속하고 성실하게 답변해드리고 있습니다. <br>
						 [개인정보 관리 책임자] <br><br>
						 성명 : 차민우 <br>
						  소속 : JJ Company<br>
							이메일 : forrest_gump_@naver.com <br>
							전화: 1644-9302<br>
							Fax:070-8623-5337 <br>
							
							<strong>제 16조 (고지의 의무)</strong> <br><br>
							개인정보처리방침은 2018년 11월 21일부터 적용됩니다. <br>
							내용의 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 공지사항을 통하여 고지할 것입니다.<br>
							 또한개인정보처리방침에 버전번호 및 개정일자 등을 부여하여 개정여부를 쉽게 알 수 있도록 하고 있습니다. <br><br>
							 <strong>개인정보처리방침</strong><br><br>
							버전번호 : v2018112128 <br>
							개인정보처리방침 변경공고일자 : 2018년 11월 19일 <br>
							개인정보처리 시행일자 : 2018년 11월 21일
						</p>
						</div>
					</div>	
					<div>
						<br>
						<button type="button" class="btn btn-dark" data-dismiss="modal">확인 및 닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 이용약관 -->
	  <div class="modal fade animated slideInUp" id="termsAndConditions_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
               <i class="fas fa-user-cog fa-5x"></i>
					<div class="container">
						<br>
						<div stlye="font-size:13pt;">
							<strong>회원가입 전 반드시 이용약관을 읽어보시기 바랍니다.</strong>
						</div>
						<br>	
						<div style="overflow-y:scroll; height:270px; border: 1px dotted black"> 
                   		<p style="font-size:9pt; text-align:left">
                   		
                   		
                   		<strong>제 1장 총 칙</strong><br><br>
						<strong>제 1조 (목적)</strong><br><br>
						이 약관은 JJ Company 주식회사(이하 "회사") 가 운영하는 인터넷 사이트를 통하여 제공하는 전자상거래 관련 서비스(이하 "서비스")를 이용함에 있어 회사와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br>
						* PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.<br><br>

						<strong>제 2조 (정의)</strong><br><br>
						1."회사"란JJ Company 주식회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다.<br>
						2."이용자"란 "회사"에 접속하여 이 약관에 따라 "회사"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
						3.회원이라 함은 "회사"에 개인정보를 제공하여 회원 등록을 한 자로서, "회사"의 정보를 지속적으로 제공 받으며, "회사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
						4."비회원"이라 함은 회원에 가입하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말합니다.<br>
						이외에 이 약관에서 사용하는 용어의 정의는 관계 법령 및 서비스 별 안내에서 정하는 바에 의합니다.<br><br>
						
						<strong>제 3조 (약관 등의 명시와 설명 및 개정)</strong><br><br>
						1."회사"는 이 약관의 내용과 상호, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 이메일주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 "회사"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
						<br>
						2."회사"는 약관의규제에관한법률, 전자상거래등에서의소비자보호에관한법률, 소비자기본법 등 관련법을 위배하지 않는 범위 에서 이 약관을 개정할 수 있습니다.<br>
						3."회사"는 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 "회사"의 초기화면이나 팝업화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. <br>
						다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "회사"는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
						4."회사"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. <br>
						다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "회사"에 송신하여 "회사"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br><br>
						
						이 약관에서 정하지 아니한 내용과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
					<br><br>
					<strong>제 2장 회사의 서비스</strong><br><br>
					
					<strong>제 4조 (서비스의 제공 및 변경)</strong><br><br>

					1."회사"는 다음과 같은 서비스를 제공합니다.<br>
					① 재화 또는 용역에 대한 정보 제공 및 구매 계약의 체결<br>
					② 구매 계약이 체결된 재화 또는 용역의 배송<br>
					③ 기타 "회사"가 정하는 업무<br>
					2."회사"는 상품 또는 용역이 품절되거나 기술적 사양의 변경 등으로 더 이상 제공할 수 없는 경우에는 장차 체결되는 계약에 의해 제공할 상품, 용역의 내용을 변경할 수 있습니다. <br>
					이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
					3."회사"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 상품 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 방법으로 즉시 통지합니다.<br>
					전항의 경우 "회사"는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "회사"가 고의 또는 과실이 없음을 입증한 경우에는 아무런 책임을 부담하지 않습니다.<br><br>
					<strong>제 5조 (서비스의 중단)</strong><br><br>					
					1."회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
					2.제1항에 의한 서비스 중단의 경우에는 "회사"는 제8조에 정한 방법으로 이용자에게 통지합니다.<br>
					3."회사"는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 "회사"의 고의성의 없는 경우에는 배상하지 아니합니다.<br><br>
					<strong>제 3장 회원가입 계약</strong><br><br>
					<strong>제 6조 (회원가입)</strong><br><br>
					1.이용자는 무료로 회원에 가입할 수 있으며, "회사"가 정한 가입 양식에 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
					2."회사"는 제1항에 따라 회원가입을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>
					① 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "회사"가 회원 재가입을 승낙한 경우는 예외로 합니다.<br>
					② 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
					③ 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우<br>
					④ 만14세 미만의 아동으로서 부모 등 법정대리인의 동의를 얻지 아니한 경우<br>
					3.회원가입은 "회사"의 승낙이 가입 신청한 이용자에게 도달한 때에 완료됩니다.<br>
					4."회원"은 "회사"에 등록한 회원정보에 변경이 있는 경우, 즉시 "회사"에서 정하는 방법에 따라 해당 변경사항을 "회사"에게 통지하거나 수정하여야 합니다.<br><br>
					<strong>제 7조 (회원 탈퇴 및 자격 상실 등)</strong><br><br>
					1.회원은 "회사"에 언제든지 탈퇴를 요청할 수 있으며 "회사"는 즉시 회원 탈퇴를 처리합니다.<br>
					2.회원이 다음 각호의 사유에 해당하는 경우, "회사"는 회원 자격을 제한 및 정지시킬 수 있습니다.<br>
					① 가입 신청 시에 허위 내용을 등록한 경우<br>
					② "회사"를 이용하여 구입한 재화 등의 대금, 기타 "회사" 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
					③ 타인의 ID와 비밀번호 또는 그 개인정보를 도용한 경우<br>
					④ 다른 사람의 "회사" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>
					⑤ "회사"를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 ⑥ 기타 서비스 운영을 고의로 방해하는 행위를 하는 경우<br>
					3."회사"가 회원 자격을 제한, 정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정 되지 아니하는 경우 "회사"는 회원 자격을 상실시킬 수 있습니다.<br>
					4."회사"가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원 등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br><br>
					<strong>제 8조 (회원에 대한 통지)</strong><br><br>
					1.회원에 대한 통지를 하는 경우 "회사"는 회원이 등록한 e-mail 주소 또는 SMS 등으로 할 수 있습니다.<br>
					2."회사"는 불특정 다수 회원에 대한 통지의 경우 서비스 게시판 등에 게시함으로써 개별 통지에 갈음할 수 있습니다.<br><br>
					<strong>제 4장 구매계약 및 대금 결제</strong><br><br>
					<strong>제 9조 (구매신청)</strong><br><br>
					이용자는 "회사"에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "회사"는 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
					<br>
					1.재화 등의 검색 및 선택<br>
					2.성명, 주소, 전화번호, 이메일 주소(또는 이동전화번호) 등의 입력<br>
					3.약관내용, 청약 철회권이 제한되는 서비스, 배송료, 설치비 등의 비용부담과 관련한 내용에 대한 확인<br>
					4.재화 등의 구매신청 및 이에 관한 확인 또는 "회사"의 확인에 대한 동의<br>
					5.결제 방법의 선택<br><br>
					<strong>제 10조 (구매계약의 성립)</strong><br><br>
					1."회사"는 제9조 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. <br>
					다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
					① 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
					② 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 상품 및 용역을 구매하는 경우<br>
					③ 기타 구매신청을 승낙하는 것이 "회사" 기술상 현저히 지장이 있다고 판단하는 경우<br>
					④ 기타 제반 법령 및 정부의 가이드라인에 위반되는 경우<br>
					2."회사"의 승낙이 제12조 제1항의 수신확인 통지형태로 이용자에게 도달한 시점에 구매계약이 성립한 것으로 봅니다.<br>
					3."회사"의 승낙의 의사표시에는 이용자의 구매신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br><br>
					<strong>제 11조 (지급방법)</strong><br><br>
					1."회사"에서 구매한 상품 또는 용역에 대한 대금지급방법은 다음 각 호의 방법 중 가용한 방법으로 할 수 있습니다. 단, "회사"는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
					<br><br>
					① 폰뱅킹, 인터넷뱅킹, 메일뱅킹 등의 각종 계좌이체<br>
					② 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>
					④ 전자 화폐에 의한 결제<br>
					⑤ 마일리지 등 "회사"가 지급한 포인트에 의한 결제 ⑥ "회사"와 계약을 맺었거나 "회사"가 인정한 상품권에 의한 결제<br>
					⑦ 기타 전자적 지급 방법에 의한 대금 지급 등<br>
					2.구매대금의 결제와 관련하여 이용자가 입력한 정보 및 그와 관련된 책임은 이용자에게 있으며, 재화 또는 용역의 청약 후 합리적인 일정 기간 내에 결제가 이루어 지지 않는 경우 "회사"는 이에 해당주문을 취소할 수 있습니다.<br>
					3."회사"는 구매자의 결제수단에 대하여 정당한 사용권한 보유여부를 확인할 수 있으며 필요한 경우 해당 거래진행의 정지 및 소명자료의 제출을 요청할 수 있습니다.<br><br>
					<strong>제 12조 (수신확인통지·구매신청 변경 및 취소)</strong><br><br>
					1."회사"는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>
					2.수신확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, "회사"는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다.
					<br>
					3.수신확인 통지를 받은 이용자가 대금을 지불한 경우에는 제 15조의 청약철회 등에 관한 규정에 따릅니다.<br><br> 
					<strong>제 13조 (재화 등의 공급)</strong><br><br>
					1."회사"는 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날로부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "회사"가 이미 재화
					등의 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 "회사"는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인 할 수 있도록 적절한 조치를 합니다.
					<br> 
					2.공휴일 및 기타 휴무일 또는 천재지변 등의 불가항력적 사유가 발생하는 경우 그 해당기한은 배송소요기간에서 제외합니다. <br><br>
					<strong>제 14조 (환급)</strong><br><br> 
					1."회사"는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 
					3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다. <br><br>
					<strong>제 15조 (청약 철회 등)</strong> <br><br>
					1."회사"와 재화 등의 구매에	관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날로부터 7일 이내에 청약의 철회를 할 수 있습니다. 
					다만,	통지를 받은 때보다 공급이 늦게 이루어진 경우에는 재화 등의 공급을 받은 날로부터 7일 이내에 청약 철회를 할 수 있습니다. <br>
					2.이용자는 재화 등을 배송 받은 경우 다음 각호에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. <br>
					①이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>
					② 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우 <br>
					③ 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>
					④ 그 밖에 거래의 안전을 위하여 대통령령이 정하는 경우 <br>
					3.제2항제2호 내지 제4호의 경우에는 "회사"가 사전에 청약 철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약 철회 등이 제한되지 않습니다. <br>
					4.이용자는 제1항 및 제2항의 규정에도 불구하고 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다. <br><br>
					<strong>제 16조(청약 철회 등의 효과) </strong>
					<br><br>
					1."회사"는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급 합니다. 이 경우"회사"가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연 기간에 대하여 공정거래
					위원회가 정하여 고시하는 지연 이자율을 곱하여 산정한 지연 이자를 지급합니다. <br>
					2."회사"는 위 대금을 환급함에 있어서 구매자가 신용카드 또는 전자금융거래법 등이 정하는 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청할 수 있습니다. 청약 철회 등의
					경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. <br>
					3."회사"는 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약 철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 "회사"가 부담합니다.<br>
					4.이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 "회사"는 청약 철회 시 그 비용을 누가 부담하는지를 알기 쉽도록 명확하게 표시합니다.<br><br> 
					<strong>제 5장 계약당사자의 의무</strong><br><br>
					<strong>제 17조 (개인정보보호 및 이용)</strong><br><br> 
					1."회사"는 이용자의 정보수집시 서비스의	제공에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.<br>
					① 희망 Email (회원의 경우) ② 성명 ③ 비밀번호 (회원의 경우) ⑤ 기타 <br>
					2."회사"가 필요하다고 인정하는 사항 "회사"는 이용자의 개인 식별이 가능한 개인 정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. <br>
					3.제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "회사"가 집니다. 다만, 다음의 경우는 예외로 합니다. <br>
					① 배송 업무상 배송 업체에게 배송에	필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 <br>
					② 정보통신서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적, 기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우 <br>
					③ 재화 등의 거래에 따른 대금 정산을 위하여 필요한 경우<br>
					④ 도용 방지를 위하여 본인 확인에 필요한 경우 <br>
					⑤ 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우<br> 
					⑥ 신속한 이용문의 상담 및 이용자의 불만처리 업무를 대행하는 "회사"에 상담업무에 필요한 이용자의 정보를 제공하는 경우<br>
					⑦ 회원가입 시 동의하신 제휴사별 제휴 업무 진행을 위한 필요로 하는 본인확인을 위한 최소한의 정보(성명, 연락처, 주문상품평 등)를 제휴사에게 제공하는 경우 <br>
					4."회사"가 제2항과 제3항에	의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집 목적 및 이용 목적, 제3자에 대한 정보 제공 관련 사항(제공 받은자, 제공 목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조 등에서 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지
					이 동의를 철회할 수 있습니다.<br> 
					5.이용자는 언제든지 "회사"가 가지고 있는 자신의 개인 정보에 대해 열람 및 오류 정정을 요구할 수 있으며 "회사"는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "회사"는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br> 
					6."회사"는 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br> 
					7."회사" 또는 그로부터 개인 정보를 제공받는 제3자는 개인정보의 수집 목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. <br>
					8."회사"가 회원의 개인정보를 수집, 이용, 제공 등을 할 경우에는 정보통신망 이용촉진 및 정보보호등에 관한 법률에 따라 회원의 동의를 받습니다.<br> 
					9. 회원은 원하는 경우 언제든 "회사"에 제공한 개인정보의 수집과 이용에 대한 동의를 철회할 수 있으며 동의의 철회는 회원 탈퇴를 하는 것으로 이루어 집니다. <br>
					* 개인정보와 관련된 보다 구체적인 사항은 개인정보취급방침을 따릅니다. <br><br>
					<strong>제 18조 ("회사"의 의무)</strong><br><br>
					1. "회사"는 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 상품 또는 용역을 제공하는데 최선을 다합니다. <br>
					2. "회사"는 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br> 
					3."회사"는 판매하는 상품이나 용역에 대하여「표시·광고의공정화에관한법률」 제3조 의 규정에 위반하는 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 부담합니다. <br>
					4."회사"는 수신거절의 의사를 명백히 표시한 이용자에 대해서는 영리목적의 광고성 이메일을 발송하지 않습니다. <br><br>
					<strong>제 19조 (회원의 ID 및 비밀번호에 대한 의무)</strong><br><br>
					1. 제18조의 경우를 제외하고, 회원의 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. <br>
					2.회원은 자신의 ID 및 비밀번호를 제3자가 이용하게 해서는 안됩니다.<br>
					3.회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "회사"에 통보하고 "회사"의 안내가 있는 경우에는 그에 따라야 합니다. <br>
					4."회사"는 회원이 상기 제1항, 제2항, 제3항을 위반하여 회원에게 발생한 손해에 대하여 아무런 책임을 부담하지 않습니다. <br><br>
					<strong>제 20조 (이용자의 의무)</strong><br><br>
					 이용자는 다음 행위를 하여서는 안됩니다. <br><br>
					 1.개인정보의 등록(변경의 경우를 포함함)시 허위내용을 등록 <br>
					 2."회사"에 게시된 정보를 임의로 변경
					 3."회사"가 허락하지 않은 정보(컴퓨터 프로그램 등)의 송신 또는 게시 <br> 
					 4."회사"기타 제3자의 저작권 등 지적재산권에 대한 침해 <br>
					 5."회사"기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 화면에 공개 또는 게시하는 행위 <br><br>
					 <strong>제 6장 부가서비스의 이용 제 21조 (마일리지)</strong><br><br>
					 1. "회사"는 회원이 상품을 구매하거나, 상품평의 작성 등의 경우 또는 회원이 제휴사 포인트를 전환하는 경우 회원에게 일정한 마일리지를 부여할 수 있습니다. 다만, 상품구매 후 취소 또는 반품을 할 경우에는 상품 구매 시 회사가 부여한 마일리지를 회수합니다. 그 구체적인 운영방법은 "회사"의 운영정책에 의합니다. <br>
					 2. 마일리지는 상품 구매시 사용가능 기준	하에 현금가액과 동일하게 사용할 수 있으나 (단 사용불가 사전고지품목 제외), 현금으로 환불되지는 않습니다. 또한,
							마일리지 서비스는 회원에게만 제공되며 타인에게 양도할 수 없습니다. <br>
					3.부여된 마일리지는 부여일로부터 5년간 유효합니다. 다만, 회사가 별도로 유효기간을 정한 때에는 이에 따릅니다. 유효기간이 경과한 마일리지는 자동적으로 소멸하게 됩니다.<br>
					4."회사"의 회원 중에 1년간 거래가 없고, 적립된 마일리지가 5,000마일 미만인 경우에는 휴면회원으로 간주하여 회사는 해당 회원의 적립된 마일리지를 회수하게 됩니다. <br>
					5.회원을 탈퇴한 경우 마일리지는 소멸됩니다. <br>
					6.부정한 방법으로 포인트를 획득한 사실이 확인될 경우 "회사"는 회원의 포인트 회수, ID(고유번호) 삭제 및 형사 고발 등 기타 조치를 취할 수 있습니다. <br><br>
					<strong>제 22조 (예치금)</strong><br><br>
					 1."회사"에서 구입한 상품을 반품 또는 취소하였을 때 회원이 원할 경구 환불 금액을 예치금으로 환불 받을 수 있습니다. <br>
					 2.예치금은 해당금액을 차후 상품 구매시 현금처럼 사용 할 수 있으며 회원이 원하는 경우 현금으로 돌려받으실 수 있습니다.<br>
					 3. 예치금은 사용 유효기간이 없으며 최소 구매 금액 제한없이 사용 가능합니다. <br><br>
					 <strong>제 23조 (상품쿠폰)</strong><br><br> 
					 1."회사"는 구매서비스를 이용하는 회원에게 지정된 상품 구매 시 일정액 또는 일정비율을 할인 받을 수 있는 상품쿠폰을 발급할 수 있습니다.<br>
					 2. 회원은 상품쿠폰을 회원 본인의 구매에 한해서만 사용할 수 있으며, 어떠한 경우에도 이를 타인에게 실질적으로 매매 또는 양도할 수 없습니다.<br>
					 3. 상품쿠폰은 일부 품목이나 금액에 따라 사용이 제한될 수 있으며, 유효기간이 지난 후에는 사용할 수 없습니다. 
					 4. 회원을 탈퇴한 경우 상품쿠폰은 소멸됩니다. <br><br>
					 <strong>제 24조 (보너스쿠폰)</strong><br><br>
					 1. "회사"는 구매서비스를 이용하는 회원에게 상품 구매 시(단 사용불가 사전고지품목 제외) 일정액 또는 일정비율을 할인 받을 수 있는 보너스쿠폰을 발급할 수 있습니다.<br> 
					 2. 회원은 보너스쿠폰을 회원 본인의 구매에 한해서만 사용할 수 있으며, 어떠한 경우에도 이를 타인에게 실질적으로 매매 또는 양도할 수 없습니다.<br>
					 3.보너스쿠폰은 일부 품목이나 금액에 따라 사용이 제한될 수 있으며, 유효기간이 지난 후에는 사용할 수 없습니다. <br>
					 4.회원을 탈퇴한 경우 보너스쿠폰은 소멸됩니다. <br><br>
					 <strong>제 7장 기타</strong><br><br>  
					 <strong>제 25조 (저작권의 귀속 및 게시물 이용 제한)</strong><br><br>
					 1. "회사"가 작성한 저작물에 대한 저작권 기타 지적 재산권은 "회사"에 귀속합니다. <br>
					 2. 이용자는 서비스를 이용함으로써 얻은 정보를 "회사"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. <br>
					 3."회사"는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다. <br>
					 4. 회사는 회원이 서비스 내에 게시한 게시물이 타인의 저작권, 프로그램저작권 등을 침해하였음을 이유로 "회사"가 타인으로부터 손해배상청구 등 이의 제기를 받은 경우 회원은 "회사"의 면책을 위하여 노력하여야 하며,
							"회사"가 면책되지 못한 경우 회원은 그로 인해 "회사"에 발생한 모든 손해를 부담하여야 합니다. <br>
					 5."회사"는 회원이 서비스 내에 게시한 게시물(회원간 전달 포함)이 다음 각 호의 경우에 해당한다고 판단되는 경우 사전통지 없이 삭제, 변경할 수 있으며, 이에 대해 "회사"는 어떠한 책임도 지지 않습니다. <br>
					 ① 스팸(spam)성 게시물 및 상업성 게시물 (예: 행운의 편지, 특정사이트 광고 등) <br>
					 ② 타인을 비방할 목적으로 허위 사실을 유포하여 타인의 명예를 훼손하는 글<br>
			   		 ③ 동의 없는 타인의 신상공개, 제3자의 저작권 등 권리를 침해하는 내용, 기타 게시판 주제와 다른 내용의 게시물<br>
			   		 ④ 기타 관계 법령 및 "회사"의 지침 등에 위반된다고 판단되는 경우 <br><br>
			   		 <strong>제 26조 (면책)</strong><br><br>
			   		 1. "회사"는 천재지변, 불가항력 	기타 "회사"의 합리적인 통제범위를 벗어난 사유로 인하여 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다. <br>
			   		 2."회사"는 이용자의 귀책사유로 인하여 서비스를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다. <br>
			   		 3."회사"는 이용자가 서비스를 이용함으로써 기대되는 수익을 얻지 못하거나 서비스를 통해 얻은 자료를 이용하여 	발생한 손해에 대해서는 책임을 부담하지 않습니다. <br>
			   		 4.이용자가 화면에 게재한 정보, 자료, 사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 이용자가 책임을 부담하며, "회사"는 내용의 부정확 또는 허위로 인해 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다. <br>
			   		 5."회사"는 서비스 이용과 관련하여 이용자의 고의 또는 과실로 인하여 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.<br><br>
			   		 <strong>제 27조(사이트의 연결)</strong><br><br>
					  1. 타 사이트에 하이퍼링크(하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등에 의해 연결시킬 수 있습니다. <br>
					  2. "회사"는 이용자가 해당 연결사이트와 독자적으로 상품 또는 용역을 거래한 행위에 대해서는 아무런 책임을 부담하지 않습니다.<br><br>
					 <strong>제 28조 (정보의 제공 및 광고의 게재)</strong><br><br>
					 1."회사"는 서비스를 운영함에 있어 각종	정보를 서비스 화면에 게재하거나 e-mail 및 서신우편 등의 방법으로 회원에게 제공할 수 있습니다. <br>
					 2."회사"는 서비스의 운영과 관련하여 홈페이지, 서비스 화면, SMS, e-mail등에 광고 등을 게재할 수 있습니다.<br>
					 3. 회원이 서비스상에 게재되어 있는 광고를 이용하거나 서비스를 통한 광고주의 판촉활동에 참여하는 등의 방법으로 교신 또는 거래를 하는 것은 전적으로 회원과 광고주 간의 문제입니다. 만약 회원과 광고주간에 문제가 발생할 경우에도 회원과 광고주가
							직접 해결하여야 하며, 이와 관련하여 "회사"는 어떠한 책임도 지지 않습니다.<br><br>
					<strong>제 29조 (분쟁해결)</strong><br><br> 
					 1."회사"는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구인 고객센터를 설치·운영합니다.<br>
					 2."회사"는 이용자로부터 제출되는 불만사항 및 의견을 우선적으로 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다. <br>
					 3."회사"와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시.도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. <br><br>
					 <strong>제 30조 (재판권 및 준거법)</strong><br><br> 
					 1."회사"와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. <br>
					 2."회사"와 이용자간에 제기된 전자상거래 소송에는 대한민국법을 적용합니다. <br>(부칙) 2018년 11월 19일부터 시행합니다. (2018.11.19 개정)
						</p>
						</div>
						<div>
						<br>
						<button type="button" class="btn btn-dark" data-dismiss="modal">확인 및 닫기</button>
						</div>
					</div>
            </div>
         </div>
      </div>
   </div>
   <!-- modify modal -->
   <div class="modal fade animated flip" id="member_modify_complete_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title" id="myModalLabel">회원정보수정</h4>
               <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>               
            </div>
            <div class="modal-body" style="text-align: center;">
              <i class="fas fa-circle-notch fa-spin fa-4x"></i>
              <br><br>
               <div class="container">
                     <div><strong>회원정보를 수정하였습니다.</strong></div>
                     <div><strong>다시 로그인해주세요.</strong></div>
               </div>   
               <div>
                  <br>
                  <button type="button" class="btn btn-warning" id="member_modify_complete_modalBtn">확인</button>
               </div>
            </div>
         </div>
      </div>
   </div>
