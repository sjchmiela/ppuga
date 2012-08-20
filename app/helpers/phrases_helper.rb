module PhrasesHelper
	def shorten_description (p)
		return strip_tags(p.rendered_description).split('.')[0].to_s
	end

	def search_result (title, desc, url)
		return link_to (raw ("<div class='search-result'><h3>#{title}</h3><p class='search-description'>#{desc}...</div>")), url, :class => 'search-link'
	end
end
