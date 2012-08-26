# -*- encoding : utf-8 -*-
class AddDescriptionAndTaglineToUser < ActiveRecord::Migration
  def change
    add_column :users, :tagline, :string
    add_column :users, :description, :text
  end
end
