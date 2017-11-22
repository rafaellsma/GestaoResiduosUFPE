class Department < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { scope: [:center_id, :chief] }
  belongs_to :center
  has_many :laboratories

  def self.with_laboratories_avaiable_from_center(center)
    self.joins(:laboratories)
      .includes(laboratories: :user)
      .where(users: { id: nil }, center: center)
  end

  def self.with_laboratories(center)
    self.includes(:laboratories)
  end

  def total_weight
    laboratories.map{|x| x.total_weight}.reduce(0, :+)
  end

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    laboratories.each do |lab|
      amount += lab.amount_sediments(date_initial, date_final, type)
    end
    amount
  end
end
