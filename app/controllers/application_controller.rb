class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    #会員登録の時の許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image_name])

    #アカウントの変更時の許可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end