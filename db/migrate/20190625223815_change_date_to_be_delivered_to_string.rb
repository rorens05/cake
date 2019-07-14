class ChangeDateToBeDeliveredToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :date_to_be_delivered
    add_column :orders, :date_to_be_delivered, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
