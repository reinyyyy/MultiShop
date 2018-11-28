$(document).ready(function(){
	
	$('li').on('click','a',function(){
		$('li a').removeClass('now');
		$(this).addClass('now');
	});
	
	if($('#search_keyword_type').val("phone")){
		
	}else if($('#search_keyword_type').val("sender")){
		
	}
	
	$('#btn_prd').on('click',function(){
		$.ajax ({
			type : 'GET',
			url : '',
			data : '',
			dataType : 'json',
			success : function(data){
				alert("success");
			}
		});
	});
	
	
});