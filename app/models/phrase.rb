class Phrase < ActiveRecord::Base
  attr_accessible :title, :description
  extend FriendlyId
  friendly_id :title, use: :slugged
end
