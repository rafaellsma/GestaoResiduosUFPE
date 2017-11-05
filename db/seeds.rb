User.create(name: 'admin', email: "admin@admin.com", password: "admin123", phone_ext: 123, admin: true, approved: true)

book = Spreadsheet.open(Rails.root.to_s+'/db/labs.xls')
sheet = book.worksheet(0)
sheet.each 1 do |row|
  break if row[0].nil?
  center = Center.where(name: row[2]).first_or_create
  unless center.valid?
    p center.errors
    break
  end
  department = Department.where(name: row[3], chief: row[1], center: center).first_or_create
  unless department.valid?
    p department.errors
    break
  end
  laboratory = Laboratory.where(name: row[0], department: department).first_or_create
  unless laboratory.valid?
    p laboratory.errors
    break
  end
end
