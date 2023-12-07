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
end
