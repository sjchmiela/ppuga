class AddGroupIdToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :group_id, :integer
  end
end
