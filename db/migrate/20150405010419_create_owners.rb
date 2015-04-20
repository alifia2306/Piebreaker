class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :username
      t.string :restaurant_name
      t.string :address
      t.string :password
      t.string :category
      t.string :plan

      t.timestamps
    end
  end
end
