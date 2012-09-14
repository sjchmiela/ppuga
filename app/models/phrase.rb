class Phrase < ActiveRecord::Base
  has_many :revisions
  attr_accessible :title, :description, :published
  validates_uniqueness_of :title
  validates_presence_of :title
  extend FriendlyId
  friendly_id :title, use: :slugged
  def from_revision!(revision)
  	return (self.title = revision.title and self.description = revision.description)
  end
end
