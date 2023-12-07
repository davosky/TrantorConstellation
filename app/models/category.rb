class Category < ApplicationRecord
  has_many :operators

  validates :name, :description, :position, presence: true
end
