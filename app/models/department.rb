class Department < ApplicationRecord
  belongs_to :center
  has_many :laboratories

  def self.with_laboratories_avaiable_from_center(center)
    self.includes(laboratories: :user).where(users: { id: nil }, center: center)
  end

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    laboratories.each do |lab|
      amount += lab.amount_sediments(date_initial, date_final, type)
    end
    amount
  end
end
