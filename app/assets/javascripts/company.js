$( document ).on('turbolinks:load', function() {
  $('.modal-trigger').on('click',function(){
    debugger
    $('#modal1').modal();
  })
})