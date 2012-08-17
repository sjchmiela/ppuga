class Phrase < ActiveRecord::Base
  attr_accessible :title, :description
  validates_uniqueness_of :title
  validates_presence_of :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  def short_description
  	return self.description.split('.')[0].to_s
  end
  searchable do 
  	text :title, :boost => 5
  	text :description
  end
end
