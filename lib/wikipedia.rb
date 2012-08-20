module Wikipedia
	require 'net/http'
	require 'rexml/document'
	def Wikipedia.search (search_query, render = 0)
		url = "http://pl.wikipedia.org/w/api.php?action=opensearch&search=#{search_query}&sections=0&limit=10&format=xml"
		xml_data = Net::HTTP.get_response(URI.parse(url)).body
		doc = REXML::Document.new(xml_data)
		titles = []
		descriptions = []
		doc.elements.each('SearchSuggestion/Section/Item/Text') do |el|
			titles << el.text
		end
		doc.elements.each('SearchSuggestion/Section/Item/Description') do |el|
			descriptions << el.text
		end
		result = {}
		titles.each_with_index do |title, i|
			result[title] = descriptions[i]
		end
		if render === true
			rendered = ""
			result.each do |title, desc|
				rendered += ActionController::Base.helpers.link_to (ActionController::Base.helpers.raw("<div class='search-result'><h3>#{title}</h3><p class='search-description'>#{desc}...</div>")), title, :class => 'search-link'
			end
			return rendered
		else
			return result
		end
	end
	def Wikipedia.show(title)
		url = "http://pl.wikipedia.org/w/api.php?action=mobileview&page=#{title}&sections=0&format=xml"
		xml_data = Net::HTTP.get_response(URI.parse(URI.encode(url))).body
		doc = REXML::Document.new(xml_data)
		# title = doc.elements["api/mobileview"].attributes["normalizedtitle"]
		title.gsub!('_', ' ')
		content = doc.elements["api/mobileview/sections/section"].text
		return [title, content]
	end
end
