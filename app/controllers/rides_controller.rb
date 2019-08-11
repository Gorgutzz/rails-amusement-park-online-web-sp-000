class RidesController < ApplicationController

  def create
    ride = Ride.create(user_id: session[:user_id], attraction_id: params[:ride][:attraction_id])
    flash[:notice] = ride.take_ride
    redirect_to current_user
  end

end
