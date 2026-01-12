class Road < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_road_id

  validates :name, :road_lenght, :position, presence: true

  private

  def set_road_id
    return if self.id.present?

    last_id = Road.maximum(:id) || 0
    self.id = last_id + 1
  end
end
