class TransportsController < ApplicationController
  before_action :set_transport, only: %i[ show edit update destroy ]

  def index
    @transports = Transport.where(user_id: current_user.id).order(position: "ASC")
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
    @transport = current_user.transports.build(transport_params)

    if @transport.save
      redirect_to transports_path, notice: "transport was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @transport = Transport.find(params[:id])

    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato" || @transport.id == 1 || @transport.id == 2
      redirect_to transports_path
    elsif @transport.update(transport_params)
      redirect_to transports_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @transport.name == "Veicolo Aziendale" || @transport.name == "Veicolo Privato" || @transport.id == 1 || @transport.id == 2
      redirect_to transports_path
    elsif @transport.destroy
      redirect_to transports_path
    else
      render :edit, status: :unprocessable_entity
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
