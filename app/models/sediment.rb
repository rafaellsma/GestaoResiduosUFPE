class Sediment < ApplicationRecord
  belongs_to :user
  belongs_to :laboratory

  validates :weight, presence: true
  validates :composition, presence: true
  validates :local, presence: true
  validates :data_created, presence: true
end
