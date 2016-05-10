// Enable Title page to change when it's not active
var pageTitle = document.title;
document.addEventListener("visibilitychange", function(event){
    if ( document.hidden )
        document.title = "Miss You :(";
    else
        document.title = pageTitle;
 });

//Tooltip
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});