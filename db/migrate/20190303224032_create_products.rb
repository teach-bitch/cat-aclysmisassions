class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :title
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :reference

      t.timestamps
    end
  end
end
