# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
@daycare_2 = Daycare.create!(name: "Little Tykes - Aurora", total_teachers: 10, total_students: 150, enrollment_full: false)
@daycare_3 = Daycare.create!(name: "Einstein's Daycare", total_teachers: 8, total_students: 120, enrollment_full: false)