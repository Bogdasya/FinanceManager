class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.decimal :money
      t.timestamps null: false
    end
  end
end
