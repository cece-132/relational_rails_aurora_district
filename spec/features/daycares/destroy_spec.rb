require 'rails_helper'

RSpec.describe DaycaresController do
    describe 'daycare#destroy' do
        it 'can destroy a daycare and its teachers' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 15, max_students: 15, enrollment_full: true)

            visit "/daycares/#{daycare_1.id}"

            click_link "Delete Daycare"

            expect(current_path).to eq("/daycares")
            expect(page).to_not have_content("Aurora's Promise") 
        end
    end
end