class AddPhotoToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :cover_photo, :string
  end
end
