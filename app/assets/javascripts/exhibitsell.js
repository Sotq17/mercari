$(function(){
  $(".exhibit__price__box__right__input").on('keyup', function(e){
  	e.preventDefault();
  	var input = $(".exhibit__price__box__right__input").val();
  	if( 300 <= input && input <= 9999999) {
      var num  = Math.floor(input / 10);
      var num2 = (input - num);
      $(".exhibit__price__com__right").text(num);
      $(".exhibit__price__com__right__2").text(num2);
    } else{
      $(".exhibit__price__com__right").text("-");
      $(".exhibit__price__com__right__2").text("-");
    }
   });
});
