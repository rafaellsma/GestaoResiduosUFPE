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
          filename: "planilha-residuos.xls",
          type: "application/vnd.ms-excel"
  end

  private

  def generate_spreadsheet(sediments)
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    i = 0
    Sediment.attribute_names.each do |name|
      sheet[0,i] = t("content.sediments.index.#{name}");
      i += 1
    end
    sediments.each_with_index do |sediment, row|
      sediment.attribute_names.each_with_index do |name, column|
        if (name == 'laboratory_id')
          laboratory = sediment.laboratory
          department = laboratory.department
          sheet[row+1, column] = "#{laboratory.name}/#{department.name}/#{department.center.name}"
        elsif (name == 'user_id')
          user = sediment.user
          sheet[row+1, column] = "Nome: #{user.name} Email: #{user.email} Ramal: #{user.phone_ext}"
        else
          sheet[row+1, column] = sediment.send(name)
        end
      end
    end
    sheet = autofit(sheet)
    buffer = StringIO.new
    book.write(buffer)
    buffer.rewind
    buffer.read
  end

  def autofit(worksheet)
    (0...worksheet.column_count).each do |col_idx| 
      column = worksheet.column(col_idx)
      column.width = column.each_with_index.map do |cell, row|
        chars = cell.present? ? cell.to_s.strip.split('').count + 3 : 1
        ratio = worksheet.row(row).format(col_idx).font.size / 10
        (chars * ratio).round
      end.max
    end
  end
end
