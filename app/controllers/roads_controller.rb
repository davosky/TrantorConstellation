class RoadsController < ApplicationController
  before_action :set_road, only: %i[ show edit update destroy ]

  def index
    @roads = Road.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @road = Road.new
  end

  def edit
  end

  def create
    @road = current_user.roads.build(road_params)

    respond_to do |format|
      if @road.save
        format.html { redirect_to roads_path, notice: "Il Percorso è stato creato con successo." }
        format.json { render :show, status: :created, location: @road }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @road.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @road.update(road_params)
        format.html { redirect_to roads_path, notice: "Il Percorso è stato modificato con successo.", status: :see_other }
        format.json { render :show, status: :ok, location: @road }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @road.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    @road = Road.find(params[:id])
  end

  def destroy
    @road.destroy!

    respond_to do |format|
      format.html { redirect_to roads_path, notice: "Il Percorso è stato eliminato con successo.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_road
    @road = Road.find(params[:id])
  end

  def road_params
    params.require(:road).permit(:name, :road_lenght, :highway_cost, :position, :user_id)
  end
end
