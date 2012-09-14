module ApplicationHelper
  def resource_name
    :author
  end

  def resource
    @resource ||= Author.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:author]
  end

  def rendered_description (element)
  	return (Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:autolink => true, :space_after_headers => true).render(element.description.gsub(/\#\((.*), ?(.*)\)/, "<a href='/phrases/\\1'>\\2</a>")).html_safe) # Thanks, Dziewon!
  end
  def shorten_description (p)
		return strip_tags(rendered_description(p)).split('.')[0].to_s
  end
end
