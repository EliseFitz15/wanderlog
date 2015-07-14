class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.string :title, null: false
      t.string :description, null: false
      t.date :startdate, null: false

      t.timestamp null: false
    end
  end
end
