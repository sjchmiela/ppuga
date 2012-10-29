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
}/*


			$.getJSON("/phrases/akcje.json", function(json) {
				$("article header h1").text(json.title);
				$(".page.left > header a").html("<a href='"+json.group_link+"'>"+json.group+"</a>");
				$("article section").html($("<div />").html(json.description).text());
			});*/