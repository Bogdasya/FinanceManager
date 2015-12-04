class ChangeFieldsEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_time, :date
  end
end
