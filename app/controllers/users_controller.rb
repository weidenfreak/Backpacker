# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find params[:id]
    @json = User.all.to_gmaps4rails do |user, marker|
      marker.infowindow render_to_string(:partial => "/users/partials/infowindow", :locals => { :user => user })
      #marker.picture({
        #:picture => avatar_url(user),
        #:width   => 32,
        #:height  => 32
      #})
      marker.title user.name
      marker.json({ :id => user.id })
    end
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
