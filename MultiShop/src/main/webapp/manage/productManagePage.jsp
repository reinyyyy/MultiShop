<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="ordSearch" class="page-body">
	<h2>상품관리</h2>
	<div class="pc-switch">
		<div class="sect-hd">
			<h3>상품관리</h3>
		</div>
		<div class="sect-cont">
			 <div id="modifyForm">
	           <table id="productRow">
	            <thead>
	               <tr>
	                  <th>상품코드</th>
	                  <th>상품명</th>
	                  <th>옵션1</th>
                      <th>옵션2</th>
	                  <th>수량</th>
	                  <th>가격</th>
	                  <th>등록일</th>
	                  <th>판매량</th>
	                  <th>판매 상태</th>
	               </tr>
	            </thead>
	               <tr>
	                  <td class="p_code1" align="center"></td>
	                  <td class="p_name1" align="center"><input type="text" id="p_name2" value=""></td>
	                  <td class="p_option1_1" align="center"><input type="text" id="p_option1_1" value=""></td>
                  	  <td class="p_option2_1" align="center"><input type="text" id="p_option2_1" value=""></td>
	                  <td class="p_amount1" align="center"><input type="text" id="p_amount2" value=""></td>
	                  <td class="p_cost1" align="center"><input type="text" id="p_cost2" value=""></td>
	                  <td class="p_date1" align="center"></td>
	                  <td class="p_sales1" align="center"></td>
	                  <td class="p_status1" align="center"><a id="" href='#'><span id="p_status2"></span></a></td>
	               </tr>
	               <tr>
	               		<td colspan="9">
	               			<div style="float:right;">
				            <input type="button" id="p_modify" value="수정하기">
				            <input type="button" id="p_delete" value="삭제하기">
				            </div>
	               		</td>
	               </tr>
	            </table>
        </div>
		</div>
	</div>
	<div class="sect-hd">
		<h3>상품 목록</h3>
	</div>
	<div class="sect-cont">
		<div id="notice_list" class="tbl-list tbl-extend tbl-horz mt-20">
			<jsp:include page="../manage/productManage_table.jsp"></jsp:include>
		</div>
	</div>
	
<script>
$(document).ready(function(){
   $('#productLists').on('click','tbody tr', function(){
      
      var tr = $(this);
      var td = tr.children();
      var arr = new Array();
      console.log("클릭한 Row의 모든 데이터 : "+tr.text());
      
      td.each(function(i){
           arr.push(td.eq(i).text());
       });
      
      var p_code = td.eq(0).text();
      var p_name = td.eq(1).text();
      var p_option1 = td.eq(2).text();
      var p_option2 = td.eq(3).text();
      var p_amount = td.eq(4).text();
      var p_cost = td.eq(5).text();
      var p_date = td.eq(6).text();
      var p_sales = td.eq(7).text();
      var p_status = td.eq(8).text();
      
      $(".p_code1").text(p_code);
      $('#p_name2').val(p_name);
      $("#p_option1_1").val(p_option1);
      $("#p_option2_1").val(p_option2);
      $('#p_amount2').val(p_amount);
      $('#p_cost2').val(p_cost);
      $(".p_date1").text(p_date);
      $(".p_sales1").text(p_sales);
      $('#p_status2').text(p_status);
         
   });
   
   $('#p_status2').click(function(){
      if($('#p_status2').text()=='Y'){
         $('#p_status2').text('N');
      }else {
         $('#p_status2').text('Y');
      }
   });
   
   $('#p_modify').on('click',function(){
      
      p_code = $(".p_code1").text();
      p_name = $('#p_name2').val();
      p_option1 = $("#p_option1_1").val();
      p_option2 = $("#p_option2_1").val();
      p_amount = $('#p_amount2').val();
      p_cost = $('#p_cost2').val();
      p_date = $(".p_date1").text();
      p_sales = $(".p_sales1").text();
      p_status = $('#p_status2').text();
      
      if(p_code == ''){
         $('#p_data_null').html("데이터가 없습니다.").css('color','red').css('font-weight','bold');
      }else {
         $.ajax({
            url : './productModifyJson.do',
            type : 'POST',
            data : {'p_code':p_code,'p_name':p_name,'p_option1':p_option1,'p_option2':p_option2,'p_amount':p_amount,'p_cost':p_cost,'p_date':p_date,'p_sales':p_sales, 'p_status':p_status},
            dataType : 'json',
            success : function(data){
               location.reload();
            }
         });
      }
   });
   
$('#p_delete').on('click',function(){
      
      p_code = $(".p_code1").text();
      
      if(p_code == ''){
         $('#p_data_null').html("데이터가 없습니다.").css('color','red').css('font-weight','bold');
      }else {
         $.ajax({
            url : './productDeleteJson.do',
            type : 'POST',
            data : {'p_code':p_code},
            dataType : 'json',
            success : function(data){
               alert('삭제되었습니다.');
               location.reload();
            }
         });
      }
   });
});
</script>