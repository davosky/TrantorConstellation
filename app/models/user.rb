class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable

  before_create :set_id

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  before_save :fill_name

  def fill_name
    self.name = "#{self.last_name} #{self.first_name}"
  end
end
