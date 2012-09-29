class AddFullTextIndexToSlugInPhrases < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE phrases ADD FULLTEXT (slug, title, description);"
  end
end
