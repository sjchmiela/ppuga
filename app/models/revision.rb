class Revision < ActiveRecord::Base
  attr_accessible :author_id, :description, :phrase_id, :title

  def self.from_phrase (phrase)
    rev = self.new
    rev.description = phrase.description
    rev.title = phrase.title
    rev.phrase_id = phrase.id
    return rev
  end
end
