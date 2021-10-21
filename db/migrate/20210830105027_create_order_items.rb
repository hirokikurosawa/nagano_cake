class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.datetime :created_at
      t.datetime :updeted_at

      t.timestamps
    end
  end
end
