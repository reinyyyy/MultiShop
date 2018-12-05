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
			//alert(data.list.length);
			if(data.list.length == 0){
				var temp = '<div style="width : 100%; height : 300px; margin-top : 300px" align="center">'+
			    '<h4>상품이 없습니다</h4>'+
			    '</div>';
				$('#card_contents').html(temp);
				return;
			}
			
			var card_contents = '';
			$.each(data.list, function(index, items) {
				card_contents += card(items);
			});
			$('#card_contents').html(card_contents);
			$('.pagination').html(data.categoryPaging.pagingHTML);

		}
	});
	
	
	//왼쪽목록 에서 선택한경우
	
	//페이징처리, sql문 새로 작성
	//페이징처리해서 다른페이지 눌렀을경우 ?
	$('.card-body p').click(function(){
		alert("");
		var cateNum_param = $(this).parent().parent().prev().find('a').text();
		
		if(cateNum_param == ' Clothes '){
			$('#cateNum').val(3);
		}else if(cateNum_param == ' Tech++ '){
			$('#cateNum').val(2);
		}else if(cateNum_param == ' Food '){
			$('#cateNum').val(1);
		}
		$('#midCate').val($(this).text());	//페이지 이동시 필요해서 넣음
		
		//alert($('#midCate').val());
		
		var p_midCate = $(this).text();
		if(p_midCate == 'All'){
			p_midCate = '';
		}//학원에서 수정해야댐@@
		
		
		
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
				if(data.list.length == 0){
					var temp = '<div style="width : 100%; height : 300px; margin-top : 300px;" align="center">'+
				    '<h4 style="">상품이 없습니다</h4>'+
				    '</div>';
					$('#card_contents').html(temp);
					return;
				}
				var card_contents = '';
				$.each(data.list, function(index, items) {
					card_contents += card(items);
				});
				$('#card_contents').html(card_contents);
				$('.pagination').html(data.categoryPaging.pagingHTML);
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
	
	location.href='categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val()+'&cateNum='+$('#cateNum').val();
	
}

function goPage(cateNum){
	location.href = "../category/categoryItemList.do?cateNum="+cateNum;
}
