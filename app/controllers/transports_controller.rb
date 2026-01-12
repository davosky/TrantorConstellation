class TransportsController < ApplicationController
  before_action :set_transport, only: %i[ show edit update destroy ]

  def index
    @transports = Transport.where(user_id: current_user.id).order(position: "ASC")
  end

  def show
  end

  def new
    @transport = Transport.new
  end

  def edit
  end

  def create
    @transport = current_user.transports.build(transport_params)

    respond_to do |format|
      if @transport.save
        format.html { redirect_to transports_path, notice: "Il Trasporto è stato creato con successo." }
        format.json { render :show, status: :created, location: @transport }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato"
      redirect_to transports_path, notice: "Record di sistema non modificabile"
    else
      if @transport.update(transport_params)
        format.html { redirect_to transports_path, notice: "Il Trasporto è stato aggiornato con successo.", status: :see_other }
        format.json { render :show, status: :ok, location: @transport }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def confirm_delete
    @transport = Transport.find(params[:id])
  end

  def destroy
    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato"
      redirect_to transports_path, notice: "Record di sistema non cancellabile"
    else
    @transport.destroy!

    respond_to do |format|
      format.html { redirect_to transports_path, notice: "Il Trasporto è stato eliminato con successo.", status: :see_other }
      format.json { head :no_content }
    end
    end
  end

  private

  def set_transport
    @transport = Transport.find(params[:id])
  end

  def transport_params
    params.require(:transport).permit(:name, :position, :user_id)
  end
end
