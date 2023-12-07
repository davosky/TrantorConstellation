class Region < ApplicationRecord
  has_many :operators

  before_create :set_id

  def set_id
    last_id = Region.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :name, :description, :position, presence: true
end
