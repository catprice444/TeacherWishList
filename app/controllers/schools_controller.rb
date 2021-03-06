class SchoolsController < ApplicationController
    before_action :school_id, only: [:show]

    def index 
        @schools = School.all 
    end 
    
    def new 
        @school = School.new
    end 

    def create 
        @school = School.create(school_params)
        if @school.save
            redirect_to school_path(@school)
        else 
            render :new
        end 
    end 

    def show  
    end 


    private 
    def school_params 
        params.permit(:name, :location)
    end 

    def school_id
        @school = School.find_by_id(params[:id])
    end 
end
