# -*- encoding : utf-8 -*-
require 'spec_helper'

describe WelcomeController do
  context "routing" do
    it "should route to root" do
      { :get => "/" }.
        should route_to(:controller => "welcome", :action => "index")
    end
  end
end
