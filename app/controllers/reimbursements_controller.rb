class ReimbursementsController < ApplicationController
  before_action :set_reimbursement, only: %i[ show edit update destroy ]

  def index
    @reimbursements = Reimbursement.where(user_id: current_user.id).order(departure_date: "DESC")
  end

  def show
    @reimbursement = Reimbursement.find(params[:id])
  end

  def new
    @reimbursement = Reimbursement.new
  end

  def edit
  end

  def create
    @reimbursement = current_user.reimbursements.build(reimbursement_params)

    if @reimbursement.save
      redirect_to reimbursements_path, notice: "reimbursement was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reimbursement.update(reimbursement_params)
      redirect_to reimbursements_path, notice: "reimbursement was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reimbursement.destroy
    redirect_to reimbursements_url, notice: "reimbursement was successfully destroyed."
  end

  private

  def set_reimbursement
    @reimbursement = Reimbursement.find(params[:id])
  end

  def reimbursement_params
    params.require(:reimbursement).permit(:name,
                                          :departure_date,
                                          :return_date,
                                          :request_date,
                                          :reimbursement_date,
                                          :parking_cost,
                                          :food_cost,
                                          :room_cost,
                                          :ticket_cost,
                                          :generic_cost,
                                          :total_amount,
                                          :place_id,
                                          :reason_id,
                                          :road_id,
                                          :structure_id,
                                          :transport_id,
                                          :user_id,
                                          :veichle_id,
                                          :place_fr,
                                          :reason_fr,
                                          :road_fr,
                                          :structure_fr,
                                          :transport_fr,
                                          :veichle_fr,
                                          :road_lenght_fr,
                                          :highway_cost_fr)
  end
end
