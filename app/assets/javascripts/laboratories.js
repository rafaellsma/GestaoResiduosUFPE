var ready;
ready = function() {
	$('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
