class SchoolsController < ApplicationController
    before_action :find_item_id, only: [:show, :edit, :update]

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
            render 'new'
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
    end 

    private 
    def school_params 
        params.permit(:name, :location)
    end 

    def find_school_id
        @school = School.find_by(id: params[:id])
        if !@school
          flash[:msg] = "School was not found"
          redirect_to items_path
        end
    end
end
