$(document).ready(function() {
 
	var floatPosition = parseInt($("#floatMenu").css('top'));//music bar 

	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
		 
	}).scroll();
});

$(function(){
	 $(window).scroll(function(){ 
		 var scrollTop = $(window).scrollTop();
		if( scrollTop > 100 ){  // 스크롤을 100 이상 했을 때
		      $(".wishList").css("position","fixed");
		      $(".wishList").css("display","block");
		    }else{
		      $(".wishList").css("position","absolute");
		      $(".wishList").css("display","none");
		    }
	 	});
	});


