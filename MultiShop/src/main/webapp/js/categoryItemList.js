$(document).ready(function(){
	/*$(document).on('mouseenter', '.card-img-top',function() {
		$('.util').attr('display', 'block');
		alert($('.util').attr('display'));
	});
	$(document).on('mouseleave', '.card-img-top',function() {
		$('.util').attr('display', 'none');
	});*/
})


//sortNo 1 : 인기순
//sortNo 2 : 신상품순
//sortNo 3 : 낮은가격순g
//sortNo 4 : 높은가격순

//sortList 1 : 10개씩
//sortList 2 : 20개씩

//categoriItemList.jsp 에서 사용

function fn_sort(sortNo) {
	alert(sortNo);
}

function goPage(cateNum){
	location.href = "../category/categoryItemList.do?cateNum="+cateNum;
}
/*
function postJSON(url, data){
	var ajax = $.ajax({
		type : 'POST',
		url : url,
		data : data,
		dataType : 'json',
		success : function(data){
			alert(JSON.stringify(data));
			return data;
		}
	});
}*/