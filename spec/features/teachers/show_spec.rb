require 'rails_helper'

RSpec.describe Teacher do
    describe 'teachers#show' do
        it "displays the teacher name" do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            visit "/teachers/#{teacher_1.id}"

            expect(page).to have_content(teacher_1.name)
        end
        it "displays the number of students that the students have" do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            visit "/teachers/#{teacher_1.id}"

            expect(page).to have_content(teacher_1.max_students)
        end
        it "displays if this teacher does not have full enrollment" do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            visit "/teachers/#{teacher_1.id}"

            expect(page).to have_content("This teacher still has room for more students")
        end

        it "displays if this teacher has full enrollment" do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 15, max_students: 15, enrollment_full: true)

            visit "/teachers/#{teacher_1.id}"

            expect(page).to have_content("This teacher does NOT have the capcity for more students")
        end

        it "displays the daycare id" do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            visit "/teachers/#{teacher_1.id}"

            expect(page).to have_content(teacher_1.daycare_id)
        end

        
    end
end