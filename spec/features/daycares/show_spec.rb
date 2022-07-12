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

            expect(page).to have_content(daycare_1.total_teachers)
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
    end
end

