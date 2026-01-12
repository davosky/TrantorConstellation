class Structure < ApplicationRecord
  belongs_to :user, optional: true

  before_create :set_structure_id

  validates :name, :position, presence: true

  private

  def set_structure_id
    return if self.id.present?

    last_id = Structure.maximum(:id) || 0
    self.id = last_id + 1
  end
end
