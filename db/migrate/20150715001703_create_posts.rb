class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :trip
      t.string :headline, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
