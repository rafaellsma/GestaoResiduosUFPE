$(document).on('turbolinks:load', function() {
  $('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
})

$(document).on('ready', function() {
  $('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
})

$(document).on('page:change', function() {
  $('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
})