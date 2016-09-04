class RoutesController < ApplicationController
  before_action :set_route, only: [:show]
  
  def index
    @routes = Route.all
  end
  
  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      @route.set_travel_time!
      redirect_to route_path(@route), notice: 'Route was successfully retrieved!'
    else
      flash.now[:alert] = 'Bzzz....Brrr....There was a problem when submitting the form! Please ensure all fields are correct.'
      render :new
    end
  end

  def show
  end

  private
  def route_params
    params.require(:route).permit(:start_address, :end_address, :departs_at)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
