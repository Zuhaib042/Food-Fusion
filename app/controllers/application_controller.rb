class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password confirm_password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[name password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name email password current_password])
  end
end
