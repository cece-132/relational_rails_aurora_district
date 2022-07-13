class DaycareTeachersController < ApplicationController
    def index
        @daycare = Daycare.find(params[:id])
        @teachers = @daycare.teachers
    end
end