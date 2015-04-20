class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :business_id
      t.string :full_address
      t.string :categories
      t.string :city
      t.integer :review_count
      t.string :name
      t.string :state
      t.integer :price_range
      t.boolean :wifi
      t.boolean :parking
      t.boolean :delivery
      t.boolean :outdoor_seating
      t.float :rating

      t.timestamps
    end
  end
end
