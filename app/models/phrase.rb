class Phrase < ActiveRecord::Base
  has_many :revisions
  attr_accessible :title, :description, :published
  validates_uniqueness_of :title
  validates_presence_of :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  def rendered_description
    return (Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:autolink => true, :space_after_headers => true).render(self.description).html_safe).gsub(/\#\(([A-Za-z]*?), *?([A-Za-z]*?)\)/, "<a href='/phrases/\\1'>\\2</a>") # Thanks, Dziewon!
  end
  def from_revision!(revision)
  	return (self.title = revision.title and self.description = revision.description)
  end
end
