class TeachersController < ApplicationController
    def index
        @teachers = Teacher.all
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def update
        teacher = Teacher.find(params[:id])
        teacher.update(teacher_params)
        redirect_to "/teachers"
    end

    def destroy
        teacher = Teacher.find(params[:id])
        teacher.destroy
        redirect_to "/teachers" 
    end

    def teacher_params
        params.permit(  :name,
                        :student_count,
                        :max_students,
                        :enrollment_full,
                        :daycare_id
                        )   
    end
end