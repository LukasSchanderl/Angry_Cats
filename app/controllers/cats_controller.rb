class CatsController < ApplicationController
  def index
    @cats = Cat.all

    @markers = @flats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude
      }
    end
  end

  def show
    @cat = Cat.find(params[:id])
    @owner = @cat.user
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
end
