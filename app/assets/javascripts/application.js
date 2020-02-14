// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery.min

//= require rails-ujs
//= require bootstrap-sprockets
//= require bootstrap.min
//= require activestorage
//= require_tree .



//FOR PREVIEW

      $("#inputGroupFile01").change(function(event) {
        RecurFadeIn();
        readURL(this);
      });
      $("#inputGroupFile01").on('click',function(event){
        RecurFadeIn();
      });
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          var filename = $("#inputGroupFile01").val();
          filename = filename.substring(filename.lastIndexOf('\\')+1);
          reader.onload = function(e) {
            $('#blah').attr('src', e.target.result);
            $('#blah').hide();
            $('#blah').fadeIn(500);
            $('.custom-file-label').text(filename);
          }
          reader.readAsDataURL(input.files[0]);
        }
        $(".alert").removeClass("loading").hide();
      }




//FOR LIKES

      $(function(){
        // jquery loaded
        $(".post-like").on("click", function(){
          var post_id = $(this).data("id");
          $.ajax({
            url: "/post/like/"+post_id,
            method: "GET"
          }).done(function(response){
            console.log(response);
          })
        })
      });


