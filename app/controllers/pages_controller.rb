class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home show]

  def home
    @cats = Cat.all
  end

  def dashboard
    @user_cats = current_user.cats
    @user_bookings = current_user.bookings
  end
end
