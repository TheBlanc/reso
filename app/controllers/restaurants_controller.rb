class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(1)
  end

  def edit
    @restaurant = Restaurant.find(1)
  end


  def update
    @restaurant = Restaurant.find(1)
    @restaurant.name = params[:restaurant][:name]
    @restaurant.open_at = params[:restaurant][:open_at]
    @restaurant.close_at = params[:restaurant][:close_at]
    @restaurant.capacity = params[:restaurant][:capacity]


    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
      flash[:alert] = "Something went wrong"
    end
  end


  def restaurant_params
    params.require(:restaurants).permit(:name, :time_slot, :user_id)
  end

end
