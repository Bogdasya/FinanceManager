class Plan < ActiveRecord::Base
  has_many :charges
  belongs_to :user
end
