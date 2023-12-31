class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :sku
      t.integer :category_id
      t.float :price
      t.integer :discount_id

      t.timestamps
    end
  end
end
