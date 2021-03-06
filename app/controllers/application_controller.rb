class ApplicationController < ActionController::Base
    helper_method :current_user
    

    def current_user 
        @current_user ||= User.find_by_id(session[:user_id])
      end 
  
   
  
    private 
    def require_login
      redirect_to root_path unless current_user
    end 
end
