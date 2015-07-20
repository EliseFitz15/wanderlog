class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.belongs_to :trip, null: false
      t.belongs_to :user, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :location_name, null: false
      t.string :memory
      t.string :highlight_photo

      t.timestamps null:false
    end
  end
end
