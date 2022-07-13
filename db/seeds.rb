# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
daycare_2 = Daycare.create!(name: "Little Tykes - Aurora", total_teachers: 10, total_students: 150, enrollment_full: false)
daycare_3 = Daycare.create!(name: "Einstein's Daycare", total_teachers: 8, total_students: 120, enrollment_full: false)

teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)
teacher_2 = daycare_2.teachers.create!(name: "Ms. Erickson", student_count: 6, max_students: 15, enrollment_full: false)
teacher_3 = daycare_3.teachers.create!(name: "Ms. Patterson", student_count: 15, max_students: 15, enrollment_full: true)
teacher_4 = daycare_2.teachers.create!(name: "Ms. Henderson", student_count: 5, max_students: 15, enrollment_full: false)
teacher_5 = daycare_3.teachers.create!(name: "Ms. Blackmon", student_count: 9, max_students: 15, enrollment_full: false)
teacher_6 = daycare_1.teachers.create!(name: "Ms. White", student_count: 11, max_students: 15, enrollment_full: false)