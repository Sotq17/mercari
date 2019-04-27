class Users::SessionsController < Devise::SessionsController
  def index
  	@user = User.new
  end
end
