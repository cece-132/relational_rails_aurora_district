class DaycareTeachersController < ApplicationController
    def index
        @daycare = Daycare.find(params[:id])
        @teachers = @daycare.teachers
            if params[:student_count]
                student = params[:student_count].to_i
                @teachers = @daycare.teachers.where("student_count > ?", student)
            else
                @teachers = @daycare.teachers
            end
    end

    def new
        @daycare = Daycare.find(params[:id])
    end

    def create
        daycare = Daycare.find(params[:id])
        teachers = daycare.teachers
        new_daycare = daycare.teachers.create!(daycare_teacher_params)


        redirect_to "/daycares/#{daycare.id}/teachers"
    end

    def sort
        @daycare = Daycare.find(params[:id])
        @teachers = @daycare.teachers
    end

    def destroy
        daycare = Daycare.find(params[:id])
        total_teachers = daycare.teachers
        teacher = total_teachers.find(params[:id])
        teacher.destroy
        redirect_to "/daycares/#{daycare.id}/teachers" 
    end

    def daycare_teacher_params
        params.permit(  :name,
                        :student_count,
                        :max_students,
                        :enrollment_full,
                        :daycare_id
                        )   
    end
end