class AddPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :password_digest, :string
    add_column :admins, :password_digest, :string
    remove_column :admins, :password
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
