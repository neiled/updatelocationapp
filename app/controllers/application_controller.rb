class ApplicationController < ActionController::Base

  helper :all

  protect_from_forgery

  filter_parameter_logging "password" unless Rails.env.development?
  
  def authentication_succeeded(message = 'Twitter has logged you in.', destination = '/')
    flash[:notice] = message
    logger.debug "Im in my method"
    redirect_back_or_default destination  
  end  

end
