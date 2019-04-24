class Users::RegistrationsController < Devise::RegistrationsController

	def new
	end

  def input_info
      @user = User.new
  end

  def create
     @user = User.new(create_params)
     @user.save
     redirect_to root_path
  end

  private
  def create_params
      params.require(:user).permit(:password, :nickname, :email, :last_name, :first_name, :first_kana, :last_kana, :birth_year_id, :birth_month_id, :birth_day_id, :region_id)
  end
end
