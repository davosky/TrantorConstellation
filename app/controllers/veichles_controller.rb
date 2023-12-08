class VeichlesController < ApplicationController
  before_action :set_veichle, only: %i[ show edit update destroy ]

  def index
    @veichles = Veichle.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @veichle = Veichle.find(params[:id])
  end

  def new
    @veichle = Veichle.new
  end

  def edit
  end

  def create
    @veichle = current_operator.veichles.build(veichle_params)

    if @veichle.save
      redirect_to veichles_path, notice: "Veicolo creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @veichle.update(veichle_params)
      redirect_to veichles_path, notice: "Veicolo modificato con successo."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @veichle.destroy
    redirect_to veichles_url, notice: "Veicolo eliminato con successo."
  end

  private

  def set_veichle
    @veichle = Veichle.find(params[:id])
  end

  def veichle_params
    params.require(:veichle).permit(:model, :producer, :license_plate, :position, :operator_id)
  end
end
