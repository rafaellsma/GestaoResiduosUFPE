class Center < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :departments

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    departments.each do |dep|
      amount += dep.amount_sediments(date_initial, date_final, type)
    end
    amount
  end

  def get_departments
    departments
  end

  def self.with_laboratories_avaiable
    self.joins(departments: :laboratories).includes(departments: [laboratories: :user]).where(users: {id: nil})
  end
end
