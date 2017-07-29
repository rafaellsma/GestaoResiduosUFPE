# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c = Center.create(name: 'cin')
d = Department.create(name: 'dep 1', center: c)
l = Laboratory.create(name: 'lab1', department: d)

User.create(name: 'admin', email: "admin@admin.com", password: "admin123", phone_ext: 123, admin: true, approved: true)
User.create(name: 'test', email: "test10@test.com", password: "test123", enrollment: 12313, phone_ext: 123, laboratory: l)
User.create(name: 'test2', email: "test11@test.com", password: "test123", enrollment: 12314, phone_ext: 123, laboratory: l)
User.create(name: 'test2', email: "test12@test.com", password: "test123", enrollment: 12315, phone_ext: 123, laboratory: l)
User.create(name: 'test3', email: "test13@test.com", password: "test123", enrollment: 12316, phone_ext: 123, laboratory: l)
