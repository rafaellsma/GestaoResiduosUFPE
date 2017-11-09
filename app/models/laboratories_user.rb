class LaboratoriesUser < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory

  enum status: [ :disapproved, :approved ]
end
