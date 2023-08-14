class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.text :desc
      t.float :discount_percent

      t.timestamps
    end
  end
end
