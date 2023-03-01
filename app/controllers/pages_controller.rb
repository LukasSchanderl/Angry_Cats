class PagesController < ApplicationController
  def home
    @cats = Cat.where(angryness: 3)
  end

  def search
  end
end
