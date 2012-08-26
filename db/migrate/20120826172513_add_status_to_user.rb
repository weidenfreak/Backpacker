# -*- encoding : utf-8 -*-
class AddStatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
  end
end
