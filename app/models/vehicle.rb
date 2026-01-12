class Vehicle < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_vehicle_id

  validates :name, :producer, :licence_plate, :cost_per_km, :position, presence: true

  private

  def set_vehicle_id
    return if self.id.present?

    last_id = Vehicle.maximum(:id) || 0
    self.id = last_id + 1
  end
end
