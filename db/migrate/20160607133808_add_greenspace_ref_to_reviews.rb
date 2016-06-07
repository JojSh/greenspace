class AddGreenspaceRefToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :greenspace, index: true, foreign_key: true
  end
end
