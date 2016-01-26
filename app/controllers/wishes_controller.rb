class WishesController < ApplicationController
  def index
    @wishes = current_user.wishes
  end
end
