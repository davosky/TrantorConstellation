class MissionPathsController < ApplicationController
  before_action :set_mission_path, only: %i[ show edit update destroy ]

  def index
    @mission_paths = MissionPath.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @mission_path = MissionPath.find(params[:id])
  end

  def new
    @mission_path = MissionPath.new
  end

  def edit
  end

  def create
    @mission_path = current_operator.mission_paths.build(mission_path_params)

    if @mission_path.save
      redirect_to mission_paths_path, notice: "Percorso Missione creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mission_path.update(mission_path_params)
      redirect_to mission_paths_path, notice: "Percorso Missione modificato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission_path.destroy
    redirect_to mission_paths_url, notice: "Percorso Missione eliminato con successo."
  end

  private

  def set_mission_path
    @mission_path = MissionPath.find(params[:id])
  end

  def mission_path_params
    params.require(:mission_path).permit(:path, :road_lenght, :highway_cost, :position, :operator_id)
  end
end
