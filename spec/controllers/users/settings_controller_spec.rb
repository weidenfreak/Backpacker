# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Users::SettingsController do

  describe "PUT:update" do

    before do
      login_user
      User.any_instance.expects(:update_with_password).returns(true)
      Users::SettingsController.any_instance.expects(:sign_in)

      put :update
    end

    it "renders edit template" do
      response.should render_template("users/settings/edit")
    end

    it "assigns a user" do
      assigns[:user].should be_a(User)
    end

    it "sets flash notice" do
      flash[:notice].should_not be_empty
    end
  end

end
