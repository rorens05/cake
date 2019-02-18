class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :contact_no
      t.string :email
      t.string :gender
      t.string :status

      t.timestamps
    end
  end
end
