class TransportsController < ApplicationController
  before_action :set_transport, only: %i[ show edit update destroy ]

  def index
    @transports = Transport.where(operator_id: current_operator.id).order(position: "ASC")
  end

  def show
    @transport = Transport.find(params[:id])
  end

  def new
    @transport = Transport.new
  end

  def edit
  end

  def create
    @transport = current_operator.transports.build(transport_params)

    if @transport.save
      redirect_to transports_path, notice: "Trasporto creato con successo."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @transport.name == "Veicolo Aziendale" || @transport.id == 1 || @transport.name == "Veicolo Privato" || @transport.id == 2
      redirect_to transports_url, notice: "Record di sistema non cancellabile"
    else
      if @transport.update(transport_params)
        redirect_to transports_path, notice: "Trasporto modificato con successo."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if @transport.name == "Veicolo Aziendale" || @transport.id == 1 || @transport.name == "Veicolo Privato" || @transport.id == 2
      redirect_to transports_url, notice: "Record di sistema non cancellabile"
    else
      @transport.destroy
      redirect_to transports_url, notice: "Trasporto eliminato con successo."
    end
  end

  private

  def set_transport
    @transport = Transport.find(params[:id])
  end

  def transport_params
    params.require(:transport).permit(:name, :position, :operator_id)
  end
end
