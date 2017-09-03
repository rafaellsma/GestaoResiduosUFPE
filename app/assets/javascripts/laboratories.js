var ready;
ready = function() {
	$('.chosen-select').chosen({
	  allow_single_deselect: true,
	  no_results_text: 'Nenhum resultado encontrado',
	  width: '100%'
	});
};

var ready2;
ready2 = function() {
	console.log("ready2")
};
var ready3;
ready2 = function() {
	console.log("ready3")
};
var ready4;
ready2 = function() {
	console.log("ready4")
};

$(document).ready(ready);
$(document).on('page:load', ready);

$(document).ready(ready3);
$(document).on('page:load', ready3);
$(document).on('turbolinks:load', ready4);