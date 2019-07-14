class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :label
      t.decimal :price, :precision => 8, :scale => 2
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
