# -*- encoding : utf-8 -*-
require 'spec_helper'

describe WelcomeController do
  context "routing" do
    it "should route to root" do
      { :get => "/" }.
        should route_to(:controller => "welcome", :action => "index")
    end

    it "should route to imprint" do
      { :get => "/imprint" }.
        should route_to(:controller => "welcome", :action => "imprint")
    end

    it "should route to about" do
      { :get => "/about" }.
        should route_to(:controller => "welcome", :action => "about")
    end
  end

  context "GET :index" do
    before do
      get :index
    end

    it "renders index template" do
      response.should be_successful
      response.should render_template(:index)
    end

    it "assigns json" do
      assigns[:json].should_not be_empty
    end
  end
end
