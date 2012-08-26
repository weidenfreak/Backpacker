# -*- encoding : utf-8 -*-
class AddLatLongToUser < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :gmaps, :boolean
  end
end
