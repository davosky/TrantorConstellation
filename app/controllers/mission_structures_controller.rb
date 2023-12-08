class MissionStructuresController < ApplicationController
  before_action :set_mission_structure, only: %i[ show edit update destroy ]

  def index
    @mission_structures = MissionStructure.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @mission_structure = MissionStructure.find(params[:id])
  end

  def new
    @mission_structure = MissionStructure.new
  end

  def edit
  end

  def create
    @mission_structure = current_operator.mission_structures.build(mission_structure_params)

    if @mission_structure.save
      redirect_to mission_structures_path, notice: "Struttura Missione creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mission_structure.update(mission_structure_params)
      redirect_to mission_structures_path, notice: "Struttura Missione modificato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission_structure.destroy
    redirect_to mission_structures_url, notice: "Struttura Missione eliminato con successo."
  end

  private

  def set_mission_structure
    @mission_structure = MissionStructure.find(params[:id])
  end

  def mission_structure_params
    params.require(:mission_structure).permit(:name, :position, :operator_id)
  end
end
