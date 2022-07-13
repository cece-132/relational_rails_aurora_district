require 'rails_helper'

RSpec.describe Daycare do
    describe 'daycare#new' do
        it 'displays a link to create a new daycare record' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
        
            visit "/daycares"
            click_link('New Daycare') 
        
            expect(current_path).to eq('/daycares/new')
        end

        it 'create a new daycare' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
        
            visit "/daycares/new"

            fill_in('Name', with: 'Aurora Arts')
            fill_in('Total teachers', with: 2)
            fill_in('Total students', with: 15)
            fill_in('Enrollment full', with: false)

            click_button('Submit')

            new_daycare_id = Daycare.last.id

            expect(current_path).to eq("/daycares")
            expect(page).to have_content('Aurora Arts')
        end
    end
end
