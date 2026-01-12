class ReasonsController < ApplicationController
  before_action :set_reason, only: %i[ show edit update destroy ]

  def index
    @reasons = Reason.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @reason = Reason.new
  end

  def edit
  end

  def create
    @reason = current_user.reasons.build(reason_params)

    respond_to do |format|
      if @reason.save
        format.html { redirect_to reasons_path, notice: "Il Motivo Missione è stato creato con successo." }
        format.json { render :show, status: :created, location: @reason }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reason.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reason.update(reason_params)
        format.html { redirect_to reasons_path, notice: "Il Motivo Missione è stato modificato con successo.", status: :see_other }
        format.json { render :show, status: :ok, location: @reason }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reason.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    @reason = Reason.find(params[:id])
  end

  def destroy
    @reason.destroy!

    respond_to do |format|
      format.html { redirect_to reasons_path, notice: "Il Motivo Missione è stato eliminato con successo.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_reason
    @reason = Reason.find(params[:id])
  end

  def reason_params
    params.require(:reason).permit(:name, :position, :user_id)
  end
end
