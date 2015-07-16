class RemovePhotosFromAlbums < ActiveRecord::Migration
  def up
    remove_column :albums, :photos
  end
  def down
    add_column :albums, :photos, :text, array: true, default: []    
  end
end
