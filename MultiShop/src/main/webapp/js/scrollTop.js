
$( document ).ready(function() {
   $('.top_bg_area').css("position","initial");
   $('.hidden_btn').css("top","60px");
});
var didScroll; 
var lastScrollTop = 0; 
var delta = 5; 
var docHeight = $(document).height()
var navbarHeight = $('.top_nav').outerHeight();

$(window).scroll(function(event){ didScroll = true; });
   setInterval(function() { 
      if (didScroll) { 
         hasScrolled(); 
         didScroll = false; 
      } 
   }, 250);
function hasScrolled() { 
   var st = $(this).scrollTop(); 
   // Make sure they scroll more than delta 
   if(Math.abs(lastScrollTop - st) <= delta) 
      return; 
   // If they scrolled down and are past the navbar, add class .nav-up. 
   // This is necessary so you never see what is "behind" the navbar. 
   
   if (st > lastScrollTop && st > navbarHeight){ // Scroll Down 
      $('.hidden_btn').css("top","12px");
      $('.top_nav').addClass('top_nav_hover'); 
      $('.top_mobile_nav').addClass('top_mobile_nav_hover');
      $('.top_bg_area').css("position","initial").css("padding","10px 0");
   }else if($(this).scrollTop() == 0){
      $('.top_bg_area').css("position","initial").css("padding","10px 0");
      $('.hidden_btn').css("top","60px");
   }
   else { // Scroll Up 
      if(st + $(window).height() < $(document).height()) { 
         $('.top_nav').removeClass('top_nav_hover');
         $('.top_mobile_nav').removeClass('top_mobile_nav_hover');
      } 
   }
   lastScrollTop = st; 
}


