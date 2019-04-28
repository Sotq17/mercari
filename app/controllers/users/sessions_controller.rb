class Users::SessionsController < Devise::SessionsController
  def index
  	@user = User.new
  end

   # methodをオーバーライドする。
  def configure_permitted_parameters
    sign_in_params = [:email, :password, :remember_me]
    # account_update, sign_in, sign_up, のフィールドを再定義
    devise_parameter_sanitizer.permit(:sign_in, keys: sign_in_params)
  end

  protected

  def after_sign_in_path_for(resource)
    root_path(resource)
  end
end
