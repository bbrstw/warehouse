class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_schema, :authenticate_user!, :set_mailer_host
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :image, :image_cache)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password_confirmation, :current_password, :image, :image_cache)}
    devise_parameter_sanitizer.for(:accept_invitation).concat [:first_name, :last_name]
    devise_parameter_sanitizer.for(:accept_invitation) do |u| u.permit(:first_name, :last_name, :email, :image, :password, :password_confirmation, :invitation_token) end
  end
  
private
  def load_schema
    Apartment::Tenant.switch('public')
    return unless request.subdomain.present?
    
    if current_account
      Apartment::Tenant.switch(current_account.subdomain)
    else
      redirect_to root_url(subdomain: false)
    end
  end  

  def current_account
    @current_account ||= Account.find_by(subdomain: request.subdomain)
  end
  helper_method :current_account
  
  def set_mailer_host
    subdomain = current_account ? "#{current_account.subdomain}." : ""
    ActionMailer::Base.default_url_options[:host] = "#{subdomain}lvh.me:3000"
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
  def after_invite_path_for(resource)
    users_path
  end
  
end
