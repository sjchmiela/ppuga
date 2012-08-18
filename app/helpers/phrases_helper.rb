module PhrasesHelper
	def shorten_description (p)
		return strip_tags(p.rendered_description).split('.')[0].to_s
	end
end
