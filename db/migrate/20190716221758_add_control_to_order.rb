class AddControlToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :control_number, :string
    add_column :orders, :sender, :string

  end
end
