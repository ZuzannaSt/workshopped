// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $(".thumbnail" ).on("mouseover", function(){
    $( this ).addClass("faa-parent animated-hover");
    $( this ).find( ".fa-rocket" ).addClass("faa-float");
  });
});
