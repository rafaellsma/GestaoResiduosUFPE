class Laboratory < ApplicationRecord
  has_one :user
  has_many :sediments
  belongs_to :department

  def amount_sediments(date_initial, date_final, type)
    amount = 0;
    sediments.each do |sediment|
      if ((sediment.data_registered >= date_initial.to_date) && (sediment.data_registered <= date_final.to_date) && (sediment.res_type == type))
        amount += sediment.weight
      end
    end
    amount
  end
end
