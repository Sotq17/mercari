$(function(){
	$('.exhibit__upload__dropbox__items__photo').each(function(i){
		$(this).attr('id','number' + (i+1));
	});

	$('#item_photos_attributes_0_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number1").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number1").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});
	$('#item_photos_attributes_1_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number2").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number2").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_2_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number3").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number3").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_3_image').change(function(e){
      console.log(e)
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number4").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number4").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_4_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number5").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number5").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_5_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number6").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number6").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_6_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number7").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number7").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_7_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number8").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number8").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_8_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number9").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number9").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});


	$('#item_photos_attributes_9_image').change(function(e){
      e.preventDefault();
      var file = e.target.files[0];
      var reader = new FileReader();
      $("#number10").fadeIn(1)

      reader.onload = (function(file){
      return function(e){
        $("#number10").attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
	});
});

