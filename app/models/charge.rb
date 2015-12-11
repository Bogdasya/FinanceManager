class Charge < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan
  has_many :charge_elements, dependent: :destroy
end
