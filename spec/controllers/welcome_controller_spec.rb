# -*- encoding : utf-8 -*-
require 'spec_helper'

describe WelcomeController do
  context "routing" do
    it "should route to root" do
      { :get => "/" }.
        should route_to(:controller => "welcome", :action => "index")
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
