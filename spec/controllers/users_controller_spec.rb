# -*- encoding : utf-8 -*-
require 'spec_helper'

describe UsersController do

  let(:user) { user = FactoryGirl.create(:user) }

  before do
    sign_in user
    User.expects(:find).with(user.id.to_s).returns(user)
  end

  describe "GET :show" do
    before do
      get :show, :id => user.id
    end

    it "is successful" do
      response.should be_success
    end

    it "assigns a user" do
      assigns[:user].should be_a(User)
    end
  end

  describe "PUT :update" do
    let(:parameter) { @parameter = FactoryGirl.attributes_for(:user).with_indifferent_access }

    context "successful" do
      before do
        user.expects(:update_attributes).with(parameter).returns(true)
        put :update, :id => user.id, :user => parameter
      end

      it "is successful" do
        response.should be_success
      end

      it "sets flash notice" do
        flash[:notice].should_not be_empty
      end

      it "assigns a user" do
        assigns[:user].should be_a(User)
      end
    end

    context "failing" do
      before do
        user.expects(:update_attributes).with(parameter).returns(false)
        put :update, :id => user.id, :user => parameter
      end

      it "sets flash notice" do
        flash[:alert].should_not be_empty
      end
    end

  end
end
