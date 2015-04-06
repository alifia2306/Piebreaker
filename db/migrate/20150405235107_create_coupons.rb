class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :username
      t.string :content

      t.timestamps
    end
  end
end
