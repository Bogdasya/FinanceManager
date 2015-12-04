class AddChargeToUser < ActiveRecord::Migration
  def change
    add_reference :charges, :user, showhtml: true
    add_foreign_key :charges, :users
    add_reference :charges, :plan, showhtml: true
    add_foreign_key :charges, :plans
  end
end
