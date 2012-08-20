module PhrasesHelper
	def shorten_description (p)
		return strip_tags(p.rendered_description).split('.')[0].to_s
	end

	def search_result (title, desc, url, wiki = false)
		if !wiki
			cont = "<div class='search-result'><h3>#{title}</h3><p class='search-description'>#{desc}...</div>"
		else
			cont = "<div class='search-result'><h3>#{title} <img src='/assets/wikipedia.ico' width='16' height='16' /></h3><p class='search-description'>#{desc}...</div>"
		end
		return link_to (raw (cont)), url, :class => 'search-link'
	end
end
