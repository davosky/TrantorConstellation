class Reason < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_reason_id

  validates :name, :position, presence: true

  private

  def set_reason_id
    return if self.id.present?

    last_id = Reason.maximum(:id) || 0
    self.id = last_id + 1
  end
end
