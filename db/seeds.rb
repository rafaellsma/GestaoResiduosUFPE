# c = Center.create(name: 'Centro de informática')
# d = Department.create(name: 'Departamento de Informação e Sistemas', center: c)
# l = Laboratory.create(name: 'Laboratório de Hardware', department: d)
#
# User.create(name: 'admin', email: "admin@admin.com", password: "admin123", phone_ext: 123, admin: true, approved: true)
book = Spreadsheet.open(Rails.root.to_s+'/db/labs.xls')
p book
