class CreatePaymentDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_details do |t|
      t.integer :order_id
      t.integer :amount
      t.string :provider
      t.integer :status

      t.timestamps
    end
  end
end
