<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <button type="button" class="btn btn-primary" id="mypage_member_modifyBtn">회원정보수정</button>
    <button type="button" class="btn btn-primary" id="mypage_deleveryBtn">주문배송조회</button>
    <button type="button" class="btn btn-primary" id="mypage_coupon_pointBtn">쿠폰/포인트</button>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
   <div style="margin:20px 0;">
      <div class="row">
         <form id="member_modify_form" role="form">
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="far fa-envelope -o fa-fw"></i></span>
                  <input type="text" class="form-control" id="member_modify_email" name="m_email" value="${memberDTO.m_email}" aria-required="true" readonly>
                  <input type="hidden" id="" value="0">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
                  <input type="password" class="form-control" id="member_modify_pwd" name="m_pwd" placeholder="비밀번호" required="required">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="fas fa-unlock-alt -o fa-fw"></i></span>
                  <input type="password" class="form-control" id="member_modify_repwd" placeholder="비밀번호 재입력" required="required">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="far fa-user -o fa-fw"></i></span>
                  <input type="text" class="form-control" id="member_modify_name" name="m_name" value="${memberDTO.m_name}" placeholder="이름" required="required">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="fas fa-mobile-alt -o fa-fw"></i></span>
                  <input type="text" class="form-control" id="member_modify_phone" name="m_tel_phone" value="${memberDTO.m_tel_phone}" placeholder="- 빼고 입력" required="required">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <span class="input-group-addon"><i class="fas fa-map-marked-alt -o fa-fw"></i></span>
                  <input type="text" class="form-control" id="member_modify_postcode" name="m_zipcode" value="${memberDTO.m_zipcode}" placeholder="우편번호" required="required">
                  <input type="button" class="btn btn-dark" id="member_modify_postcodeBtn" value="우편번호찾기" onclick="execDaumPostcode2()">
               </div>
            </div>
            <div class="col-md-12">
               <div class="input-group" style="margin-bottom: 10px">
                  <input type="text" class="form-control" id="member_modify_roadAddress" name="m_roadAddress" value="${memberDTO.m_roadAddress}" placeholder="도로명주소" readonly="">
                  <input type="text" class="form-control" id="member_modify_jibunAddress" name="m_jibunAddress" value="${memberDTO.m_jibunAddress}" placeholder="상세 주소">
               </div>
            </div>
            <div id="member_modify_statusDiv">
            </div>
            <div class="float_center">         
               <button type="button" class="btn btn-success" id="member_modifyBtn"><i class="fas fa-check fa-2x"></i></button>
            </div>
         </form>
      </div>
   </div>
</div>
>>>>>>> refs/remotes/origin/minu
