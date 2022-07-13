require 'rails_helper'

RSpec.describe Teacher do
    describe 'teachers#index' do
        it 'displays all the teachers in the district' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 15, max_students: 15, enrollment_full: true)
            
            visit "/teachers"

            expect(page).to have_content(teacher_1.name)
        end

        it 'displays only the teachers full enrollment' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            daycare_2 = Daycare.create!(name: "Aurora Arts", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_2 = daycare_1.teachers.create!(name: "Ms. White", student_count: 15, max_students: 15, enrollment_full: true)

            visit "/teachers"

            expect(page).to have_content("Ms. White")
            expect(page).to_not have_content("Ms. Johnson")
        end

        it 'displays the edit button next to the teacher name' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            daycare_2 = Daycare.create!(name: "Aurora Arts", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_2 = daycare_1.teachers.create!(name: "Ms. White", student_count: 15, max_students: 15, enrollment_full: true)

            visit "/teachers"
            expect(page).to have_content("Ms. White - Edit")

            click_on "Edit"
            expect(current_path).to eq("/teachers/#{teacher_2.id}/edit")
        end

    end
end