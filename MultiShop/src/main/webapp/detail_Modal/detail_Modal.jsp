<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div class="modal fade" id="detail_hoogiModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
          
            <label for="recipient-name" class="form-control-label">만족도</label><br>
          <ul class="detail_hoogiModalUl">
             <li>
               <input type="radio" name="detail_hoogiStar" value="1" checked>
                <label for="detail_hoogiStar1">★☆☆☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="2">
                <label for="detail_hoogiStar2">★★☆☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="3">
                <label for="detail_hoogiStar3">★★★☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="4">
                <label for="detail_hoogiStar4">★★★★☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="5">
                <label for="detail_hoogiStar5">★★★★★</label>
           </li>
          </ul>
          <br>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label" style="float : left;">후기작성</label>
            <input type="text" class="form-control" id="detail_hoogiModalContent" name="detail_hoogiModalContent" placeholder="10자내로 작성하시오."/>
            <div id="detail_hoogiModalContentDiv"></div>    
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="detail_hoogiCloseBtn">Close</button>
        <button type="button" class="btn btn-primary" id="detail_hoogiSendBtn">Send</button>
      </div>
    </div>
  </div>
</div>

<!-- 등록 완료 -->
<div class="modal fade bd-example-modal-sm" id="detail_hoogiOkModal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      등록 완료
    </div>
  </div>
</div>
<!-- QnA Modal -->
<div class="modal fade" id="detail_QnAModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품 Q&A</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">제목:</label>
            <input type="text" class="form-control" id="detail_QnASubject"><br>
            <div id="detail_QnASubjectDiv"></div>
          </div>
          <div class="form-group" style="overflow : hidden; margin : 0px;">
            <label for="recipient-name" class="form-control-label">상태:</label>
            <ul class="detail_QnAModalUl">
             <li>
               <input type="radio" name="detail_QnACondition" value="happy" checked>
                <label for="detail_hoogiStar1"><img src="../image/happy.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="modern">
                <label for="detail_hoogiStar2"><img src="../image/modern.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="sad">
                <label for="detail_hoogiStar3"><img src="../image/sad.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="angly">
                <label for="detail_hoogiStar4"><img src="../image/angly.png"></label>
           </li>
          </ul>
          <br>
            <div id="detail_QnASubjectDiv"></div>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">내용:</label>
            <textarea class="form-control" id="detail_QnAContent"></textarea><br>
            <div id="detail_QnAContentDiv"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="detail_QnASendBtn">Send</button>
      </div>
    </div>
  </div>
</div>
<!-- QnA View -->
<div class="modal fade" id="detail_QnAModalView" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품 Q&A</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group detail_QnAView_Form-group">
            <label for="recipient-name" class="form-control-label">제목:</label>
            <input type="text" class="form-control" id="detail_QnASubjectView" readonly><br>
            <div id="detail_QnASubjectViewDiv"></div>
          </div>
          <div class="form-group detail_QnAView_Form-group">
            <label for="message-text" class="form-control-label">내용:</label>
            <textarea class="form-control" id="detail_QnAContentView" readonly></textarea><br>
            <div id="detail_QnAContentViewDiv"></div>
          </div>
          <div>
             <label for="message-text" class="form-control-label">답글:</label>
             <input type= "text" class="form-control" id="detail_QnAReplyView">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="detail_QnASendViewBtn">Send</button>
      </div>
    </div>
  </div>
</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div class="modal fade" id="detail_hoogiModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style="z-index : 1050;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
          
            <label for="recipient-name" class="form-control-label">만족도</label><br>
          <ul class="detail_hoogiModalUl">
             <li>
               <input type="radio" name="detail_hoogiStar" value="1" checked>
                <label for="detail_hoogiStar1">★☆☆☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="2">
                <label for="detail_hoogiStar2">★★☆☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="3">
                <label for="detail_hoogiStar3">★★★☆☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="4">
                <label for="detail_hoogiStar4">★★★★☆</label>
           </li>
           <li>
               <input type="radio" name="detail_hoogiStar" value="5">
                <label for="detail_hoogiStar5">★★★★★</label>
           </li>
          </ul>
          <br>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label" style="float : left;">후기작성</label>
            <input type="text" class="form-control" id="detail_hoogiModalContent" name="detail_hoogiModalContent" placeholder="10자내로 작성하시오."/>
            <div id="detail_hoogiModalContentDiv"></div>    
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="detail_hoogiCloseBtn">Close</button>
        <button type="button" class="btn btn-primary" id="detail_hoogiSendBtn">Send</button>
      </div>
    </div>
  </div>
</div>

<!-- 등록 완료 -->
<div class="modal fade bd-example-modal-sm" id="detail_hoogiOkModal" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      등록 완료
    </div>
  </div>
</div>
<!-- QnA Modal -->
<div class="modal fade" id="detail_QnAModal" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품 Q&A</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="form-control-label">제목:</label>
            <input type="text" class="form-control" id="detail_QnASubject"><br>
            <div id="detail_QnASubjectDiv"></div>
          </div>
          <div class="form-group" style="overflow : hidden; margin : 0px;">
            <label for="recipient-name" class="form-control-label">상태:</label>
            <ul class="detail_QnAModalUl">
             <li>
               <input type="radio" name="detail_QnACondition" value="happy" checked>
                <label for="detail_hoogiStar1"><img src="../image/happy.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="modern">
                <label for="detail_hoogiStar2"><img src="../image/modern.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="sad">
                <label for="detail_hoogiStar3"><img src="../image/sad.png"></label>
           </li>
           <li>
               <input type="radio" name="detail_QnACondition" value="angly">
                <label for="detail_hoogiStar4"><img src="../image/angly.png"></label>
           </li>
          </ul>
          <br>
            <div id="detail_QnASubjectDiv"></div>
          </div>
          <div class="form-group">
            <label for="message-text" class="form-control-label">내용:</label>
            <textarea class="form-control" id="detail_QnAContent"></textarea><br>
            <div id="detail_QnAContentDiv"></div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="detail_QnASendBtn">Send</button>
      </div>
    </div>
  </div>
</div>
<!-- QnA View -->
<div class="modal fade" id="detail_QnAModalView" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품 Q&A</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group detail_QnAView_Form-group">
            <label for="recipient-name" class="form-control-label">제목:</label>
            <input type="text" class="form-control" id="detail_QnASubjectView" readonly><br>
          </div>
          <div class="form-group detail_QnAView_Form-group">
            <label for="message-text" class="form-control-label">내용:</label>
            <textarea class="form-control" id="detail_QnAContentView" readonly></textarea><br>
          </div>
          <div>
             <label for="message-text" class="form-control-label">답글:</label>
             <input type= "text" class="form-control" id="detail_QnAReplyView">
          </div>
          <input type="hidden" id="detail_QnAReplySeq">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="detail_QnASendViewBtn">Send</button>
      </div>
    </div>
  </div>
</div>
>>>>>>> refs/remotes/origin/jekal3
</body>