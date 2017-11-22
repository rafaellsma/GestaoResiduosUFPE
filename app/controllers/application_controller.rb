class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :phone_ext, :enrollment, :laboratory_ids => []])
  end

  def after_sign_out_path_for(resource_or_scope)
	  new_user_session_path
	end
end
