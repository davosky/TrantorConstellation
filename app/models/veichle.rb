class Veichle < ApplicationRecord
  belongs_to :operator

  validates :license_plate, uniqueness: true
  validates :license_plate, :model, :producer, :position, presence: true
end
