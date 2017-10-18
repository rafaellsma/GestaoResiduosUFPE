class SedimentsCollect < ApplicationRecord
  has_many :sediments
  belongs_to :laboratory
  validates :sediments, presence: true;
  def total_weight
    sediments.map{|a| a.weight.to_f}.reduce(0, :+)
  end

  def total_weight_percent
    (total_weight/7000)*100
  end
end
