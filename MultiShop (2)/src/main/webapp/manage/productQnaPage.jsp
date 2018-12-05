<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="ordSearch" class="page-body">
	<h2>상품문의</h2>
	<div class="pc-switch">
		<div class="sect-hd">
			<h3>상품문의 답변달기</h3>
		</div>
		<div class="sect-cont">
			<table id= "answerTable">
         <colgroup>
            <col style="width:*;"/>
            <col style="width:*;"/>
            <col style="width:*;"/>
            <col style="width:*;"/>
            <col style="width:*;"/>
            <col style="width:*;"/>
            <col style="width:*;"/>
         </colgroup>
         <tr>
            <td colspan="1" align="center">제목 :</td>
            <td colspan="6"><input type="text" style="width: 95%; height:50px; margin-bottom: 20px; margin-top: 10px;" id="qna_Answer_subject" readonly></td>
         </tr>
         <tr>
            <td colspan="1" align="center">내용 : </td>
            <td colspan="6"><textarea style="width: 95%; height:200px; margin-bottom: 20px;" id="qna_Answer_content" readonly></textarea></td>
         </tr>
         <tr>
            <td colspan="1" align="center">답변 : </td>
            <td colspan="6"><input type="text" id="answerComplet" style="width:95%; height:150px; margin-bottom: 20px;">
                        <div id="answerCompletDiv"></div>
            </td>
         </tr>
         <tr>
         	<td style="text-align: center;" colspan="7">
         		<input type="button" id="answerCompletBtn" value="답변하기">
		         <input type="hidden" id="detail_hidden_P_code">
		         <input type="hidden" id="detail_hidden_Seq">
         	</td>
         </tr>
      </table>
	</div>
	</div>
	<div class="sect-hd">
		<h3>상품문의 답변</h3>
	</div>
	<div class="sect-cont">
		<div id="notice_list" class="tbl-list tbl-extend tbl-horz mt-20">
			<jsp:include page="../manage/productQna_table.jsp"></jsp:include>
		</div>
	</div>
</div>

	<script type="text/javascript">
	 $('#memberQnATable tbody').on('click','.memberQnAComplet',function(){
		    var seq = $(this).prev().prev().prev().prev().prev().text();
		    var p_code = $(this).prev().prev().prev().prev().text();
		    $.ajax({
		       type : 'POST',
		       url : '/MultiShop/manage/productQnaAnswerList.do',
		       data : {'p_code':p_code,
		             'seq':seq},
		       dataType : 'json',
		       success : function(data){
		           $.each(data.getDetail_AnswerList, function(index,items){
		                   $('#qna_Answer_subject').val(items.detail_QnASubject);
		                   $('#qna_Answer_content').val(items.detail_QnAContent);
		                   $('#detail_hidden_P_code').val(items.p_code);
		                   $('#detail_hidden_Seq').val(items.seq);
		                });
		       }
		    });
		    
		 });
		 $('#answerCompletBtn').on('click',function(){
		    if($('#answerComplet').val()==""){
		       $('#answerCompletDiv').text("답변 내용이 없습니다.").css("color","red").css("font-size","9px");
		    }
		    else{
		       var p_code =  $('#detail_hidden_P_code').val();
		       var replyContent = $('#answerComplet').val();
		       var seq =  $('#detail_hidden_Seq').val();
		       var reply = "complet";
		       $.ajax({
		          type : 'POST',
		          url : '/MultiShop/manage/productQnaUpdate.do',
		          data : {
		             'p_code':p_code,
		             'replyContent':replyContent,
		             'reply':reply,
		             'seq':seq
		          },
		          success : function(){
		             alert("답변 완료");
		             location.reload();
		          }
		       });
		    }
		    
		 });
	</script>