class RoutesController < ApplicationController
  def new
    @route = Route.new
  end

  def create
    l1 = Location.create(address: params[:route][:startcoords])
    l2 = Location.create(address: params[:route][:endcoords])
    @route = Route.new(startcoords: l1.coordinates, endcoords: l2.coordinates)
    @route.get_travel_time! 
  end

  private
  def route_params
    params.require(:route).permit(:startcoords, :endcoords)
  end
end
