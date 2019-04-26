$(function(){
  $(".exhibit__select__default").change(function(e){
  e.preventDefault();
  var input = $(".exhibit__select__defaults1").val();
  var inputs = $(".exhibit__select__defaults2").val();
    if (input == ""){
      $(".exhibit__select__defaults1").removeAttr("name");
    }
    if (inputs == ""){
      $(".exhibit__select__defaults2").removeAttr("name");
    }
  });
});
