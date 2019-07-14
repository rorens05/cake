class AddCartToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cart, :boolean, :default => false
    Order.all.each do |o|
      o.cart = false
      o.save
    end
  end
end
