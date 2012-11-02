function search() {
	var keyword = $("#search").val();
	$("header.search").text("Wyszukiwanie: „"+keyword+"”");
	$.getJSON('/phrases/search.json?utf8=✓&search='+keyword, function(data)
	{
		$(".search-result").remove();
		$.each(data.results, function(i,item)
		{
			$("#search-results").append('<a href="/phrases/'+item.slug+'" class="search-result element">'+item.title+'</a>')
		});
		$.each(data.wikipedia, function(i,item)
		{
			$('#search-results').append('<a href="'+item.href+'" class="search-result element">'+item.title+'</a>')
		});
	});
}

$().ready(function () {
	$("form").submit(function(event) { event.preventDefault(); search();})
});