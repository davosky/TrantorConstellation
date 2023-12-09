class MissionReason < ApplicationRecord
  belongs_to :operator, optional: true

  before_create :set_id

  def set_id
    last_id = MissionReason.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :position, :operator_id, presence: true
end
