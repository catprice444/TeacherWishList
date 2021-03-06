class SchoolsController < ApplicationController
    
    def index 
        @schools = School.all 
    end 
    
    def new 
        @schools = School.all
        @school = School.new
    end 

    def create 
        @school = School.create(school_params)
        @school.save
        redirect_to school_path(@school)
    end 

    def show 
        @school = School.find_by_id(params[:id])
    end 

    def edit 
        @school = School.find_by_id(params[:id])
    end 

    def update 
        @school = School.find_by_id(params[:id])
    end 

   

    private 
    def school_params 
        params.permit(:name, :location)
    end 
end
