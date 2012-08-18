class AddPublishedToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :published, :boolean
  end
end
