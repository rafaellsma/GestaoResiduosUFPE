# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c = Center.create(name: 'Centro de Informatica')
d = Department.create(name: 'Departamento de Informação e Sistemas', center: c)
l = Laboratory.create(name: 'Laboratório de Hardware', department: d)

c1 = Center.create(name: 'Centro de Tecnologia e Geociẽncias')
c2 = Center.create(name: 'Centro de Biociẽncias')
c3 = Center.create(name: 'Centro de Química')

d1 = Department.create(name: 'Departamento de Engenharias', center: c1)
d2 = Department.create(name: 'Departamento de Biotecnologia', center: c2)
d3 = Department.create(name: 'Departamento de Engenharia Química', center:c3)

Laboratory.create(name: 'Laboratório de Mecatrônica', department: d1)
Laboratory.create(name: 'Laboratório de Biotecnologia A', department: d2)
Laboratory.create(name: 'Laboratório de Química Industrial', department: d3)

User.create(name: 'admin', email: "admin@admin.com", password: "admin123", phone_ext: 123, admin: true, approved: true)
