// $( document ).ready(function() {
$( document ).on('turbolinks:load', function() {
  autoCompleteListener();
});

var autoCompleteListener = function(){
  // if company data exits, run the code
  if ( $('.company-data').length > 0 ){
    // Grab data from view
    var companies = JSON.parse( $('.company-data').attr('data') )
    // Event listener for form on homepage header
    $('input.autocomplete').autocomplete({
      data: companies,
      limit: 20
    }).keyup( function(event) {
      if(event.which === 13) { // submit form on enter
        console.log($('input.autocomplete').val())
        $(this).parent().submit();
      }
    })
    // Create event listener on click for autocomplete items
    $('.autocomplete-content.dropdown-content').on("click", "li", function(event) {
      // submit form on click
      console.log($('input.autocomplete').val())
      $('form:has(".autocomplete")').submit();
    });

  } // end of if statement
};
