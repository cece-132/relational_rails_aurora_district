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

Teacher.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false, daycare_id: daycare_1.id)
Teacher.create!(name: "Ms. Erickson", student_count: 6, max_students: 15, enrollment_full: false, daycare_id: daycare_2.id)
Teacher.create!(name: "Ms. Patterson", student_count: 15, max_students: 15, enrollment_full: true, daycare_id: daycare_3.id)
Teacher.create!(name: "Ms. Henderson", student_count: 5, max_students: 15, enrollment_full: false, daycare_id: daycare_2.id)
Teacher.create!(name: "Ms. Blackmon", student_count: 9, max_students: 15, enrollment_full: false, daycare_id: daycare_3.id)
Teacher.create!(name: "Ms. White", student_count: 11, max_students: 15, enrollment_full: false, daycare_id: daycare_1.id)