class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :sum
      t.timestamps null: false
    end
    add_reference :expenses, :user, showhtml: true
  end
end
