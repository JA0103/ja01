  // html dom 이 다 로딩된 후 실행
    $(document).ready(function(){
        // a 클릭했을때
        $(".admin_menu>a ").mouseover(function(){
         $(".hide_menu").slideDown();
        });
      $(".div_menu").mouseleave(function(){
         $(".hide_menu").slideUp();
      });
});