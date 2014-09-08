class CreateWhouses < ActiveRecord::Migration
  def change
    create_table :whouses do |t|
      t.integer :account_id
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
    add_index :whouses, :account_id
  end
end
