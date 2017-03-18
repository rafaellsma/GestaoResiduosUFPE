class ReportsController < ApplicationController
	def generate
		@sediments = []
	end

	def create
		conv_date = "15/12/2016".to_date
		@sediments = Sediment.where("data_created >= ? AND data_created <= ?", params[:initial_date], params[:final_date])
		render '/reports/generate'
	end
end
