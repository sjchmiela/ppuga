class Revision < ActiveRecord::Base
	belongs_to :phrase
	belongs_to :author
  attr_accessible :author_id, :description, :phrase_id, :title
  def rendered_description
    return Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:autolink => true, :space_after_headers => true).render(self.description).html_safe
  end
  def self.from_phrase (phrase)
    rev = self.new
    rev.description = phrase.description
    rev.title = phrase.title
    rev.phrase_id = phrase.id
    return rev
  end
end
