module ApplicationHelper
  def calculate_total_weight
    @total_weight = Laboratory.all.map(&:total_weight).reduce(0, :+)
    @total_weight_percent = (@total_weight/7000)*100
  end
end
