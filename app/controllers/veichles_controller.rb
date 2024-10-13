class VeichlesController < ApplicationController
  before_action :set_veichle, only: %i[ show edit update destroy ]

  def index
    @veichles = Veichle.where(user_id: current_user.id).order(position: "ASC")
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
    @veichle = current_user.veichles.build(veichle_params)

    if @veichle.save
      redirect_to veichles_path, notice: "veichle was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @veichle.update(veichle_params)
      redirect_to veichles_path, notice: "veichle was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @veichle.destroy
    redirect_to veichles_url, notice: "veichle was successfully destroyed."
  end

  private

  def set_veichle
    @veichle = Veichle.find(params[:id])
  end

  def veichle_params
    params.require(:veichle).permit(:name, :producer, :license_plate, :cost_per_km, :fuel_type, :territory, :position, :user_id)
  end
end
