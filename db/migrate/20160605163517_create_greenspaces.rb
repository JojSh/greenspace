class CreateGreenspaces < ActiveRecord::Migration
  def change
    create_table :greenspaces do |t|
      t.string :name
      t.integer :rating

      t.timestamps null: false
    end
  end
end
