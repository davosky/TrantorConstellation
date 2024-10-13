class RoadsController < ApplicationController
  before_action :set_road, only: %i[ show edit update destroy ]

  def index
    @roads = Road.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
    @road = Road.find(params[:id])
  end

  def new
    @road = Road.new
  end

  def edit
  end

  def create
    @road = current_user.roads.build(road_params)

    if @road.save
      redirect_to roads_path, notice: "road was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @road.update(road_params)
      redirect_to roads_path, notice: "road was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @road.destroy
    redirect_to roads_url, notice: "road was successfully destroyed."
  end

  private

  def set_road
    @road = Road.find(params[:id])
  end

  def road_params
    params.require(:road).permit(:name, :road_lenght, :highway_cost, :position, :user_id)
  end
end
