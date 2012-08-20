# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UsersController do

  let(:user) { user = FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "GET :show" do
    before do
      User.expects(:find).with(user.id.to_s).returns(user)
      get :show, :id => user.id
    end

    it "is successful" do
      response.should be_success
    end

    it "assigns a user" do
      assigns[:user].should be_a(User)
    end

  end
end
