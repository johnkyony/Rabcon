class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout "material_ui_kit"
  before_action :authenticate_user!

  
  
  
  protected
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  
  
  def after_sign_in_path_for(resource)
   if resource.client?
    clients_path
   else
    if resource.staff?
      staffs_path
    else
     if resource.admin?
       admins_path
     else
      landing_pages_path
     end
    end
   end
  end
end
