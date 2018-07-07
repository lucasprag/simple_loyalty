class CreateLoyaltyPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_points do |t|
      t.integer :shop_id
      t.integer :customer_id
      t.integer :order_id
      t.integer :points

      t.timestamps
    end
  end
end
