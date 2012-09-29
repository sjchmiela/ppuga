class AddFullTextIndexToSlugInPhrases < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE phrases ADD FULLTEXT (slug)"
  end
end
