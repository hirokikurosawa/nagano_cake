class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage, default: 800
      t.integer :total_payment, default: 0
      t.integer :payment_method, default: 0
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
