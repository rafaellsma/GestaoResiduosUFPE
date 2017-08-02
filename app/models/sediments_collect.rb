class SedimentsCollect < ApplicationRecord
  has_many :sediments

  def total_weight
    sediments.map{|a| a.weight.to_f}.reduce(0, :+)
  end

  def total_weight_percent
    (total_weight/7000)*100
  end
end
