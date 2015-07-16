class AddPhotosToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :photos, :json
  end
end
