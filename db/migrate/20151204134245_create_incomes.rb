class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string :title
      t.decimal :sum
      t.timestamps null: false
    end
    add_reference :incomes, :user, showhtml: true
  end
end
