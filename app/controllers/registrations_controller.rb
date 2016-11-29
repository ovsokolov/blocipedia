class RegistrationsController < Devise::RegistrationsController
  @switch_to_premium
  def update

    if ((current_user == nil || current_user.premium_plan == 0) && params[:user][:premium_plan] == "1")
      @switch_to_premium = 1
    else
      @switch_to_premium = 0
    end
    super
  end
  private

  def sign_up_params
    params.require(:user).permit(:premium_plan, :name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:premium_plan, :name, :email, :password, :password_confirmation, :current_password)
  end

  def after_update_path_for(resource)
    if(@switch_to_premium == 1)
      flash[:notice] = "Premium plan requires payment. Please pay using button bellow."
      new_charge_path
    else
      if(!current_user.admin? && !current_user.standard? && User.find(current_user).premium_plan == 0)
        current_user.standard!
      end
      wikis_path
    end
  end
end
