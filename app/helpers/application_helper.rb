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
end
