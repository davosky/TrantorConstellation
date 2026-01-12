class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable

  has_many :transports
  has_many :vehicles
  has_many :places
  has_many :structures
  has_many :roads
  has_many :reasons

  before_create :set_id
  before_save :fill_name

  private

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  def fill_name
    self.name = "#{self.last_name} #{self.first_name}"
  end
end
