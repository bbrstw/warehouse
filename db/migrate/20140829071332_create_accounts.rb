class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :description
      t.string :subdomain
      t.string :image

      t.timestamps
    end
  end
end
