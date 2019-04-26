$(function(){
  $(".exhibit__select__defaults1").click(function(e){
  var name = $('.exhibit__select__defaults1').prop('name', 'item[category_ids]');
  console.log(name)
  });
  $(".exhibit__select__defaults2").click(function(e){
  $('.exhibit__select__defaults2').prop('name', 'item[category_ids]');
  });
});
