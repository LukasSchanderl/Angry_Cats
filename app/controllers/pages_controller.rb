class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]

  def home
    @cats = Cat.all
  end

  def dashboard
    @cats = Cat.where(user: current_user)
    
    @user_bookings = current_user.bookings
  end
end
