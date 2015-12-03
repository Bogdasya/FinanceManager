class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :name
      t.string :description
      t.decimal :cost
      t.timestamps null: false
    end
  end
end
