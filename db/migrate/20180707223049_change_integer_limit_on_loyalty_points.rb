class ChangeIntegerLimitOnLoyaltyPoints < ActiveRecord::Migration[5.2]
  def change
    change_column :loyalty_points, :shop_id, :integer, limit: 8
    change_column :loyalty_points, :customer_id, :integer, limit: 8
    change_column :loyalty_points, :order_id, :integer, limit: 8
  end
end
