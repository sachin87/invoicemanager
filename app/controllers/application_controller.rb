class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  rescue_from StateMachine::InvalidTransition do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  def layout_by_resource
    if devise_controller?
      "simple-layout"
    else
      "application"
    end
  end 

  protected

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name)
  end

end
