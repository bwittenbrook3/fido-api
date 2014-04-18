// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor/modernizr
//= require swagger-ui
//= require foundation
//= require underscore
//= require gmaps/google
//= require sync
//= require twitter/typeahead
//= require_tree .

$( document ).ready(function() {
	$(".side-nav").css("height", ($(window).height()- 85) + "px");
});

$(function(){ 
	$(document).foundation(); 
	$(document).on('click', '[data-reveal-remote]', function(){
		var $src = $(this);
		$($src.data('reveal-remote')).foundation('reveal', 'open', $src.attr('href'));
		return false;
	});

	$(window).scroll(function() {
		$(".side-nav").css("height", ($(window).height()- 85) + "px");
	  $(document).foundation('equalizer', 'reflow');
	});

});


