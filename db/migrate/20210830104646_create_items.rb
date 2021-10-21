class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
