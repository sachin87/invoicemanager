class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

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

end
