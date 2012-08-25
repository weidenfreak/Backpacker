# -*- encoding : utf-8 -*-
class AddUserIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :integer
  end
end
