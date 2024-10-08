class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  #redirects if login is success
  def after_sign_in_path_for(resource)
    tasks_path(resource)
  end

end
