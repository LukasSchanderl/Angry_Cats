class CatsController < ApplicationController
  def index
    @cats = Cat.all
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
    @user = @cat.user
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
end
