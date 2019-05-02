$(function() {

  $('.mypage__main__box__notification li').click(function() {

    var index = $('.mypage__main__box__notification li').index(this);

    $('.mypage__main__box__notification li').removeClass('active');

    $(this).addClass('active');

    $('.tab-content ul').removeClass('show').eq(index).addClass('show');

  });
});


$(function() {

  // ①タブをクリックしたら発動
  $('.mypage-tabs li').click(function(e) {
    e.preventDefault();
    console.log(e)
    // ②クリックされたタブの順番を変数に格納
    var index = $('.mypage-tabs li').index(this);

    // ③クリック済みタブのデザインを設定したcssのクラスを一旦削除
    $('.mypage-tabs li').removeClass('active');

    // ④クリックされたタブにクリック済みデザインを適用する
    $(this).addClass('active');

    // ⑤コンテンツを一旦非表示にし、クリックされた順番のコンテンツのみを表示
    $('.tab-content_bottom ul').removeClass('show').eq(index).addClass('show');

  });
});