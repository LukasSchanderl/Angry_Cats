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
    @user = @cat.user
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save
      redirect_to cat_path(@cat)
      raise
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :pickup_address, :angriness_level, :fluffiness, :color, :price, :photo)
  end
end
