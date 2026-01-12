class Place < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_place_id

  validates :name, :position, presence: true

  private

  def set_place_id
    return if self.id.present?

    last_id = Place.maximum(:id) || 0
    self.id = last_id + 1
  end
end
