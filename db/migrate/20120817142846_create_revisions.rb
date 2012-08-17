class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :phrase_id
      t.string :title
      t.text :description
      t.integer :author_id

      t.timestamps
    end
  end
end
