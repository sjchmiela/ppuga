// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

if (!window.Kolich) {
  Kolich = {};
}

Kolich.Mobile = {};
Kolich.Mobile.init = function(){
  window.scrollTo(0,1);
}

if(window.addEventListener){
  window.addEventListener('load', Kolich.Mobile.init, false);
}else if(window.attachEvent){
  window.attachEvent('onload', Kolich.Mobile.init);
}

function search() {
	var query = $("aside input[type=search]").val();
	if(query == '') { $(".search-results").html(''); return;}
	console.log("/phrases/search?naked=1&search="+query);
	$.ajax({ url: "/phrases/search?naked=1&search="+query, cache: false }).done(
		function( result ) {
			$(".search-results").html(result);
			$("aside .search-result").css("border-left-color", "#0388A6");
			setTimeout(function(){$("aside .search-result").css("border-left-color", "#eee");}, 400);
	});
}

$(function() {
	$('input, textarea').placeholder();
	$("aside form").on("submit", function() { search(); return false; });
	$(".toggle").on("click", function(){
		if($(".toolbar").css("top") != '0px')
		{
			//$(".toolbar").animate({"height": "14.09em"}, 1000);
			$(".toolbar").animate({"top": "0"}, 1000);
			$(".toggle").animate({"top": "15.09em"}, 1000);
			$("body").animate({"backgroundPositionY": "14.09em"}, 1000);
			$("body > header").animate({"marginTop": "14.09em"}, 1000);
		}
		else
		{
			//$(".toolbar").animate({"height": "0"}, 1000);
			$(".toggle").animate({"top": "1em"}, 1000);
			$(".toolbar").animate({"top": "-14.09em"}, 1000);
			$("body").animate({"backgroundPositionY": "0"}, 1000);
			$("body > header").animate({"marginTop": "0"}, 1000);
		}
	});
});
