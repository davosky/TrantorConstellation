class Road < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_id

  def set_id
    last_id = Road.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :position, :user_id, :road_lenght, presence: true
end
