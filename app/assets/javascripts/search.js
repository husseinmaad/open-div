// $( document ).ready(function() {
$( document ).on('turbolinks:load', function() {
  autoCompleteListener();
});

var autoCompleteListener = function(){
  if ( $('.company-data').length > 0 ){
    var companies = JSON.parse( $('.company-data').attr('data') )

    // Event listener for form on homepage header
    $('.home-search-form input.autocomplete').autocomplete({
      data: companies,
      limit: 20,
    });

    // Event listener for search form on search results page
    $('.search-results-page-form input.autocomplete').autocomplete({
      data: companies,
      limit: 20,
    });
  } // end of if statement
};


// .keyup(function (e) {
//       if(e.which === 13) { // on enter
//           console.log($('input.autocomplete').val())
//          $.ajax({
//           type: "GET",
//           url: "/search",
//           success: (console.log("success"))
//          })
//          .done(function(r){
//           console.log(r);
//          })
//       }
//   });
// end of event listener

// .keyup(function (e) {
//       event.preventDefault();
//       var $query = $(this);
//       if(e.which === 13) { // on enter
//           console.log($query.val())
//          $.ajax({
//           type: "GET",
//           url: "/search",
//           success: (console.log("success"))
//         }).done(function(r){
//           $('.search-results').append(r);
//           console.log(r);
//          })
//       }
//   })
// end of event listener
