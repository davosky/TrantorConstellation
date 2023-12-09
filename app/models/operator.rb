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
  has_many :transports
  has_many :mission_paths
  has_many :mission_places
  has_many :mission_structures
  has_many :mission_reasons
  has_many :mission_structures

  mount_uploader :signature, SignatureUploader
  mount_uploader :validator_signature, ValidatorSignatureUploader
  mount_uploader :organizational_signature, OrganizationalSignatureUploader

  before_create :set_id

  def set_id
    last_id = Operator.maximum(:id)
    self.id = last_id.to_i + 1
  end

  validates :username, uniqueness: true
  validates :username, :email, :first_name, :last_name, :category_id, :region_id, :province_id, :institute_id, :office_id, presence: true

  validates_integrity_of :signature, :validator_signature, :organizational_signature
  validates_processing_of :signature, :validator_signature, :organizational_signature

  private

  def signature_size_validation
    errors[:signature] << "il file deve pesare meno di 5Mb" if signature.size > 5.0.megabytes
  end

  def validator_signature_size_validation
    errors[:validator_signature] << "il file deve pesare meno di 5Mb" if signature.size > 5.0.megabytes
  end

  def organizational_signature_size_validation
    errors[:organizational_signature] << "il file deve pesare meno di 5Mb" if signature.size > 5.0.megabytes
  end
end
