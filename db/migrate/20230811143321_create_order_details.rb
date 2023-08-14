class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :user_id
      t.float :total
      t.integer :payment_id

      t.timestamps
    end
  end
end
