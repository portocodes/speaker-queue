// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $( "#datepicker" ).datepicker({
      dateFormat: "dd-MM-yy"
    });
});
