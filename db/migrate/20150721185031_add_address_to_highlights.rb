class AddAddressToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :address, :string
  end
end
