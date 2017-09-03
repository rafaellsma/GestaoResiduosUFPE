$(document).on('turbolinks:load', function() {
  $('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
})

$(document).on('turbolinks:load', function() {
	console.log("teste");
})