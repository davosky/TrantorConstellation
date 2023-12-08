class MissionPath < ApplicationRecord
  belongs_to :operator, optional: true

  before_create :set_id

  def set_id
    last_id = MissionPath.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :path, :road_lenght, :position, :operator_id, presence: true
end
