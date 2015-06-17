class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :user_activity

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :password_confirmation, :current_password) }
    end

    def authenticate_admin!
      unless current_user.admin?
        redirect_to new_user_session_path, flash: { error: "Whoopsay! Looks like you're not an admin." }
      end
    end

    def user_activity
      if current_user && !current_user.new_record?
        current_user.try :touch
      end
    end

    def authenticate_user!
      unless user_signed_in?
        redirect_to new_user_session_path, flash: { error: "Oh noes! You are not authorised." }
      end
    end
end
