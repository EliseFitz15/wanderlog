class AddTimestampToAlbums < ActiveRecord::Migration
  def change
    add_column(:albums, :created_at, :datetime)
    add_column(:albums, :updated_at, :datetime)
  end
end
