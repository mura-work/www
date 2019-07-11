// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .


$(function() {
	$('[id=person_id]').change(funcion() {
		var val = $('id=person_id').val();
		console.log(val);

		var txt = $('[id=person_id] option:selected').text();
		console.log(txt);
	});
});


$(function() {
	$('select[id=person_id').change(function() {
		val this_value = $('this').val();

		if (this_value == "person_id")
	})
})

