# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:notice] = "Saved successfully!"
    else
      flash[:alert] = "Saving changes failed!"
    end
  end

end
