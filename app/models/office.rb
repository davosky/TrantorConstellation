class Office < ApplicationRecord
  has_many :operators

  validates :name, :description, :position, presence: true
end
