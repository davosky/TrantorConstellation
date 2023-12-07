class Operator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  belongs_to :region, optional: :turue
  belongs_to :province, optional: :turue
  belongs_to :category, optional: :turue
  belongs_to :institute, optional: :turue
  belongs_to :office, optional: :turue

  has_many :veichles

  before_create :set_id

  def set_id
    last_id = Operator.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :username, uniqueness: true
  validates :username, :email, :first_name, :last_name, :category_id, :region_id, :province_id, :institute_id, :office_id, presence: true
end
