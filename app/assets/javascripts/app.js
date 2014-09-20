// Smooth, in-page scrolling
function scrollTo() {
  var target = $(this.hash);
  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
  if (target.length) {
	return scrollAnimate(target);
  }
}
function scrollAnimate(target, offset, callback) {
  if (typeof offset === 'undefined') offset = -70;
  $('html,body').animate({
	scrollTop: target.offset().top + offset
  },{
	duration: 1000,
	easing: 'swing',
	complete: function() { if (typeof callback !== 'undefined') callback(); }
  });
  return false;  
}


$(document).ready(function() {

  // Set up auto-scrolling
  $('a.scroll-link').click(scrollTo);
  
  // MOBILE NAV MENU
  $(".inner-nav > a.menu-toggle").click( function(e) {
    e.preventDefault();
    if($(".inner-nav ul").hasClass("collapsed")) {
      
      $(".inner-nav ul").slideDown(1000);
      $(".inner-nav ul").removeClass("collapsed");
      $("a.menu-toggle").addClass("x-icon");
    
    }
    else {
      $(".inner-nav ul").slideUp(1000, function() {
        $(".inner-nav ul").addClass("collapsed");
        $("a.menu-toggle").removeClass("x-icon");
      });
    }  
  });
  
  // SECTION NAV MENU
  $('.section-nav-link').click(function() {
    $('.section-nav-link').removeClass('selected');
    $(this).addClass('selected');
  });
  
  // Add platform dropdown
  $('.platform-box').click(function() {
    if($(".platform ul").hasClass("collapsed")) {
      
      $(".platform ul").slideDown(1000);
      $(".platform ul").removeClass("collapsed");

    } else {
    
      $(".platform ul").slideUp(1000, function() {
        $(".platform ul").addClass("collapsed");
      });
      
    }
  });
  
});