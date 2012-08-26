# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find params[:id]
    @json = User.all.to_gmaps4rails
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(params[:user])
      flash[:notice] = "Saved successfully!"
    else
      flash[:alert] = "Saving changes failed!"
    end
  end

  def gmaps4rails_infowindow
    "<strong>#{self.name}</strong>
    <p>#{self.tagline}</p>
    <p>Current User: #{current_user}</p>"
  end

end
