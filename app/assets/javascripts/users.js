$(document).on('turbolinks:load', function() {
  $("#centers_select").change(function(){
    $.ajax('update_departments', {
      type: 'GET',
      dataType: 'script',
      data: {
        center_id: $("#centers_select option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        return console.log("OK!");
      }
    });
  });
  $("#departments_select").change(function(){
    $.ajax('update_laboratories', {
      type: 'GET',
      dataType: 'script',
      data: {
        department_id: $("#departments_select option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        return console.log("OK!");
      }
    });
  });
});
