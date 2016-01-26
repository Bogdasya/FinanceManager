class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.decimal :price
      t.string :title
      t.integer :user_id
      t.timestamps null: false
    end
    add_reference :wishes, :users, showhtml: true
    add_foreign_key :wishes, :users
  end
end
