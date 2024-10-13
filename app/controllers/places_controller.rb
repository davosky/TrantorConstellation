class PlacesController < ApplicationController
  before_action :set_place, only: %i[ show edit update destroy ]

  def index
    @places = Place.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = current_user.places.build(place_params)

    if @place.save
      redirect_to places_path, notice: "place was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to places_path, notice: "place was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url, notice: "place was successfully destroyed."
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :position, :user_id)
  end
end
