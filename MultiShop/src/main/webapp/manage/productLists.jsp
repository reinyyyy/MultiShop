<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="prdSearch" class="page-body">
    <h2>상품 관련</h2>
    
    <div class="pc-switch">
        <div class="sect-cont">
            <div class="tbl-side exec-bar" style="overflow:auto;">    
                <div class="tbl-list mt-20" style="height: 175px;">
                <table id="productLists">
						<thead>
							<tr>
								<th>상품코드</th>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
								<th>등록일</th>
								<th>판매량</th>
								<th>판매 상태</th>
							</tr>
						</thead>
                </table>
            	</div><!-- .tbl-list -->
            </div><!-- .tbl-side -->
            <div id="pagination"></div>
        </div><!-- .sect-cont -->
        <br>
        <br>
        <br>
        <div id="modifyForm">
        	<table id="productRow">
				<thead>
					<tr>
						<th>상품코드</th>
						<th>상품명</th>
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
						<td class="p_amount1" align="center"><input type="text" id="p_amount2" value=""></td>
						<td class="p_cost1" align="center"><input type="text" id="p_cost2" value=""></td>
						<td class="p_date1" align="center"></td>
						<td class="p_sales1" align="center"></td>
						<td class="p_status1" align="center"><a id="" href='#'><span id="p_status2"></span></a></td>
					</tr>
            </table>
            <br>
            <div style="float:right; margin-right : 100px">
				<input type="button" id="p_modify" value="수정하기">
				<input type="button" id="p_delete" value="삭제하기">
            </div>
            <div id="p_data_null" style="float:right; margin-right:50px">
			</div>
        </div>
    </div><!-- .pc-switch -->
</div>
<script>
$(document).ready(function(){
	
	$('#productLists').DataTable({
		ajax: {
	         'url':'/MultiShop/manage/productListsJson.do',
	         'type': 'POST'
	     },
		"columns" : [
			{"data":"p_code","class":"p_code modify"},
			{"data":"p_name","class":"p_name modify"},
			{"data":"p_amount","class":"p_amount modify"},
			{"data":"p_cost","class":"p_cost modify"},
			{"data":"p_date","class":"p_date modify"},
			{"data":"p_sales","class":"p_sales modify"},
			{"data":"p_status","class":"p_status modify"}
		],
		"searching" : true,
		responsive : true,
		"ordering": true,
		"language" : {
			"emptyTable" : "데이터가 없습니다.",
			"info" : "_START_ - _END_ (총 _TOTAL_개)",
			"infoEmpty" : "0명",
			"infoFiltered" :"(전체 _MAX_개의 품목 중 검색결과)",
			"lengthMenu" : "_MENU_"+"&emsp;&emsp;",
			"zeroRecords" : "검색된 데이터가 없습니다.",
			"paginate" : {
				"first" : "첫페이지",
				"last" : "마지막 페이지",
				"next" : "다음",
				"previous" : "이전"
			},
			"aria" : {
				"sortAscending" : "오름차순 정렬",
				"sortDescending" : "내림차순 정렬"
			}
		}
	});
	
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
		var p_amount = td.eq(2).text();
		var p_cost = td.eq(3).text();
		var p_date = td.eq(4).text();
		var p_sales = td.eq(5).text();
		var p_status = td.eq(6).text();
		
		$(".p_code1").text(p_code);
		$('#p_name2').val(p_name);
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
				data : {'p_code':p_code,'p_name':p_name,'p_amount':p_amount,'p_cost':p_cost,'p_date':p_date,'p_sales':p_sales, 'p_status':p_status},
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

