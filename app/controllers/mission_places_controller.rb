class MissionPlacesController < ApplicationController
  before_action :set_mission_place, only: %i[ show edit update destroy ]

  def index
    @mission_places = MissionPlace.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @mission_place = MissionPlace.find(params[:id])
  end

  def new
    @mission_place = MissionPlace.new
  end

  def edit
  end

  def create
    @mission_place = current_operator.mission_places.build(mission_place_params)

    if @mission_place.save
      redirect_to mission_places_path, notice: "Luogo Missione creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mission_place.update(mission_place_params)
      redirect_to mission_places_path, notice: "Luogo Missione modificato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission_place.destroy
    redirect_to mission_places_url, notice: "Luogo Missione eliminato con successo."
  end

  private

  def set_mission_place
    @mission_place = MissionPlace.find(params[:id])
  end

  def mission_place_params
    params.require(:mission_place).permit(:name, :position, :operator_id)
  end
end
