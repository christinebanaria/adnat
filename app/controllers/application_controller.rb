class ApplicationController < ActionController::Base

  def authentication_required!
    session[:user_id] || raise(ApplicationNotAuthenticated)
  end
  
  protect_from_forgery with: :exception
  
end
