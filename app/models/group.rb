class Group < ActiveRecord::Base
  attr_accessible :link, :slug, :title
  has_many :phrases
  extend FriendlyId
  friendly_id :title, use: :slugged
end
