class AddChargeToUser < ActiveRecord::Migration
  def change
    add_reference :charges, :user, index: true
    add_foreign_key :charges, :users
    add_reference :charges, :plan, index: true
    add_foreign_key :charges, :plans
  end
end
