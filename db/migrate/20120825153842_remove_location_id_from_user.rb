# -*- encoding : utf-8 -*-
class RemoveLocationIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :location_id
  end
end
