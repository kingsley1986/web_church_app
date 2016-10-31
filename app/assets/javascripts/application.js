// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .


$(function(){ $(document).foundation(); });


var handleFirstItemInTier = function() {
  //Start second tier navigation behaviour - This section handles;
  //- Dynamic addition of classes to display second tier under Latest
  //- Lazy loading of images for the first "News" tab as well as other tabs
  //- Insertion of placeholder which allows for diagonal scrolling
  // We only require the below logic if on desktop
  var navigationParent = $(".main-navigation");

  var firstIteminMainNav = $(navigationParent).children().first();

  //Loop through LI's, store in array

  var subNewsul = $(".sub--news--ul > li").each(function() {});

  //Access nodes based on position in array

  var subNewsFirstItem = subNewsul[0];
  var subNewsItem2 = subNewsul[1];
  var subNewsItem3 = subNewsul[2];
  var subNewsItem4 = subNewsul[3];

  //Combine li's in one variable so we can reference common functionality later

  var combineLis = $([subNewsItem2, subNewsItem3, subNewsItem4]);

  $(subNewsFirstItem).addClass("FirstInTier");

  $(".FirstInTier").find(".mega-menu-news").addClass("FirstMenunInRow");

  $(firstIteminMainNav).hover(

    function() {

      $(subNewsFirstItem).addClass("FirstInTierActive");

      $(this).toggleClass("FirstActiveItem");

      var elementToLoad = $(".FirstInTier").find("img");

      $(elementToLoad).each(function() {

        var currentImage = $(this).data("original");

        $(this).attr("src", currentImage).fadeIn();

      });

      $(this).toggleClass("toggle-placeholder");

    }

  );

  //Detect hover change on first item in navigationParent

  $(firstIteminMainNav).hover(function() {

    //If the "toggle-placeholder" class is present on the element(meaning the first element is in a hovered state)
    //Then Run following code

    if ($(this).hasClass("toggle-placeholder")) {

      var self = $(this);

      //First, check to see if item.trigger already exists. If it does, do not instert again

      if ($(".item-trigger").length >= 1) {

        //This prevents the item being injected multiple times in the dom

        return false;

      } else {

        //If the above condition returns false, then insert a span with a class of item-trigger
        //You can find the styles for item-trigger in headerMain.less

        $(self).append("<span class='item-trigger'></span>");

      }

    } else {

      //If toggle-placeholder is not there, then remove from DOM

      $(".item-trigger").remove();

    }

  });

  //Load the rest of the images for each tab on hover request

  $(combineLis).hover(function() {

   $(subNewsFirstItem).removeClass("FirstInTierActive");

    var elementToLzyLoad = $(this).find("img");

    $(elementToLzyLoad).each(function() {
      var currentImage = $(this).data("original");
      $(this).attr("src", currentImage).fadeIn("slow");
    });
  });

};
var fixDivTotop = function(){
  $(window).scroll(function(){
    var $cache = $('.infoBar');
    if ($(window).scrollTop() > 100)
      $cache.addClass("fixtoTop");
    else
     $cache.removeClass("fixtoTop");
  })
}
//Execute Functions
handleFirstItemInTier();
fixDivTotop();


var handleFavourite = function(){

//If, when we load class is set then remove the addClass
if ($(".icon-star-empty").hasClass("is-favd")) {
    $(".icon-star-empty").removeClass("js-favstar");
  $(".is-favd").click(function(){
      $(".icon-star-empty").removeClass("is-favd").addClass("js-favstar")
    })
 } else {
   //Execute favourite logic here
    alert("Favourite has been added!");
 }

   $(document).on("click", '.icon-star-empty', function () {

    $(".js-favstar").click(function(){
      alert("Add this to favourites!")

      })

   })

}

handleFavourite()
