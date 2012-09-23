module PhrasesHelper

	def search_result (title, desc, url, wiki = false, group_slug = '')
		if !wiki
			cont = "<div class='search-result'><h3>#{title} <figure class='#{group_slug}'></figure></h3><p class='search-description'>#{desc}...</div>"
		else
			cont = "<div class='search-result'><h3>#{title} <figure class='wikipedia-letter'></figure></h3><p class='search-description'>#{desc}...</div>"
		end
		return link_to (raw (cont)), url, :class => 'search-link'
	end
end
