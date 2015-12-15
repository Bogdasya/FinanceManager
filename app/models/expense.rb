class Expense < ActiveRecord::Base
  belongs_to :user
  validates :sum, presence: true, on: :create
  validates :title, presence: true, on: :create
end
