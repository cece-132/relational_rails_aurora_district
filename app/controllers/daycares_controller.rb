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
        daycare = Daycare.create(daycare_params)
        redirect_to "/daycares"
    end

    def edit
        @daycare = Daycare.find(params[:id])
    end

    def update
        daycare = Daycare.find(params[:id])
        daycare.update(daycare_params)
        redirect_to "/daycares/#{daycare.id}"
    end

    def destroy
        daycare = Daycare.find(params[:id])
        daycare.destroy
        redirect_to "/daycares"   
    end

    def daycare_params
        params.permit(  :name,
                        :total_students,
                        :total_teachers,
                        :enrollment_full
                        )   
    end
end