class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    before_action :require_login

    def current_user 
      @current_user ||= User.find_by(id: session[:id])
    end 

    def logged_in?
      !!session[:id]
    end
  
    private 
    

    def require_login
      redirect_to root_path if !logged_in?
    end 

    

end
