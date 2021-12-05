class ApplicationController < ActionController::Base
  before_action :authenticate_user_profile!

  

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :breeder_true, :home_activity_level, :children_present, :cat_present, :home_location])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username, :breeder_true, :home_activity_level, :children_present, :cat_present, :home_location])
  end
end
