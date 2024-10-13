class StructuresController < ApplicationController
  before_action :set_structure, only: %i[ show edit update destroy ]

  def index
    @structures = Structure.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
    @structure = Structure.find(params[:id])
  end

  def new
    @structure = Structure.new
  end

  def edit
  end

  def create
    @structure = current_user.structures.build(structure_params)

    if @structure.save
      redirect_to structures_path, notice: "structure was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @structure.update(structure_params)
      redirect_to structures_path, notice: "structure was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @structure.destroy
    redirect_to structures_url, notice: "structure was successfully destroyed."
  end

  private

  def set_structure
    @structure = Structure.find(params[:id])
  end

  def structure_params
    params.require(:structure).permit(:name, :position, :user_id)
  end
end
