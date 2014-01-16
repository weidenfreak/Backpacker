# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  include UserStatus
  STATUS = [UserStatus::STUCK, UserStatus::SOON_FREE, UserStatus::FREE]

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me,
    :latitude, :longitude, :gmaps, :tagline, :description, :status

end
