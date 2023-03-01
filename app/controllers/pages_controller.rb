class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cats = Cat.where(angryness: 3)
  end
end
