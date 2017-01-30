class Laboratory < ApplicationRecord
  has_one :user
  has_many :sediments
  belongs_to :department
end
