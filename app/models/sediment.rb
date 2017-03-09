class Sediment < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory

  validates :weight, presence: true
  validates :composition, presence: true
  validates :type, presence: true
end
