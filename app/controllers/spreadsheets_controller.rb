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
      if name == 'laboratory_id'
        sheet[0,i] = 'Centro'
        sheet[0,i+1] = 'Departamento'
        sheet[0,i+2] = t("content.sediments.index.#{name}")
        i += 3
      elsif name == 'sediments_collect_id'
        next
      else
        sheet[0,i] = t("content.sediments.index.#{name}")
        i += 1
      end
    end
    sediments.each_with_index do |sediment, row|
      column = 0
      sediment.attribute_names.each_with_index do |name|
        if (name == 'laboratory_id')
          laboratory = sediment.laboratory
          department = laboratory.department
          sheet[row+1, column] = department.center.name
          sheet[row+1, column+1] = department.name
          sheet[row+1, column+2] = laboratory.name
          column += 3
          next
        elsif (name == 'user_id')
          user = sediment.user
          sheet[row+1, column] = "Nome: #{user.name} Email: #{user.email} Ramal: #{user.phone_ext}"
        elsif name == 'sediments_collect_id'
          next
        else
          sheet[row+1, column] = sediment.send(name)
        end
        column += 1
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
