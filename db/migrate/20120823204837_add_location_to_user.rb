# -*- encoding : utf-8 -*-
class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :location_id, :integer
  end
end
