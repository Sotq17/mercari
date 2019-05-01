class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :check_captcha, only: [:create]
	def new
	end

  def input_info
      @user = User.new
  end

  def create
    @user = User.new(create_params)
    if !verify_recaptcha(model: @user) || !@user.save
      render "new"
    end
  end


  private
  def create_params
      params.require(:user).permit(:email, :password, :nickname, :last_name, :first_name, :first_kana, :last_kana, :birth_year_id, :birth_month_id, :birth_day_id, :postal_code, :region_id, :city, :adress, :phone, :building, :card_number, :security_code, :expiration_year_id, :expiration_month_id)
  end

   def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end
end
