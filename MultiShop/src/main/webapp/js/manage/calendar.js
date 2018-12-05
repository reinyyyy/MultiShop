/*$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

$(document).ready(function(){
	
	$('#datepicker1, #datepicker2').datepicker();
	
	function getDateStr(date){
		return (date.getFullYear()+'-'+(date.getMonth() + 1)+'-'+date.getDate());
	}
	
	function yesterday(){
		var date = new Date();
		
		var dayOfMonth = date.getDate();
		date.setDate(dayOfMonth - 1);
		return getDateStr(date);
	}
	
	function today(){
		var date = new Date();
		return getDateStr(date);
	}
	
	function week(){
		var date = new Date();
		
		var dayOfMonth = date.getDate();
		date.setDate(dayOfMonth - 7);
		
		return getDateStr(date);
	}
	
	function month(){
		var date = new Date();
		
		var monthOfYear = date.getMonth();
		date.setMonth(monthOfYear - 1);
		
		return getDateStr(date);
	}
	
	function trimester(){
		var date = new Date();
		
		var monthOfYear = date.getMonth();
		date.setMonth(monthOfYear - 3);
		
		return getDateStr(date);
	}
	
	function halfYear(){
		var date = new Date();
		
		var monthOfYear = date.getMonth();
		date.setMonth(monthOfYear - 6);
		
		return getDateStr(date);
	}
	
	$('#datepicker2').val(today());

	$('.yesterday').click(function(){
		$('#datepicker1').val(yesterday());
		$('#datepicker2').val(today());
	});
	
	$('.today').click(function(){
		$('#datepicker1').val(today());
		$('#datepicker2').val(today());
	});
	
	$('.week').click(function(){
		$('#datepicker1').val(week());
		$('#datepicker2').val(today());
	});
	
	$('.month').click(function(){
		$('#datepicker1').val(month());
		$('#datepicker2').val(today());
	});
	
	$('.trimester').click(function(){
		$('#datepicker1').val(trimester());
		$('#datepicker2').val(today());
	});
	
	$('.halfYear').click(function(){
		$('#datepicker1').val(halfYear());
		$('#datepicker2').val(today());
	});
	
});
*/