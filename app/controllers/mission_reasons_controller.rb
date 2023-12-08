class MissionReasonsController < ApplicationController
  before_action :set_mission_reason, only: %i[ show edit update destroy ]

  def index
    @mission_reasons = MissionReason.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @mission_reason = MissionReason.find(params[:id])
  end

  def new
    @mission_reason = MissionReason.new
  end

  def edit
  end

  def create
    @mission_reason = current_operator.mission_reasons.build(mission_reason_params)

    if @mission_reason.save
      redirect_to mission_reasons_path, notice: "Motivo Missione creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mission_reason.update(mission_reason_params)
      redirect_to mission_reasons_path, notice: "Motivo Missione modificato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mission_reason.destroy
    redirect_to mission_reasons_url, notice: "Motivo Missione eliminato con successo."
  end

  private

  def set_mission_reason
    @mission_reason = MissionReason.find(params[:id])
  end

  def mission_reason_params
    params.require(:mission_reason).permit(:name, :position, :operator_id)
  end
end
