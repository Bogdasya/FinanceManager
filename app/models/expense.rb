class Expense < ActiveRecord::Base
  belongs_to :user
  validates :sum, presence: true, on: :create
  validates :title, presence: true, on: :create
  before_create :capitalize

  def capitalize
    self.title = self.title.mb_chars.titleize.to_s
  end
end
