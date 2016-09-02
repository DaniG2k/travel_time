class RoutesController < ApplicationController
  before_action :set_route, only: [:show]
  
  def index
    @routes = Route.all
  end
  
  def new
    @route = Route.new
  end

  def create
    coords1 = if params[:route][:startcoords].present?
      Location.create(address: params[:route][:startcoords]).coordinates
    else
      nil
    end

    coords2 = if params[:route][:endcoords].present?
      Location.create(address: params[:route][:endcoords]).coordinates
    else
      nil
    end
      
    @route = Route.new(startcoords: coords1, endcoords: coords2, departs_at: params[:route][:departs_at])

    if @route.save
      @route.set_travel_time!
      redirect_to route_path(@route), notice: 'Route was successfully retrieved!'
    else
      flash.now[:alert] = 'Bzzz....Brrr....There was a problem!'
      render :new
    end
  end

  def show
  end

  private
  def route_params
    params.require(:route).permit(:startcoords, :endcoords, :departs_at)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
