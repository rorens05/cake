class AddDeliveredAtInCustom < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_cake_orders, :delivered_at, :datetime

  end
end
