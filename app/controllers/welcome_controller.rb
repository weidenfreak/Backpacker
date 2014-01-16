# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  def index
    @users = User.all
    @json = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow render_to_string(:partial => "/users/partials/infowindow", :locals => { :user => user })
      marker.picture({
        :url => "/assets/maps/#{user.status}-dot.png",
        :width   => 32,
        :height  => 32
      })
      marker.title user.name
      marker.json({ :id => user.id })
    end.to_json
  end

  def imprint
  end

  def about
  end
end

