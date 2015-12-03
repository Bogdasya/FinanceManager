class DeleteFieldsMoneyFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :money
  end
end
