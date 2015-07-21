class ChangeToDatetimeOnTrips < ActiveRecord::Migration
  def up
    remove_column :trips, :startdate, :date, null: false
    add_column :trips, :startdate, :datetime, null: false
  end
  
  def down
    remove_column :trips, :startdate, :datetime, null: false
    add_column :trips, :startdate, :date, null: false
  end
end
