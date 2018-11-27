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
	<div class="modal fade animated lightSpeedIn" id="privatePolicy_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
						일부 재화 또는 용역 상품에 대한 주문 및 접수 시 회원이 원하는 정확한 주문 내용 파악을 통한 원활한 주문 및 결제, 배송을 위하여 추가적인 정보를 요구하고 있습니다.
						<strong>just COZY</strong>는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
						- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청 <br>
						- 협력회사로부터의 제공<br>
						- 로그 분석 프로그램을 통한 생성정보 수집<br>
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
						*기술적 대책 <strong>just COZY</strong>는 귀하의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다. <br>
						<strong>just COZY</strong>는 방화벽(Fire Wall)과 Nescape사의 채널보안방식인 SSL(Secure Socket Layer)방식 암호화 체계 시스템 등을 갖추어 개인정보 보호에 만전을 기하고 있습니다.<br>				
						세계적인 보안 인증 회사로부터 인증서를 발급 받아 <strong>just COZY</strong>를 사칭하는 것을 방지하여 고객께 피해가 가지 않도록 하고 있습니다.<br>
						 귀하의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다. <br>
						<strong>just COZY</strong>는 백신프로그램을 이용하여 컴퓨터바이러스에 의한 피해를 방지하기 위한 조치를 취하고 있습니다.<br>
						백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공 함으로써 개인정보가 침해되는 것을 방지하고 있습니다. <br>
						<strong>just COZY</strong>는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다. <br>
						개인정보에 해당하는 이메일, 휴대폰번호 등은 암호화되어 저장하고 있습니다. <br>
						*관리적 대책 에이플러스비는 귀하의 개인정보에 대한 접근 권한을 최소한의 인원으로
							제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다. 이용자를 직접 상대로 하여 마케팅 업무를
							수행하는 자 개인정보보호책임자 및 담당자 등 개인정보보호업무를 수행하는 자 기타 업무상 개인정보의 처리가 불가피한 자
							① 개인정보를 처리하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보 보호 의무 등에 관해 정기적인 사내교육 및
							외부 위탁교육을 실시하고 있습니다. ② 입사 시 전 직원의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고
							개인정보처리방침에 대한 이행사항 및 직원의 준수여부를 감사하기 위한 내부절차를 마련하고 있습니다. ③ 개인정보 관련
							처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한
							책임을 명확화하고 있습니다. ④ 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다. ⑤
							에이플러스비는 이용자 개인의 실수나 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다. 회원
							개개인이 본인의 개인정보를 보호하기 위해서 자신의 ID 와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야
							합니다. ⑥ 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될
							경우 에이플러스비는 즉각 귀하께 사실을 알리고 적절한 대책과 보상을 강구할 것입니다. 제 9조 (링크사이트)
							에이플러스비는 귀하께 다른 회사의 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 에이플러스비
							외부사이트 및 자료에 대한 아무런 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며
							보증할 수 없습니다. 에이플러스비가 포함하고 있는 링크를 클릭(Click)하여 타 사이트(Site)의 페이지로 옮겨갈
							경우 해당 사이트의 개인정보처리방침은 에이플러스비와 무관하므로 새로 방문한 사이트의 정책을 검토해 보시기 바랍니다.

							제 10조 (게시물) 에이플러스비는 귀하의 게시물을 소중하게 생각하여 변조, 훼손, 삭제되지 않도록 최선을 다하여
							보호합니다.그러나 다음의 경우는 그렇지 아니합니다. - 스팸(spam)성 게시물 및 상업성 게시물 (예: 행운의
							편지, 특정사이트 광고 등) - 타인을 비방할 목적으로 허위 사실을 유포하여 타인의 명예를 훼손하는 글 - 동의 없는
							타인의 신상공개, 제3자의 저작권 등 권리를 침해하는 내용, 기타 게시판 주제와 다른 내용의 게시물 에이플러스비는
							바람직한 게시판 문화를 활성화하기 위하여 동의 없는 타인의 신상 공개 시 특정부분 이동 경로를 밝혀 오해가 없도록
							하고 있습니다. 그 외의 경우 명시적 또는 개별적인 경고 후 삭제 조치할 수 있습니다. 근본적으로 게시물에 관련된
							제반 관리와 책임은 작성자 개인에게 있습니다. 또 게시물을 통해 자발적으로 공개된 정보는 보호받기 어려우므로 정보
							공개 전에 심사 숙고하시기 바랍니다. 제 11조 (이용자의 권리와 의무) 귀하의 개인정보를 최신의 상태로 정확하게
							입력하여 불의의 사고를 예방해 주시기 바랍니다. 귀하가 입력한 부정확 한 정보로 인해 발생하는 사고의 책임은 이용자
							자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원 자격이 상실될 수 있습니다. 귀하는 개인정보를
							보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 비밀번호를 포함한 귀하의
							개인정보가 유출되지 않도록 조심 하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오. 만약 이
							같은 책임을 다하지 못하고 타인의 정보 및 존엄성을 훼손할 시에는 ‘정보통신망이용 촉진및정보보호등에관한법률’ 등에
							의해 처벌받을 수 있습니다. 온라인상에서(게시판, E-mail, 또는 채팅 등) 귀하가 자발적으로 제공하는 개인정보는
							다른 사람들이 수집하여 사용할 수 있음을 항상 유념하시기 바랍니다. 즉, 공개적으로 접속할 수 있는 온라인상에서
							개인정보를 게재하는 경우, 다른 사람들로부터 원치 않는 메시지를 답장으로 받게 될 수도 있음을 의미합니다.
							공공장소에서 이용할 때에는 자신의 비밀번호가 노출되지 않도록 하고 서비스 이용을 마친 후에는 반드시 로그아웃을
							해주시기 바랍니다. 제 12조 (이용자 및 법정 대리인의 권리와 그 행사방법) 귀하는 언제든지 등록되어 있는 자신의
							개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 귀하의 개인정보 조회, 수정 또는 가입해지를
							위해서는 「MY 개인정보」버튼을 클릭하여 본인확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은
							개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다. 에이플러스비는 귀하의 요청에
							의해 해지 또는 삭제된 개인정보는 “제 6조 개인정보의 보유, 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로
							열람 또는 이용할 수 없도록 처리하고 있습니다. 제 13조 (개인정보 자동 수집 장치의 설치, 운영 및 그 거부에
							관한 사항) 쿠키(cookie)란? 에이플러스비는 귀하에 대한 정보를 저장하고 수시로 찾아내는 쿠키(cookie)를
							사용합니다. 쿠키는 웹사이트가 귀하의 컴퓨터 브라우저(넷스케이프, 인터넷익스플로러 등)로 전송하는 소량의 정보입니다.
							귀하께서 웹사이트에 접속을 하면 에이플러스비의 서버는 귀하의 브라우저에 추가정보를 임시로 저장하여 접속에 따른 성명
							등의 추가 입력 없이 에이플러스비의 서비스를 제공할 수 있습니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로
							식별하지는 않습니다. 또한 귀하는 쿠키에 대한 선택권이 있습니다. 에이플러스비의 쿠키 운용 에이플러스비는 이용자의
							편의를 위하여 쿠키를 운영합니다. 에이플러스비가 쿠키를 통해 수집하는 정보는 회원ID에 한하며, 그 외의 다른 정보는
							수집하지 않습니다. 에이플러스비가 쿠키를 통해 수집한 회원 ID는 다음의 목적을 위해 사용됩니다. ① 개인의 관심
							분야에 따란 차별화된 정보를 제공 ② 쇼핑한 품목들에 대한 정보와 장바구니 서비스를 제공 ③ 회원과 비회원의 접속빈도
							또는 머문 시간 등을 분석하여 서비스 개편 및 마케팅에 활용 쿠키는 브라우저의 종료시나 로그아웃 시 만료됩니다.
							쿠키의 설치 및 거부 ① 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 귀하는 웹브라우저에서 옵션을
							설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도
							있습니다. ② 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 에이플러스비 일부 서비스는 이용에 어려움이 있을
							수 있습니다. ③ 쿠키 설치 허용 여부를 지정하는 방법 - Internet Explorer의 경우 : [도구]
							메뉴에서 [인터넷 옵션]을 선택 → [개인정보]를 클릭 → [고급]을 클릭 → 쿠키 허용여부를 선택 - Safari의
							경우 :MacOS 상단 좌측 메뉴바에서 [Safari]에서 [환경설정]을 선택 → [환경설정] 창에서 [보안]으로
							이동하여 쿠키 허용여부 선택 제 14조 (개인정보 보호문의처) 당사는 귀하의 의견을 소중하게 생각하며, 귀하는
							의문사항으로부터 언제나 성실한 답변을 받을 권리가 있습니다. 당사는 귀하와의 원활한 의사소통을 위해 고객행복센터를
							운영하고 있습니다. 고객행복센터의 연락처는 다음과 같습니다. [고객행복센터] - 이메일 :
							customer@29cm.co.kr - 전화번호 : 1644-0560 - 팩스번호 : 070-8622-7737 -
							주소 : 서울특별시 마포구 양화로10길 45 (서교동), 29CM고객센터 전화상담은 월~금요일 오전 10:00 ~
							오후 07:00에만 가능합니다. (주말, 공휴일 휴무) 전자우편이나 팩스 및 우편을 이용한 상담은 접수 후 24시간
							내에 성실하게 답변 드리겠습니다. 다만 근무시간 이후 또는 주말 및 공휴일에는 익일 처리하는 것을 원칙으로 합니다.
							기타 개인정보에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 인터넷범죄수사센터, 경찰청
							사이버테러대응센터 등으로 문의하실 수 있습니다. [개인정보침해신고센터] 118 /
							http://www.118.or.kr/ 118@kisa.or.kr / 02-3480-3600 [대검찰청
							인터넷범죄수사센터] http://icic.sppo.go.kr/ 02-392-0330 [경찰청 사이버테러대응센터]
							http://ctrc.go.kr/ 제 15조 (개인정보보호책임자 및 담당자) 에이플러스비는 귀하가 좋은 정보를
							안전하게 이용할 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 귀하께 고지한 사항들에 반하는 사고가
							발생할 시에 개인정보관리책임자가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인
							네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종
							분쟁에 관해서는 책임이 없습니다. 귀하의 개인정보를 취급하는 책임자 및 담당자는 다음과 같으며 개인정보 관련
							문의사항에 신속하고 성실하게 답변해드리고 있습니다. [개인정보 관리 책임자] 성명 : 방현우 소속 : 기술개발팀 직책
							: CTO 이메일 : bangslosan@29cm.co.kr 전화: 1644-0560 Fax:
							070-8622-7737 제 16조 (고지의 의무) 개인정보처리방침은 2013년 05월 15일부터 적용됩니다. 내용의
							추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 공지사항을 통하여 고지할 것입니다. 또한
							개인정보처리방침에 버전번호 및 개정일자 등을 부여하여 개정여부를 쉽게 알 수 있도록 하고 있습니다. 개인정보처리방침
							버전번호 : v201305124 개인정보처리방침 변경공고일자 : 2013년 05월 15일 개인정보처리 시행일자 :
							2013년 05월 24일
						</p>
						</div>
					</div>	
					<div>
						<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
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
