$(document).ready(function(){
	
	var cateNum = $('#cateNum').val();
	
	//최초 글목록 sortType 으로 채워주기
	//alert('수동적으로 : ' + $('#sortType').val());
	//글목록 불러옴
	$.ajax({
		type : 'POST',
		url : '../category/getList.do',
		data : {
			'cateNum' :  $("#cateNum").val(),
			'pg' : $("#pg").val(),
			'sortType':$('#sortType').val()
		}, //따옴표치면 문자열, 안치면 숫자 
		dataType : 'json',
		success : function(data) { //data에는 리스트들
			//alert(JSON.stringify(data));
			var card_contents = '';
			$.each(data.list, function(index, items) {
				card_contents += card(items);
			});
			$('#card_contents').html(card_contents);
			$('#categoryPaging').html(data.categoryPaging.pagingHTML);

		}
	});
	
	
	//왼쪽목록 에서 선택한경우
	$('.card-body p').click(function(){
		
		var cateNum_param = $(this).parent().parent().prev().find('a').text();
		
		if(cateNum_param == ' Clothes '){
			$('#cateNum').val(3);
		}else if(cateNum_param == ' Tech++ '){
			$('#cateNum').val(2);
		}else if(cateNum_param == ' Food '){
			$('#cateNum').val(1);
		}
		
		var p_midCate = $(this).text();
		if(p_midCate == 'All'){
			p_midCate = '';
		}
		
		$.ajax({
			type : 'POST',
			url : '../category/getList.do',
			data : {
				'cateNum' :  $("#cateNum").val(),
				'pg' : $("#pg").val(),
				'sortType' : $('#sortType').val(),
				'p_midCate' : p_midCate
			}, //따옴표치면 문자열, 안치면 숫자 
			dataType : 'json',
			success : function(data) { //data에는 리스트들
				//alert(JSON.stringify(data));
				var card_contents = '';
				$.each(data.list, function(index, items) {
					card_contents += card(items);
				});
				$('#card_contents').html(card_contents);
				$('#categoryPaging').html(data.categoryPaging.pagingHTML);

			}
		});
	});
})


//sortNo 1 : 인기순
//sortNo 2 : 신상품순
//sortNo 3 : 낮은가격순g
//sortNo 4 : 높은가격순

//sortList 1 : 10개씩
//sortList 2 : 20개씩

//categoriItemList.jsp 에서 사용


//페이지 이동
function categoryList(pg){
	//alert('페이지이동  : ' + $("#sortType").val());
	location.href='categoryItemList.do?pg='+pg+'&sortType='+$('#sortType').val();
}

//정렬 호출
function fn_sort(sortType) {			//sortType 제어 정렬누를시 pg 1로 설정
	
	$('#sortType').val(sortType);
	$('#pg').val(1);
	
	//alert($("#sortType").val());
	
	location.href='categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val();
	
	/*
	$.ajax({
		type : 'POST',
		url : '../category/getList.do',
		data : {
			'cateNum' :  $("#cateNum").val(),
			'pg' : $("#pg").val(),
			'sortType' : sortType
		}, //따옴표치면 문자열, 안치면 숫자 
		dataType : 'json',
		success : function(data) { //data에는 리스트들
			alert(JSON.stringify(data));
			//alert(JSON.stringify(data));
			var card_contents = '';
			$.each(data.list, function(index, items) {
				card_contents += card(items);
			});
			$('#card_contents').html(card_contents);
			$('#categoryPaging').html(data.categoryPaging.pagingHTML);

		},
		error : function(){
			alert('실패');
		}
	});
	
	*/
	
}

function goPage(cateNum){
	location.href = "../category/categoryItemList.do?cateNum="+cateNum;
}
