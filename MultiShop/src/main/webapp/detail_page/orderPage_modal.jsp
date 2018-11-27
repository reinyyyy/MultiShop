<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal" id="order_modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>결재가 완료되었습니다.</p><br>
        <p>마이페이지로 이동 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="orderModalYesBtn">예</button>
        <button type="button" class="btn btn-secondary" id="orderModalNoBtn" data-dismiss="modal">아니오</button>
      </div>
    </div>
  </div>
</div>