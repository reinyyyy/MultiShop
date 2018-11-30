<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div style="text-align: center;"><h3>비밀번호</h3></div>
   <div id="member_modify_confirm" style="text-align: center;">
   <form id="member_modify_confirm_form" method="post" action="/MultShop/">
      <div>
         이메일 : <input type="text" id="member_modify_email" name="m_email" value='${session_email }' readonly="readonly">
      </div>
      <div>
         비밀번호 : <input type="password" id="member_modify_pwd" name="m_pwd">
      </div>
      <div id="member_modify_statusDiv">
      </div>
      <div>
         <input type="button" value="확인" id="member_modify_confirm_Btn">
         <input type="reset" value="취소">
      </div>
   </form>
   </div>