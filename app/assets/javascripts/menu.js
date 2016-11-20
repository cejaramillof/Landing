$(document).ready(function(){  
  $(window).scroll(function(){
    if( $(this).scrollTop() > 0 ){
      $('#logo').addClass('logo2');
      $('nav').addClass('header2');
      $(".menul").addClass('menul2');
      $(".icon-bar").addClass('icon-bar2');
    } else {
      $('nav').removeClass('header2');
      $('#logo').removeClass('logo2');
      $(".menul").removeClass('menul2');
      $(".icon-bar").removeClass('icon-bar2');
    }
  }); 
});

function None(){
    if($("#menu-language").hasClass('es')){
      $('#flag-es').addClass('display-none');
    } else if ($("#menu-language").hasClass('en')){
      $('#flag-en').addClass('display-none');
    } else if ($("#menu-language").hasClass('pt')){
      $('#flag-pt').addClass('display-none');
    }
}
  


