# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: "admin@admin.com", password: "admin123", admin: true, approved: true)
User.create(name: 'test', email: "test10@test.com", password: "test123", phone_ext: 123, laboratory_id: 1)
User.create(name: 'test2', email: "test11@test.com", password: "test123", phone_ext: 123, laboratory_id: 1)
User.create(name: 'test2', email: "test12@test.com", password: "test123", phone_ext: 123, laboratory_id: 1)
User.create(name: 'test3', email: "test13@test.com", password: "test123", phone_ext: 123, laboratory_id: 1)
