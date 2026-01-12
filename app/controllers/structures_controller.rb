class StructuresController < ApplicationController
  before_action :set_structure, only: %i[ show edit update destroy ]

  def index
    @structures = Structure.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @structure = Structure.new
  end

  def edit
  end

  def create
    @structure = current_user.structures.build(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to structures_path, notice: "La Struttura è stata creata con successo." }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @structure.update(structure_params)
        format.html { redirect_to structures_path, notice: "La Struttura è stata modificata con successo.", status: :see_other }
        format.json { render :show, status: :ok, location: @structure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    @structure = Structure.find(params[:id])
  end

  def destroy
    @structure.destroy!

    respond_to do |format|
      format.html { redirect_to structures_path, notice: "La Struttura è stata eliminata con successo.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_structure
    @structure = Structure.find(params[:id])
  end

  def structure_params
    params.require(:structure).permit(:name, :position, :user_id)
  end
end
