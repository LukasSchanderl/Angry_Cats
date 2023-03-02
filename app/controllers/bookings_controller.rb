class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @cat = Cat.find(params[:cat])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @cat = Cat.find(params[:cat_id])
    @booking.cat = @cat

    if @booking.save!
      redirect_to root
      raise
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
