require 'rails_helper'

RSpec.describe DaycareTeachersController do
    describe 'daycareteachers#index' do
        it 'displays all the names of the teachers associated with the daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)
            teacher_6 = daycare_1.teachers.create!(name: "Ms. White", student_count: 11, max_students: 15, enrollment_full: false)

            daycare_2 = Daycare.create!(name: "Little Tykes - Aurora", total_teachers: 10, total_students: 150, enrollment_full: false)

            teacher_2 = daycare_2.teachers.create!(name: "Ms. Erickson", student_count: 6, max_students: 15, enrollment_full: false)
            teacher_4 = daycare_2.teachers.create!(name: "Ms. Henderson", student_count: 5, max_students: 15, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}/teachers"

            expect(page).to have_content(teacher_1.name)
            expect(page).to have_content(teacher_6.name)
        end

        it 'can create new teachers for a daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)
            teacher_6 = daycare_1.teachers.create!(name: "Ms. White", student_count: 11, max_students: 15, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}/teachers"

            click_button 'Create Teacher'

            expect(current_path).to eq("/daycares/#{daycare_1.id}/teachers/new")

            fill_in('Name', with: 'Mr. Anderson')
            fill_in('Student count', with: 10)
            fill_in('Max students', with: 15)
            fill_in('Enrollment full', with: false)
            fill_in('Daycare', with: daycare_1.id)

            click_button 'Create Teacher'

            expect(current_path).to eq("/daycares/#{daycare_1.id}/teachers")
            expect(page).to have_content('Mr. Anderson')
        end

        it 'can sort alphabetically' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_6 = daycare_1.teachers.create!(name: "Ms. White", student_count: 15, max_students: 15, enrollment_full: true)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 15, max_students: 15, enrollment_full: true)

            visit "/daycares/#{daycare_1.id}/teachers"

            click_link "Sort alphabetically"

            expect(current_path).to eq("/daycares/#{daycare_1.id}/teachers/sort")
            expect(page).to have_content("Ms. Johnson")
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
