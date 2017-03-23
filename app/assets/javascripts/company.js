$( document ).on('turbolinks:load', function() {
  $('.modal-trigger').on('click',function(){
    $('#modal1').modal();
  })
})