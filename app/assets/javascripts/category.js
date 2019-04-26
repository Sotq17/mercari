$(function(){
  var search_list = $(".exhibit__select__defaults1");
  var category_list = $(".exhibit__select__defaults2");

  function  appendProduct(parent){
    var html = `<option value=${parent.id}>${parent.name}</option>`
    search_list.append(html);
  }

  function  appendCategory(parent){
    var html = `<option value=${parent.id}>${parent.name}</option>`
    category_list.append(html);
  }

  function  optionCategory(){
    var html = `<option value>---</option>`
    search_list.append(html);
  }

  function  optionCategory2(){
    var html = `<option value>---</option>`
     category_list.append(html);
  }

  $(".exhibit__select__defaults").change(function(e){
  	e.preventDefault();
  	var input = $("#item_category_ids").val();
    $('.exhibit__select__defaults1').fadeOut(5);
    $('.exhibit__select__defaults2').fadeOut(5);
    $('.exhibit__select__defaults1').empty();
    $('.exhibit__select__defaults2').empty();
    $.ajax({
      url: '/categories/category_search',
      type: 'GET',
      dataType: 'JSON',
      data: {id: input},
    })
    .done(function(parent) {
      $('.exhibit__select__defaults1').add();
      optionCategory();
      $('.exhibit__select__defaults1').fadeIn(5);
      parent.forEach(function(parent) {
      appendProduct(parent);
      });
    });
  });
  $(".exhibit__select__defaults1").change(function(e){
    e.preventDefault();
    var input = $(".exhibit__select__defaults1").val();
    $('.exhibit__select__defaults2').fadeOut(5);
    $('.exhibit__select__defaults2').empty();
    $.ajax({
      url: '/categories/grandchild_search',
      type: 'GET',
      dataType: 'JSON',
      data: {id: input},
    })
    .done(function(child) {
      $('.exhibit__select__defaults2').add();
      optionCategory2();
      $('.exhibit__select__defaults2').fadeIn(5);
      child.forEach(function(child) {
      appendCategory(child);
      });
    });
  });
});
