module RevisionsHelper
	def shorten_description (r)
		return strip_tags(r.rendered_description).split('.')[0].to_s
	end
end
