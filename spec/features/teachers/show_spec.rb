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

        it 'can update a teachers information' do
            daycare_1 = Daycare.create!(name: "Aurora's Promise", total_teachers: 15, total_students: 225, enrollment_full: false)
            teacher_1 = daycare_1.teachers.create!(name: "Ms. Johnson", student_count: 8, max_students: 15, enrollment_full: false)
            
            visit "/teachers/#{teacher_1.id}"

            click_button 'Update Teacher'

            expect(current_path).to eq("/teachers/#{teacher_1.id}/edit")

            fill_in('Name', with: 'Mr. Anderson')
            fill_in('Student count', with: 15)
            fill_in('Max students', with: 15)
            fill_in('Enrollment full', with: true)
            fill_in('Daycare', with: daycare_1.id)

            click_button 'Update Teacher'

            expect(current_path).to eq("/teachers")
            expect(page).to have_content('Mr. Anderson')
            expect(page).to_not have_content('Ms. Johnson')
        end
        
    end
end