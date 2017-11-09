class LaboratoriesUser < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory
end
