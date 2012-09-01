$(document).ready(function() {
	$('#card_test_production_lot_no.string').typeahead({
	    source: function (query, process) {
	        return $.get('/typeahead/lot', { query: query }, function (data) {
	            return process(data);
	        });
	    }
	});
});