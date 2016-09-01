class RoutesController < ApplicationController
  before_action :set_route, only: [:show]

  def new
    @route = Route.new
  end

  def create
    l1 = Location.create(address: params[:route][:startcoords])
    l2 = Location.create(address: params[:route][:endcoords])
    @route = Route.new(startcoords: l1.coordinates, endcoords: l2.coordinates)
    @route.set_travel_time!

    if @route.save
      redirect_to route_path(@route), notice: 'Route was successfully retrieved!'
    else
      render :new
    end
  end

  def show
  end

  private
  def route_params
    params.require(:route).permit(:startcoords, :endcoords)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
