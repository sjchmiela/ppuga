class AddFullTextIndexToPhrasesAndRevision < ActiveRecord::Migration
  def change
  	execute "ALTER TABLE phrases ADD FULLTEXT (title, description)"
  	execute "ALTER TABLE revisions ADD FULLTEXT (title, description)"
  end
end
