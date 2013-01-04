# -*- encoding : utf-8 -*-
class WelcomeController < ApplicationController
  def index
    @json = User.all.to_gmaps4rails do |user, marker|
      marker.infowindow render_to_string(:partial => "/users/partials/infowindow", :locals => { :user => user })
      marker.picture({
        :picture => "/assets/maps/#{user.status}-dot.png",
        :width   => 32,
        :height  => 32
      })
      marker.title user.name
      marker.json({ :id => user.id })
    end
  end

  def imprint
  end

  def about
  end
end
