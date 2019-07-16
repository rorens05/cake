class AddStatusToCustom < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_cake_orders, :status, :string
  end
end
