class Laboratory < ApplicationRecord
  belongs_to :user, optional: true
  has_many :sediments
  has_many :sediments_collects
  belongs_to :department

  def self.avaiables
    self.where(user: nil)
  end

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    sediments.each do |sediment|
      if ((sediment.data_registered >= date_initial.to_date) && (sediment.data_registered <= date_final.to_date) && (sediment.res_type == type))
        amount += sediment.weight
      end
    end
    amount
  end

  def department_name
    department.name
  end

  def center_name
    department.center.name
  end

  def total_weight
    sediments.map{ |a| a.sediments_collect.blank? ? a.weight : 0}.reduce(0,:+)
  end
end
