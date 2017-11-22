

$(document).on('turbolinks:load', function() {
  $("#stock_dropdown").change(function (){
    var text = this.value;
    if (text === "Outros") {
      $("#stock_location_div").css("display", "block");
      text = "";
    }else{
      $("#stock_location_div").css("display", "none");
    }
    $("#stock_location_input").val(text);
  });
});

$(function() {
  return $("#button-downloadable").on("ajax:success", function(e, data, status, xhr) {
    console.log(data);
  });
});