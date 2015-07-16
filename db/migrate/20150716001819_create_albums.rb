class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.belongs_to :trip
      t.text :photos, array: true, default: []
    end
  end
end
