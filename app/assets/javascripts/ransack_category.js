$(function(){
  $(".ransack__container__contents__form__select__child").click(function(){
  $('.ransack__container__contents__form__select__child').prop('name', 'q[categories_id_eq]');
  });
  $(".ransack__container__contents__form__select__grandchild").click(function(){
  $('.ransack__container__contents__form__select__grandchild').prop('name', 'q[categories_id_eq]');
  });
});
// 検索ボタン
$(function(){
  $(".ransack__container__contents__btns__done").mouseover(function(e){
  e.preventDefault();
  var input = $(".ransack__container__contents__form__select__child").val();
  var inputs = $(".ransack__container__contents__form__select__grandchild").val();
    if (input == ""){
      $(".ransack__container__contents__form__select__child").removeAttr("name");
    }
    if (inputs == ""){
      $(".ransack__container__contents__form__select__grandchild").removeAttr("name");
    }
  });
});

// 販売中と販売済両方選択された時
$(function(){
  $(".ransack__container__contents__btns__done").click(function(e){
  var notyet = $("#q_buyer_id_null").attr("checked");
  var soldout = $("#q_buyer_id_not_null").attr("checked");
  console.log(notyet),
  console.log(soldout);
    if (notyet == "checked" && soldout == "checked"){
      $("#q_buyer_id_null").removeAttr("checked");
      $("#q_buyer_id_not_null").removeAttr("checked");
    }
  });
});
// リセットボタン

$(function () {
  $(".ransack__container__contents__btns__reset").on("click", function () {
      clearForm(this.form);
  });

  function clearForm (form) {
      $(form)
          .find("input, select, textarea")
          .not(":button, :submit, :reset, :hidden")
          .val("")
          .prop("checked", false)
          .prop("selected", false)
      ;
      $(form).find(":radio").filter("[data-default]").prop("checked", true);
  }
});


$(function(){
  var search_list = $(".ransack__container__contents__form__select__child");
  var category_list = $(".ransack__container__contents__form__select__grandchild");

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

  $(".ransack__container__contents__form__select__parent").change(function(e){
    e.preventDefault();
   var input = $("#q_categories_id_eq").val();
    $('.ransack__container__contents__form__select__child').fadeOut(5);
    $('.ransack__container__contents__form__select__grandchild').fadeOut(5);
    $('.ransack__container__contents__form__select__child').empty();
    $('.ransack__container__contents__form__select__grandchild').empty();
    $.ajax({
      url: '/categories/category_search',
      type: 'GET',
      dataType: 'JSON',
      data: {id: input},
    })
    .done(function(parent) {
      $('.ransack__container__contents__form__select__child').add();
      optionCategory();
      $('.ransack__container__contents__form__select__child').fadeIn(5);
      parent.forEach(function(parent) {
      appendProduct(parent);
      });
    });
  });
  $(".ransack__container__contents__form__select__child").change(function(e){
    e.preventDefault();
    var input = $(".ransack__container__contents__form__select__child").val();
    $('.ransack__container__contents__form__select__grandchild').fadeOut(5);
    $('.ransack__container__contents__form__select__grandchild').empty();
    $.ajax({
      url: '/categories/grandchild_search',
      type: 'GET',
      dataType: 'JSON',
      data: {id: input},
    })
    .done(function(child) {
      $('.ransack__container__contents__form__select__grandchild').add();
      optionCategory2();
      $('.ransack__container__contents__form__select__grandchild').fadeIn(5);
      child.forEach(function(child) {
      appendCategory(child);
      });
    });
  });
});
