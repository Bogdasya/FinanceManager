class Event < ActiveRecord::Base
  belongs_to :user

  def start_time
    self.start_at
  end

end
