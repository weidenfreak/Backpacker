# -*- encoding : utf-8 -*-
class Users::RegistrationsController < Devise::RegistrationsController

  def update
    @user = User.find(current_user.id)

    if @user.update_without_password(params[:user])
      set_flash_message :notice, :updated
    end

    redirect_to edit_user_registration_path
  end

end
