class CatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
    #   binding.pry
      @cats = Cat.all
      @cats = Cat.search_by_address(params[:search][:address])
    #   binding.pry
          if params[:filters].present?
            # binding.pry
            filters = JSON.parse(params[:filters])
            filters = JSON.parse params[:filters].gsub('=>', ':')
            # filters.each do |key, value|
            #     new_hash = {}
            #     new_hash.add(key => value)




            # filters = filters.gsub(/:(\w+)/){"\"#{$1}\""}
            # filters = filters.gsub('=>', ':')
            # filters = filters.gsub("nil", "null")
              # JSON.parse(filters)




            search_fluffiness = filters[:fluffiness].to_i

            search_angriness_level = filters[:angriness_level].to_i
            search_distance = filters[:distance].to_i
            search_price = filters[:price].to_i
            search_colors = filters[:colors].to_i

            @cats = @cats.where(fluffiness: search_fluffiness)
            @cats = @cats.where(angriness_level: search_angriness_level)
            @cats.foreach do |cat|
              if cat[:distance] <= search_distance
                distace_cats = []
                distace_cats << cat
                @cats = distace_cats
              end
            end

          end

    else
      @cats = Cat.all
    end

    @markers = @cats.geocoded.map do |cat|
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
    @booking = Booking.new
    @user = @cat.user

    @sum_stars_angriness = @cat.angriness_level
    @sum_no_stars_angriness = 5 - @sum_stars_angriness

    @sum_stars_fluffiness = @cat.fluffiness
    @sum_no_stars_fluffiness = 5 - @sum_stars_fluffiness
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
    params.require(:cat).permit(:name, :address, :angriness_level, :fluffiness, :color, :price, :photo, :description)
  end

  def booking_params
    params.require(:cat).permit(:name, :address, :angriness_level, :fluffiness, :color, :price, :photo)
  end
end
