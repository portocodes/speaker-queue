// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('.image_upload_preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

$("#inputFile").change(function() {
    readURL(this);
});