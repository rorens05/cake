class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.timestamp :ordered_at
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
      t.integer :no_of_items
      t.string :payment_method
      t.string :status
      t.string :delivery_location
      t.timestamp :delivered_at

      t.timestamps
    end
  end
end
