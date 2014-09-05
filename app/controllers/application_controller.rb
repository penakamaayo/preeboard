class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected
  
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) do |u|
  		u.permit(:first_name, :last_name, :course, :school, :email, :password, :password_confirmation)
  	end
  	devise_parameter_sanitizer.for(:account_update) do |u|
  		u.permit(:first_name, :last_name, :course, :school, :email, :username, :password, :password_confirmation, :current_password, :profile_photo)
  	end
  end

  def configure_devise_permitted_parameters
  	registration_params = [:first_name, :last_name, :course, :school, :email, :username, :password, :password_confirmation]

  	if params[:action] == 'update'
  		devise_parameter_sanitizer.for(:account_update) { 
  			|u |u.permit(:first_name, :last_name, :short_bio, :email, :username, :password, :password_confirmation, :current_password)
  			# |u| u.permit(registration_params << :current_password)
  		}
  	elsif params[:action] == 'create'
  		devise_parameter_sanitizer.for(:sign_up) { 
  			|u| u.permit(registration_params) 
  		}
  	end
  end

  def after_sign_in_path_for(resource) 
    # session["user_return_to"] || profile_index_url
    case resource
    when User then home_index_url
    when Admin then dashboard_index_url
    end
  end 

  def after_sign_out_path_for(resource_or_scope)
  	new_user_session_path
  end


end
