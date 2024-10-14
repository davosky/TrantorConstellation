class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  has_many :roads
  has_many :reasons
  has_many :places
  has_many :structures
  has_many :transports
  has_many :veichles
  has_many :reimbursements

  before_create :set_id

  def set_id
    last_id = User.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :sex, :first_name, :last_name, :region, :province, :institute, :office, :category, :validator, :validator_presentation, :organizational, :organizational_presentation, presence: true
end
