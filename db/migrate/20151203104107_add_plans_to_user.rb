class AddPlansToUser < ActiveRecord::Migration
  def change
    add_reference :plans, :user, showhtml: true
    add_foreign_key :plans, :users
  end
end
