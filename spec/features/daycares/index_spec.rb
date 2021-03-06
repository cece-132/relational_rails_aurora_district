require 'rails_helper'

RSpec.describe Daycare do
    describe 'daycares#index' do
        it 'displays each daycare name' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares"
            expect(page).to have_content(daycare_1.name)
        end 
        
        it 'displays daycare names in ascending order by creation' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            
            visit "/daycares"

            expect(page).to have_content(daycare_1.name)

            daycare_2 = Daycare.create!(name: "Little Tykes - Aurora", total_teachers: 10, total_students: 150, enrollment_full: false)

            visit "/daycares"
            
            expect(page).to have_content(daycare_1.name)
            expect(page).to have_content(daycare_2.name)

        end
        
        it 'displays a link to create a new daycare record' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares"
            click_link('New Daycare') 

            expect(current_path).to eq('/daycares/new')
        end

        it 'displays a link to edit the details of the daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares"
            expect(page).to have_content("Aurora's Promise - Edit")
            
            click_link "Edit"
            expect(current_path).to eq("/daycares/1/edit")
        end

        it 'displays a delete link for every daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            visit "/daycares"

            expect(page).to have_content("Aurora's Promise")

            click_link "Delete"

            expect(current_path).to eq("/daycares")
            expect(page).to_not have_content("Aurora's Promise")
        end

    end
end