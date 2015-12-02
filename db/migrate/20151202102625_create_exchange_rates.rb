class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.date :date
      t.decimal :usd
      t.decimal :eur
      t.timestamps null: false
    end
  end
end
