class Revision < ActiveRecord::Base
  attr_accessible :author_id, :description, :phrase_id, :title
end
