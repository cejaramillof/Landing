$(document).ready(function(){  
  $(window).scroll(function(){
    if( $(this).scrollTop() > 0 ){
      $('#logo').addClass('logo2');
      $('nav').addClass('header2');
      $(".menul").addClass('menul2');
      $(".btn-cel").addClass('hidden-pc');
      $(".btn-cel").addClass('display-block');    
      $(".text-lan").addClass('text-lan2');
      $(".glyph-lan").addClass('glyph-lan2');
    } else {
      $('nav').removeClass('header2');
      $('#logo').removeClass('logo2');
      $(".menul").removeClass('menul2');
      $(".btn-cel").removeClass('display-block');
      $(".btn-cel").removeClass('hidden-pc');
      $(".text-lan").removeClass('text-lan2');
      $(".glyph-lan").removeClass('glyph-lan2');      
    }
  }); 
});

function None(){
    if($("#menu-language").hasClass('es')){
      $('#flag-es').addClass('display-none');
    } else if ($("#menu-language").hasClass('en')){
      $('#flag-en').addClass('display-none');
    } else if ($("#menu-language").hasClass('br')){
      $('#flag-br').addClass('display-none');
    }
}

// Hide Header on on scroll down
var didScroll;
var lastScrollTop = 0;
var delta = 5;
var navbarHeight = $('header').outerHeight();

$(window).scroll(function(event){
    didScroll = true;
});

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
    if (st > lastScrollTop && st > navbarHeight){
        // Scroll Down
        $('nav').removeClass('nav-down').addClass('nav-up');
    } else {
        // Scroll Up
        if(st + $(window).height() < $(document).height()) {
            $('nav').removeClass('nav-up').addClass('nav-down');
        }
    }
    
    lastScrollTop = st;
}