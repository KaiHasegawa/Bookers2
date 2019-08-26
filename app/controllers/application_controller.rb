class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
protected
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password, :email])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
 end

  def after_sign_in_path_for(resource)
    user_path(@user)
end
def after_log_in_path_for(resource)
    user_path(@user)
end
  def after_sign_out_path_for(resource)
    flash[:success] = '写真を投稿しました'
    root_path
  end
end

