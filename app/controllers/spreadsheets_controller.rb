class SpreadsheetsController < ApplicationController
  def create
    initial_date = params[:initial_date]
    final_date = params[:final_date]
    sediments = Sediment.where(
      "data_registered >= ? AND data_registered <= ?",
      initial_date,
      final_date
    )
    send_data generate_spreadsheet(sediments),
          filename: "planilha-residuos.pdf",
          type: "application/vnd.ms-excel"
  end

  private

  def generate_spreadsheet(sediments)
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    
  end
end
