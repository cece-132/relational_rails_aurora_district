require 'rails_helper'

RSpec.describe Daycare do
    describe 'daycares#show' do
        it 'can show the daycare name' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}"

            expect(page).to have_content(daycare_1.name)
        end

        it 'can show the total teachers in the school (be sure that there is a button to see teacher table)' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}"

            expect(page).to have_content(daycare_1.teachers.count)
        end

        it 'can show the total students in the school' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}"

            expect(page).to have_content(daycare_1.total_students)
        end

        it 'can show if the enrollement is full in the school' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}"

            expect(page).to have_content("The enrollment is currently still accepting students")
        end

        it 'displays the total number of teachers in the daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)

            visit "/daycares/#{daycare_1.id}"

            expect(page).to have_content("Aurora's Promise has 1 Teachers on Staff")
        end
    end
end

