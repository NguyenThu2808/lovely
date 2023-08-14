class CreateShoppingSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_sessions do |t|
      t.integer :user_id
      t.float :total

      t.timestamps
    end
  end
end
