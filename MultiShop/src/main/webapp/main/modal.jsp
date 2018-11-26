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
						title="비밀번호가 기억 안 나시면 오른쪽 버튼을 눌러 비밀번호를 찾아주세요">
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
