class Veichle < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_id

  def set_id
    last_id = Veichle.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :license_plate, uniqueness: true
  validates :license_plate, :name, :producer, :position, presence: true
end
