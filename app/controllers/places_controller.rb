class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]

  def index
    @places = Place.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = current_user.places.build(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to places_path, notice: "Il Luogo è stato creato con successo." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to places_path, notice: "Il Luogo è stato modificato con successo.", status: :see_other }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    @place = Place.find(params[:id])
  end

  def destroy
    @place.destroy!

    respond_to do |format|
      format.html { redirect_to places_path, notice: "Il Luogo è stato eliminato con successo.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :position, :user_id)
  end
end
