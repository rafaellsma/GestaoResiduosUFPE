class Center < ApplicationRecord
  has_many :departments

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    departments.each do |dep|
      amount += dep.amount_sediments(date_initial, date_final, type)
    end
    amount
  end
end
