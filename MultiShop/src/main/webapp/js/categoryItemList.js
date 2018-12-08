$(document).ready(function(){
	
	var cateNum = $('#cateNum').val();
	//alert($('#cateNum').val());
	//alert($('#p_midCate').val());
	//글 목록 불러오기
	$.ajax({
		type : 'POST',
		url : '../category/getList.do',
		data : {
			'cateNum' :  $("#cateNum").val(),
			'pg' : $("#pg").val(),
			'sortType':$('#sortType').val(),
			'p_midCate' : $('#p_midCate').val(),
			'p_name' : $('#p_name').val(),
			'search_option' : $('#search_option').val(),
			'pageSize' : $('#pageSize').val()
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
	
	
	//페이징처리해서 다른페이지 눌렀을경우 ?
	$('.card-body p').click(function(){
		
		var cateNum_param = $(this).parent().parent().prev().find('a').text();
		
		if(cateNum_param == ' Clothes '){
			$('#cateNum').val(3);
		}else if(cateNum_param == ' Tech++ '){
			$('#cateNum').val(2);
		}else if(cateNum_param == ' Food '){
			$('#cateNum').val(1);
		}
		$('#p_midCate').val($(this).text());	//페이지 이동시 필요해서 넣음
		
		//alert($('#midCate').val());
		
		var p_midCate = $(this).text();
		
		if(p_midCate == 'All'){
			$('#p_midCate').val('');
			p_midCate = '';
		}//학원에서 수정해야댐@@
		
		location.href='../category/categoryItemList.do?cateNum='+$('#cateNum').val()+'&p_midCate='+$('#p_midCate').val();
		
		
		
	});
	
	$('.selectRecordCount').click(function(pg){
		if($('#p_name').val() == ''){
			location.href = 'categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val()+'&cateNum='+$('#cateNum').val()+'&pageSize='+$('#pageSize').val()+'&p_midCate='+$('#p_midCate').val();
		}else{
			location.href = 'categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val()+'&p_name='+$('#p_name').val()+'&cateNum='+$('#cateNum').val()+'&pageSize='+$('#pageSize').val()+'&p_midCate='+$('#p_midCate').val();
		}
	});
})



//페이지 이동
function categoryList(pg, p_name){
	//alert('페이지이동  : ' + $("#sortType").val());
	if(p_name == undefined){
		location.href='categoryItemList.do?pg='+pg+'&sortType='+$('#sortType').val()+'&cateNum='+$('#cateNum').val();
	}else{
		location.href='categoryItemList.do?pg='+pg+'&sortType='+$('#sortType').val()+'&p_name='+p_name+'&cateNum='+$('#cateNum').val();
	}
}

//정렬 호출
function fn_sort(sortType) {			//sortType 제어 정렬누를시 pg 1로 설정		//정렬 하고난뒤 페이징눌렀을떄...
	//alert($('#p_name').val());
	$('#sortType').val(sortType);
	$('#pg').val(1);
	
	//alert($("#sortType").val());
	if($('#p_name').val() == ''){
		location.href='categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val()+'&cateNum='+$('#cateNum').val()+'&pageSize='+$('#pageSize').val()+'&p_midCate='+$('#p_midCate').val();
	}else {
		location.href='categoryItemList.do?pg='+1+'&sortType='+$('#sortType').val()+'&cateNum='+$('#cateNum').val()+'&p_name='+$('#p_name').val()+'&pageSize='+$('#pageSize').val()+'&p_midCate='+$('#p_midCate').val();
	}
	
}

function goPage(cateNum){
	location.href = "../category/categoryItemList.do?cateNum="+cateNum;
}
