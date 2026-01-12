class Transport < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_transport_id

  validates :name, :position, presence: true
  validates :name, exclusion: {
    in: [ "Veicolo Aziendale", "Veicolo Privato" ],
    message: "Le voci: Veicolo Aziendale e Veicolo Privato, sono voci di sistema necessarie per le elaborazioni dei rimborsi spese, vengono assegnate alla creazione dell'utente e non sono modificabili dallo stesso"
  }

  private

  def set_transport_id
    return if self.id.present?

    last_id = Transport.maximum(:id) || 0
    self.id = last_id + 1
  end
end
