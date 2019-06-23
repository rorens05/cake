class AddDateToBeDelivered < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :date_to_be_delivered, :timestamp 
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
