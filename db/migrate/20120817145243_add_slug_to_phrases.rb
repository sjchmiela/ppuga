class AddSlugToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :slug, :string
    add_index :phrases, :slug, unique: true
  end
end
