class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :charges
  has_many :plans
  has_one :wallet
  has_many :events
  has_many :incomes
  has_many :expenses
  has_many :wishes
  validates_length_of :first_name, minimum: 5,
                      wrong_length: "should be %{count} characters long"

end
