class DaycareTeachersController < ApplicationController
    def index
        @daycare = Daycare.find(params[:id])
        @teachers = @daycare.teachers
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

    def daycare_teacher_params
        params.permit(  :name,
                        :student_count,
                        :max_students,
                        :enrollment_full,
                        :daycare_id
                        )   
    end
end