class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
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

  def get_laboratories
    laboratories
  end

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    laboratories.each do |lab|
      amount += lab.amount_sediments(date_initial, date_final, type)
    end
    amount
  end
end
