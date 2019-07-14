class AddLayerToCustomCake < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_cake_orders , :layers, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
