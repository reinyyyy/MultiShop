$(document).ready(function(){
	
	$('.w20per').on('click','a',function(){
		$('.w20per a').removeClass('now');
		$(this).addClass('now');
	});
	
	$('.chk-all-prd').click(function(){
		
		if($('.chk-all-prd').prop('checked')){
			$("input[type=checkbox]").prop("checked",true);
			
		}else {
			$("input[type=checkbox]").prop("checked",false);
		}
		
		$('.txt-count > em').text($("tbody td input:checkbox:checked").length);
	});

});