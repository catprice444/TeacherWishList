class SchoolsController < ApplicationController
    
    def new 
        @school = School.new
    end 

    def create 
        @school = School.create(school_params)
    end 

    def show 
        @school = School.find(params[:id])
    end 

    def edit 
        @school = School.find(params[:id])
    end 

    def update 
        @school = School.find(params[:id])
    end 

    private 
    def school_params 
        params.require(:school).permit(:name, :location)
    end 
end
