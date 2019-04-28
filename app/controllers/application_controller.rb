class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :nickname, :last_name, :first_name, :first_kana, :last_kana, :birth_year_id, :birth_month_id, :birth_day_id, :postal_code, :region_id, :city, :adress, :phone, :building, :card_number, :security_code, :expiration_year_id, :expiration_month_id])
  end

end
