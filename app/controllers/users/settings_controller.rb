# -*- encoding : utf-8 -*-
class Users::SettingsController < ApplicationController
  before_filter :authenticate_user!, :find_user

  def update
    if @user.update_with_password(params[:user])

      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      flash[:notice] = "Your password was changed successfully."
    end
    render "users/settings/edit"
  end

private
  def find_user
    @user = User.find(current_user.id)
  end

end
