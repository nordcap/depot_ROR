/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/
/*
$(document).on "ready page:change", ->
  $('.store .entry > img').click ->
    $(this).parent().find(':submit').click()
*/


$(document).on('ready', function(){
    $('.store .entry>img').on('click', function(){
        $(this).parent().find(':submit').click();
    })
});

