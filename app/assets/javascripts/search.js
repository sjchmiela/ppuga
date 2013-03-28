function search() {
	var keyword = $("#search_field").val();
	$("header.search").text("Wyszukiwanie: „"+keyword+"”");
	_gaq.push(['_trackEvent', 'Phrases', 'Search', keyword]);
	$.getJSON('/phrases/search.json?utf8=✓&search_field='+keyword, function(data)	{
		$(".search-result").remove();
		$(".no-results").remove();
		var inserted = false;
		$.each(data.results, function(i,item)
		{
			inserted = true;
			$("#search-results").append('<a href="/phrases/'+item.slug+'" class="search-result element" onClick="javascript:visit(event, this.href)">'+item.title+' <i class="'+item.group_slug+'">'+item.group_name+'</i></a>')
		});
		$.each(data.wikipedia, function(i,item)
		{
			inserted = true;
			$('#search-results').append('<a href="'+item.href+'" class="search-result element" onClick="javascript:visit(event, this.href)">'+item.title+' <i class="wikipedia">Wikipedia</i></a>')
		});
		if(inserted == false)
		{
			$('#search-results').append('<div class="element no-results">Brak wyników.</div>')
		}
	});
}

function visit(event, url) {
	event.preventDefault();
	$.getJSON(url+'.json', (function(data)	{
		document.title = data.title+" - PPuga - przedsiębiorczy słownik";
		history.pushState(data.title, document.title, url);
		$("#group").html('<a href="'+data.group_link+'">'+data.group+'</a>');
		$("article.scroll").html('<header><h1>'+data.title+'</h1></header><section>'+data.description+'</section>');
		_gaq.push(['_trackEvent', 'Phrases', 'Open', data.title]);

	}));
}

$().ready(function () {
	$("form").submit(function(event) { event.preventDefault();});
});