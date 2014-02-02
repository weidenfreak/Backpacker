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
    :latitude, :longitude, :gmaps, :tagline, :description, :status, :address

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  before_validation :geocode, :reverse_geocode

  validates :email, presence: :true
  validate :location_needs_to_be_in_nz

  def location_needs_to_be_in_nz
    if latitude.present? && longitude.present? && ((latitude < -46) || (latitude > -34)) && ((longitude < 165) || (longitude > 180))
      errors.add(:address, "can't be outside of New Zealand. If you're not in New Zealand yet, just choose the city you arrive in.")
    end
  end

end
