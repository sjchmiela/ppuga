class Phrase < ActiveRecord::Base
  has_many :revisions
  attr_accessible :title, :description, :published
  validates_uniqueness_of :title
  validates_presence_of :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  def rendered_description
    return Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:autolink => true, :space_after_headers => true).render(self.description).html_safe
  end
  searchable do 
    boolean :published
  	text :title, :boost => 5
  	text :description
  end
end
