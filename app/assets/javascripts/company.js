$( document ).on('turbolinks:load', function() {
  addCommentListener();
  // console.log("Comment listener added");
})

var addCommentListener = function(){
  $('.modal-trigger').on('click',function(){
    var modalNode = '#' + $(this).attr('data-target');
    console.log($(this).attr('data-target'));
    $(modalNode).modal();
  });
};
