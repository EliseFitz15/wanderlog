class RemoveUseridFromHighlights < ActiveRecord::Migration
  def change
    remove_column :highlights, :user_id, :integer, null: false
  end
end
