require 'rails_helper'

RSpec.describe Teacher do
    describe 'teachers#index' do
        it 'displays all the teachers in the district' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)

            teacher_1 = Teacher.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false, daycare_id: daycare_1.id)

            visit "/teachers"
            expect(page).to have_content(teacher_1.name)
        end
        #Below if for the show_spec
        # it 'displays the max number of students per class'
        # it 'display enrollment status'
        # it 'displays which school the student belongs to'
    end
end