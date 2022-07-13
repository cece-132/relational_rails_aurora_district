require 'rails_helper'

RSpec.describe "DaycareTeachers" do
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

        it 'displays the enrollment status of each teacher'
    end
end