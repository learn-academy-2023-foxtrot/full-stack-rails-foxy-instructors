class BusinessController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.create(business_params)
    if @business.valid?
      redirect_to '/'
    else
      @business.errors
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    if @business.valid?
      redirect_to business_path
    else
      @business.errors
    end
  end

  def destroy
    @business = Business.find(params[:id])
    @business.destroy
    if @business.valid?
      redirect_to '/'
    else
      @business.errors
    end
  end

  private
  def business_params
    params.require(:business).permit(:name, :description, :team, :star_rating)
  end
end
