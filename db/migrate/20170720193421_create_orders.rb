class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :returned_at
      t.timestamps
    end
  end
end
