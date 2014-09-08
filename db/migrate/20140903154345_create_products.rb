class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :account_id
      t.text :name
      t.text :description
      t.text :sku
      t.string :code
      t.string :image
      t.decimal :cost, :precision => 8, :scale => 2
      t.decimal :weight, :precision => 7, :scale => 2
      t.string :weight_unit
      t.integer :restock
      t.integer :category_id
      t.integer :supplier_id
      t.integer :brand_id

      t.timestamps
    end
    add_index :products, :account_id
  end
end
