$(document).ready(function(){
  $("#myTable").tablesorter();

  $(".image-zoom").click(function(){
    $(".image-zoom").toggleClass("hidden")
  })
  $(".product-show-image").click(function(){
    $(".image-zoom").toggleClass("hidden")
  })
});