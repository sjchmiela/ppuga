class AddCanPublishToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :can_publish, :boolean, :default => 0
  end
end
