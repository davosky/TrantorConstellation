class Transport < ApplicationRecord
  belongs_to :operator

  before_update :check_transport
  before_destroy :check_transport

  def check_transport
    if self.name == "Veicolo Aziendale" || self.name == "Veicolo Privato" || self.id == 1 || self.id == 2
      redirect_to transport_path
    end
  end

  before_create :set_id

  def set_id
    last_id = Transport.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :position, :operator_id, presence: true
end
