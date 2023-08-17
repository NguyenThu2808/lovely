class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :session_id
      t.bigint :product_id
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
