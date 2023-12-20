class Reimbursement < ApplicationRecord
  belongs_to :mission_path, optional: true
  belongs_to :mission_place, optional: true
  belongs_to :mission_reason, optional: true
  belongs_to :mission_structure, optional: true
  belongs_to :operator, optional: true
  belongs_to :transport, optional: true
  belongs_to :veichle, optional: true

  before_create :set_reimbursement_number

  def set_reimbursement_number
    last_reimbursement_number = Reimbursement.maximum(:reimbursement_number)
    self.reimbursement_number = last_reimbursement_number.to_i + 1
  end
end
