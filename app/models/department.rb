class Department < ApplicationRecord
  belongs_to :center
  has_many :laboratories

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    laboratories.each do |lab|
      amount += lab.amount_sediments(date_initial, date_final, type)
    end
    amount
  end

  def center_name
    center.name
  end
end
