class PathsController < ApplicationController
  before_action :set_path, only: [:show]
  
  def index
    @paths = Path.all
  end
  
  def new
    @path = Path.new
  end

  def create
    @path = Path.new path_params

    if @path.save
      @path.set_travel_time!
      redirect_to path_path(@path), notice: 'Path was successfully retrieved!'
    else
      render :new
    end
  end

  def show
    @nearby_points = @path.get_nearby_points
  end

  private
  def path_params
    params.require(:path).permit(
      :start_address,
      :end_address,
      :departs_at,
      :visit_duration)
  end

  def set_path
    @path = Path.find(params[:id])
  end
end
