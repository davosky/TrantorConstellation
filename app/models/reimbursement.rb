class Reimbursement < ApplicationRecord
  belongs_to :place, optional: true
  belongs_to :reason, optional: true
  belongs_to :road, optional: true
  belongs_to :structure, optional: true
  belongs_to :transport, optional: true
  belongs_to :user, optional: true
  belongs_to :veichle, optional: true

  before_create :set_name
  before_save :fill_free_fields, :calculate_total

  validates :departure_date, :return_date, :request_date, :refund_date, :transport_id, presence: true

  # Set a new name based on the maximum value
  def set_name
    last_name = Reimbursement.maximum(:name)
    self.name = last_name.to_i + 1
  end

  # Fill free fields (_fr) from associations
  def fill_free_fields
    self.user_fr = "#{self.user&.first_name} #{self.user&.last_name}"
    self.reason_fr = self.reason&.name
    self.road_fr = self.road&.name
    self.highway_cost_fr = self.road&.highway_cost || highway_cost_fr
    self.road_lenght_fr = self.road&.road_lenght || road_lenght_fr
    self.place_fr = self.place&.name
    self.structure_fr = self.structure&.name
    self.transport_fr = self.transport&.name
    self.veichle_fr = "#{self.veichle&.producer} #{self.veichle&.name} con targa: #{self.veichle&.license_plate}"
  end

  # Calculate the total amount by summing expenses
  def calculate_total
    food = self.food_cost || 0.0
    parking = self.parking_cost || 0.0
    room = self.room_cost || 0.0
    ticket = self.ticket_cost || 0.0
    generic = self.generic_cost || 0.0
    highway = self.road&.highway_cost || self.highway_cost_fr || 0.0

    if self.transport&.name == "Veicolo Aziendale"
      sum_value = food + parking + room + ticket + generic + highway
    elsif self.transport&.name == "Veicolo Privato"
      partial_cost = (self.road&.road_lenght || self.road_lenght_fr) * self.user.cost_per_km
      sum_value = food + parking + room + ticket + generic + highway + partial_cost
    else
      sum_value = food + parking + room + ticket + generic
    end

    self.total_amount = sum_value
  end
end
