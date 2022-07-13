class DaycaresController < ApplicationController
    def index
        @daycares = Daycare.all
    end

    def show
        @daycare = Daycare.find(params[:id])
    end

    def new
    end

    def create
        daycare = Daycare.create(   name: params[:name], 
                                    total_teachers: params[:total_teachers],
                                    total_students: params[:total_students],
                                    enrollment_full: params[:enrollment_full]
                                    )
        redirect_to "/daycares"
    end
end