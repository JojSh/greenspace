class AddDescriptionToGreenspaces < ActiveRecord::Migration
  def change
    add_column :greenspaces, :description, :text
  end
end
