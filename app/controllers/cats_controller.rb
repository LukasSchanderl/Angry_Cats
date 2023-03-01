class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @cats = Cat.all

    @markers = @cats.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cat: cat}),
        marker_html: render_to_string(partial: "marker", locals: {cat: cat}) # Pass the flat to the partial
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
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :address, :angriness_level, :fluffiness, :color, :price, :photo)
  end
end
