class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :link
      t.string :slug

      t.timestamps
    end
    add_index :groups, :slug, unique: true
  end
end
