class CreateChargeElements < ActiveRecord::Migration
  def change
    create_table :charge_elements do |t|
      t.integer :charge_id
      t.string :name
      t.timestamps null: false
    end
    add_reference :charge_elements, :charges, showhtml: true
    add_foreign_key :charge_elements, :charges
  end
end
