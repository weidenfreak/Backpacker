# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Users::RegistrationsController do

  describe "PUT:update" do

    before do
      login_user
      User.any_instance.expects(:update_without_password).returns(true)

      put :update
    end

    it "redirects to edit registrations" do
      response.should redirect_to(edit_user_registration_path)
    end

    it "assigns a user" do
      assigns[:user].should be_a(User)
    end

    it "sets flash notice" do
      flash[:notice].should_not be_empty
    end
  end

end
