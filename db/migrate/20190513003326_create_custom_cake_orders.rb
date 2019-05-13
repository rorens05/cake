class CreateCustomCakeOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_cake_orders do |t|
      t.string :theme
      t.string :size
      t.string :flavor
      t.string :color
      t.string :shape
      t.references :customer, foreign_key: true
      t.integer :quantity
      t.decimal :price
      t.string :payment_method
      t.timestamps
    end
  end
end
